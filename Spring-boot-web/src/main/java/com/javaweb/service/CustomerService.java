package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    void saveCustomer(CustomerDTO customerDTO);
    List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    int countTotalItems(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    CustomerDTO findById(Long id);
    void deleteCustomer(Long[] ids);
    boolean accessEditCustomer(Long id);
}
