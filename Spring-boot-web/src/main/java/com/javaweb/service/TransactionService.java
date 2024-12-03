package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionService {
    List<TransactionEntity> getListTransaction(String transactionType, Long id);
    void createOrUpdateTransaction(TransactionDTO transactionDTO);
}
