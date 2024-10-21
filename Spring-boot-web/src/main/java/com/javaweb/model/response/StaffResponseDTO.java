package com.javaweb.model.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StaffResponseDTO {
    private String userName;
    private Long staffId;
    private String checked;
}
