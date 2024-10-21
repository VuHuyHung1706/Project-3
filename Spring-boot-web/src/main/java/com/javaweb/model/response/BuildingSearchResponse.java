package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BuildingSearchResponse extends AbstractDTO {
    private String name;
    private String address;
    private String managerName;
    private String managerPhone;
    private Long numberOfBasement;
    private Long floorArea;
    private Long emptyArea;
    private String rentArea;
    private Long rentPrice;
    private String serviceFee;
    private Float brokeragefee;
}
