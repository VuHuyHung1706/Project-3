package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerSearchRequest extends AbstractDTO {
    private String fullName;
    private String phone;
    private String email;
    private String status;
    private String createdBy;
    private Long staffId;
}
