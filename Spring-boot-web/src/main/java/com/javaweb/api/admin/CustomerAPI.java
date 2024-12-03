package com.javaweb.api.admin;

import com.javaweb.model.dto.*;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.AssignmentCustomerService;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private IUserService iUserService;

    @Autowired
    private AssignmentCustomerService assignmentCustomerService;

    @Autowired
    private TransactionService transactionService;

    @PostMapping
    public ResponseEntity<?> createOrUpdateCustomer(@Valid @RequestBody CustomerDTO customerDTO, BindingResult result){
        try {
            if (result.hasErrors()) {
                List<String> errorsMessages = result.getFieldErrors().stream()
                        .map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                ResponseDTO responseDTO = new ResponseDTO();
                responseDTO.setMessage("Faided");
                responseDTO.setDetails(errorsMessages);
                return ResponseEntity.badRequest().body(responseDTO);
            }
            customerService.saveCustomer(customerDTO);
            return ResponseEntity.ok("Success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public Object loadStaffs(@PathVariable Long id) {
        List<StaffResponseDTO> staffs = iUserService.getStaffCustomer(id);
        return staffs;
    }

    @PutMapping("/staffs")
    private Object updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        assignmentCustomerService.updateAssignmentCustomer(assignmentCustomerDTO);
        return "success";
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable Long[] ids){
        customerService.deleteCustomer(ids);
    }

    @PutMapping("/transaction")
    private Object createOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO){
        transactionService.createOrUpdateTransaction(transactionDTO);
        return "success";
    }
}
