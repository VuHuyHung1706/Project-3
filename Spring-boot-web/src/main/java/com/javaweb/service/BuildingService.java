package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface BuildingService {
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    void createBuilding(BuildingDTO building);
    BuildingDTO findById(Long id);
    void deleteBuilding(Long[] ids);
    int countTotalItems(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity);
}
