package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Setter
@Getter
public class CustomerDTO extends AbstractDTO{
    @NotBlank(message = "Name can not be blank")
    private String fullName;
    private String managementStaff;

    @Pattern(regexp = "^(0[0-9]{9})?$", message = "Manager phone must be 10 digits and start with 0")
    @NotBlank(message = "Phone number can not be blank")
    private String phone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
}
