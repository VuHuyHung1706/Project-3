package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private Long floorArea;
    private String ward;
    private String street;
    private String district;
    private Long numberOfBasement;
    private String direction;
    private Long level;
    private String managerName;
    private String managerPhone;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private Long areaFrom; // rentarea
    private Long areaTo;
    private Long staffId; //asignmentbuilding
    private List<String> typeCode;
}
