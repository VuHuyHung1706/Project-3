package com.javaweb.repository.custom.impl;


import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.javaweb.repository.custom.BuildingRepositoryCustom;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT building.* FROM building");
        StringBuilder join = new StringBuilder("");
        StringBuilder where = new StringBuilder(" WHERE 1=1");
        queryJoin(buildingSearchRequest, join);
        querySpecial(buildingSearchRequest, where);
        queryNormal(buildingSearchRequest, where);
        sql.append(join).append(where).append(" GROUP BY building.id");

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }

    public void queryJoin(BuildingSearchRequest buildingSearchRequest, StringBuilder join) {

        Long AreaFrom = buildingSearchRequest.getAreaFrom();
        Long AreaTo = buildingSearchRequest.getAreaTo();
        if (AreaFrom != null || AreaTo != null) {
            join.append(" JOIN rentarea ON building.id = rentarea.buildingid");
        }

        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            join.append(" JOIN assignmentbuilding ON building.id = assignmentbuilding.buildingid");
        }

    }


    public void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Field[] fields = buildingSearchRequest.getClass().getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);  // Allow access to private fields
            String fieldName = field.getName();
            try {
                Object value = field.get(buildingSearchRequest);
                    if (!fieldName.equals("staffId") && !fieldName.equals("typeCode")
                            && !fieldName.startsWith("rentPrice") && !fieldName.startsWith("area")) {
                        if (value != null) {
                            if (value instanceof String && !(value).equals("")) {
                                where.append(" AND building.").append(fieldName).append(" LIKE '%").append(value).append("%' ");
                            }
                            if (value instanceof Long || value instanceof Integer) {
                                where.append(" AND building.").append(fieldName).append(" = ").append(value);
                            }
                        }
                    }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {

        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }

        Long AreaFrom = buildingSearchRequest.getAreaFrom();
        Long AreaTo = buildingSearchRequest.getAreaTo();
        if (AreaFrom != null || AreaTo != null) {
            if (AreaFrom != null) {
                where.append(" AND rentarea.value >= " + AreaFrom);
            }
            if (AreaTo != null) {
                where.append(" AND rentarea.value <= " + AreaTo);
            }
        }

        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if (rentPriceFrom != null || rentPriceTo != null) {
            if (rentPriceFrom != null) {
                where.append(" AND building.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                where.append(" AND building.rentprice <= " + rentPriceTo);
            }
        }

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if (typeCode != null && !typeCode.isEmpty()) {
            where.append(" AND ( ");
            for (int i = 0; i < typeCode.size(); i++) {
                if (i > 0) {
                    where.append(" OR ");
                }
                where.append("building.type LIKE '%" + typeCode.get(i) + "%'");
            }
            where.append(" ) ");
        }

    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = findAll(buildingSearchRequest, pageable);
        return buildingEntities.size();
    }
}