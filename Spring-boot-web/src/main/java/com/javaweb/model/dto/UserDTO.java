package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.*;

@Setter
@Getter
public class UserDTO extends AbstractDTO {

    @NotBlank(message = "Username can not be blank")
    private String userName;

    @NotBlank(message = "Full Name can not be blank")
    private String fullName;

    @NotBlank(message = "Password can not be blank")
    private String password;
    private Integer status;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private Map<String,String> roleDTOs = new HashMap<>();
}
