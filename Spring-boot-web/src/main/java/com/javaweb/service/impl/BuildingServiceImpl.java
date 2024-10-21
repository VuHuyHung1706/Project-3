package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.BuildingService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import javax.transaction.Transactional;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {


    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest);

        if (buildingEntities == null) {
            return null;
        }

        List<BuildingSearchResponse> buildings = new ArrayList<>();
        for (BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingConverter.convertToBuildingSearchResponse(item);
            buildings.add(building);
        }

        return buildings;
    }

    @Override
    public void createBuilding(BuildingDTO building) {
        BuildingEntity buildingEntity = new BuildingEntity();
        if (building.getId() != null) {
            buildingEntity.setId(building.getId());
        }
        buildingEntity = modelMapper.map(building, BuildingEntity.class);

        buildingRepository.save(buildingEntity);
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.getOne(id);
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        return buildingDTO;
    }

    @Override
    public void deleteBuilding(Long[] ids) {
		List<BuildingEntity> buildingEntities = buildingRepository.findByIdIn(ids);
		rentAreaRepository.deleteAllByBuildingIn(buildingEntities);
        assignmentBuildingRepository.deleteAllByBuildingIn(buildingEntities);
        buildingRepository.deleteByIdIn(ids);

    }

}
