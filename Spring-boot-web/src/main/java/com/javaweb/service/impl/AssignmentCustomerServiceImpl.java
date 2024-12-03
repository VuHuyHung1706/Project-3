package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AssignmentCustomerServiceImpl implements AssignmentCustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();

        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffIds());
        customerEntity.setStaffs(staffs);

        customerRepository.save(customerEntity);
    }
}
