package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum BuildingType {
    TANG_TRET ("Tầng trệt"),
    NGUYEN_CAN ("Nguyên căn"),
    NOI_THAT ("Nội thất");

    private final String name;

    BuildingType(String name){
        this.name = name;
    }

    public String getCode(){
        return name;
    }

    public static Map<String, String> type(){
        Map<String, String> listType = new LinkedHashMap<>();
        for (BuildingType buildingType : BuildingType.values()){
            listType.put(buildingType.name(), buildingType.getCode());
        }
        return listType;
    }
}
