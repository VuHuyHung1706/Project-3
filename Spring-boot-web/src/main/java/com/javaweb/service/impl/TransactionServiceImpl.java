package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<TransactionEntity> getListTransaction(String transactionType, Long id) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCodeAndCustomer_Id(transactionType, id);
        return transactionEntities;
    }

    @Override
    public void createOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = modelMapper.map(transactionDTO, TransactionEntity.class);
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomer(customerEntity);
        if (transactionDTO.getId() != null) {
            TransactionEntity oldTransaction = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedBy(oldTransaction.getCreatedBy());
            transactionEntity.setCreatedDate(oldTransaction.getCreatedDate());
        }
        transactionRepository.save(transactionEntity);
    }
}
