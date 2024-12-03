package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Override
    public void saveCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        customerEntity.setIsActive(1);

        if (customerDTO.getId() != null) {
            CustomerEntity oldCustomer = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setCreatedBy(oldCustomer.getCreatedBy());
            customerEntity.setCreatedDate(oldCustomer.getCreatedDate());

            customerEntity.setStaffs(oldCustomer.getStaffs());
        }
        customerRepository.save(customerEntity);
    }

    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        List<CustomerEntity> customerEntities = customerRepository.findAll(customerSearchRequest, pageable);

        List<CustomerSearchResponse> customerSearchResponses = new ArrayList<>();
        for (CustomerEntity customerEntity : customerEntities) {
            CustomerSearchResponse customerSearchResponse = customerConverter.convertToCustomerSearchResponse(customerEntity);
            customerSearchResponses.add(customerSearchResponse);
        }
        return customerSearchResponses;
    }

    @Override
    public int countTotalItems(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        return customerRepository.countTotalItems(customerSearchRequest, pageable);
    }

    @Override
    public CustomerDTO findById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);
        return customerDTO;
    }

    @Override
    public void deleteCustomer(Long[] ids) {
        List<CustomerEntity> buildings = customerRepository.findByIdIn(ids);
        for (CustomerEntity item : buildings) {
            item.setIsActive(0);
            customerRepository.save(item);
        }
    }

    @Override
    public boolean accessEditCustomer(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            UserEntity userEntity = userRepository.findById(SecurityUtils.getPrincipal().getId()).get();
            if (!customerEntity.getStaffs().contains(userEntity)) {
                return true;
            }
        }
        return false;
    }
}
