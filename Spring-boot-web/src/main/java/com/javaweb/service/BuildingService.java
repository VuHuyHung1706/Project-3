package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;
import java.util.Map;

public interface BuildingService {
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    void createBuilding(BuildingDTO building);
    BuildingDTO findById(Long id);
    void deleteBuilding(Long[] ids);
}
