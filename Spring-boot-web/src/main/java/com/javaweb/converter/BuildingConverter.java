package com.javaweb.converter;

import java.util.Map;
import java.util.stream.Collectors;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse convertToBuildingSearchResponse(BuildingEntity item) {
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);

        Map<String, String> districts = districtCode.type();
        String district = districts.get(item.getDistrict());
        String address = "";
        if (!item.getStreet().equals("")) {
            address += item.getStreet() + ", ";
        }
        if (!item.getWard().equals("")) {
            address += item.getWard() + ", ";
        }
        address += district;
        building.setAddress(address);

        String rentArea = item.getAreaEntities().stream().map(i -> i.getValue().toString()).collect(Collectors.joining(","));
        building.setRentArea(rentArea);

        return building;
    }
}
