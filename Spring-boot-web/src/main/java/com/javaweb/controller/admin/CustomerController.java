package com.javaweb.controller.admin;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value="customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private IUserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @GetMapping("/admin/customer-list")
    private ModelAndView customerList(@ModelAttribute(name = "modelSearch") CustomerSearchRequest params, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");
        modelAndView.addObject("staffs", userService.listStaff());

        DisplayTagUtils.of(request, params);

        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            params.setStaffId(SecurityUtils.getPrincipal().getId());
        }

        List<CustomerSearchResponse> customers = customerService.findAll(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        params.setListResult(customers);
        params.setTotalItems(customerService.countTotalItems(params, null));
        modelAndView.addObject("listCustomer", params);
        return modelAndView;
    }

    @GetMapping("/admin/customer-edit")
    private ModelAndView customerEdit(@ModelAttribute(name = "customerEdit") CustomerDTO customerDTO){
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        return modelAndView;
    }

    @GetMapping("/admin/customer-edit-{id}")
    private ModelAndView customerEdit(@PathVariable Long id){
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");

        if (customerService.accessEditCustomer(id)) {
            return new ModelAndView("redirect:/error-404");
        }

        modelAndView.addObject("transactionType", TransactionType.type());
        modelAndView.addObject("customerEdit", customerService.findById(id));

        List<TransactionEntity> CSKH = transactionService.getListTransaction("CSKH", id);
        List<TransactionEntity> DDX = transactionService.getListTransaction("DDX", id);
        modelAndView.addObject("CSKH", CSKH);
        modelAndView.addObject("DDX", DDX);
        return modelAndView;
    }
}
