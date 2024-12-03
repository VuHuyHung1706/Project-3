package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT customer.* FROM customer");
        StringBuilder join = new StringBuilder("");
        StringBuilder where = new StringBuilder(" WHERE 1=1");
        queryJoin(customerSearchRequest, join);
        queryNormal(customerSearchRequest, where);
        sql.append(join).append(where).append(" GROUP BY customer.id");

        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);

        return query.getResultList();
    }

    public void queryJoin(CustomerSearchRequest customerSearchRequest, StringBuilder join) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            join.append(" JOIN assignmentcustomer ON customer.id = assignmentcustomer.customerid");
        }

    }

    public void queryNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        Field[] fields = customerSearchRequest.getClass().getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);  // Allow access to private fields
            String fieldName = field.getName();
            try {
                Object value = field.get(customerSearchRequest);
                if (value != null && !value.equals("")) {
                    if (fieldName.equals("staffId")) {
                        where.append(" AND assignmentcustomer.staffid = ").append(value).append(" ");
                    }
                    else {
                    where.append(" AND customer.").append(fieldName).append(" LIKE '%").append(value).append("%' ");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        where.append(" AND customer.is_active = 1");
    }

    @Override
    public int countTotalItems(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        List<CustomerEntity> customerEntities = findAll(customerSearchRequest, pageable);
        return customerEntities.size();
    }
}
