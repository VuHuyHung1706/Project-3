package com.javaweb.converter;


import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse convertToCustomerSearchResponse(CustomerEntity customerEntity) {
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity, CustomerSearchResponse.class);

        if (customerEntity.getStatus() == null) {
            return customerSearchResponse;
        }

        Map<String, String> status = Status.type();
        String statusValue = status.get(customerEntity.getStatus());

        customerSearchResponse.setStatus(statusValue);
        return customerSearchResponse;
    }
}
