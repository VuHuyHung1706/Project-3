package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class BuildingDTO extends AbstractDTO{
    private String name;
    private String district;
    private String street;
    private String ward;
    private String structure;
    private Long numberOfBasement;
    private Long floorArea;
    private String direction;
    private String level;
    private Long rentPrice;
    private String rentPriceDescription;
    private Long rentArea;
    private String serviceFee;
    private String carFee;
    private String motoFee;
    private String overtimeFee;
    private String waterFee;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private Float brokerageFee;
    private String note;
    private String managerName;
    private String managerPhone;
    private List<String> typeCode;
}
