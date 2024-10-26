package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.BuildingService;

import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

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

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest, pageable);

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
        saveThumbnail(building, buildingEntity);
        buildingRepository.save(buildingEntity);
        rentAreaRepository.deleteAllByBuilding(buildingEntity);
        if (building.getRentArea() != "") {
            List<String> rentAreas = Arrays.stream(building.getRentArea().split(","))
                    .map(String::trim)
                    .collect(Collectors.toList());
            for (String rentArea : rentAreas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(rentArea));
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreaRepository.save(rentAreaEntity);;
            }
        }
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntities = rentAreaRepository.findAllByBuilding(buildingEntity);
        String rentArea = rentAreaEntities.stream()
                .map(rentAreaEntity -> rentAreaEntity.getValue().toString())
                .collect(Collectors.joining(", "));
        buildingDTO.setRentArea(rentArea);
        String type = buildingEntity.getType().substring(1, buildingEntity.getType().length() - 1);
        buildingDTO.setTypeCode(Arrays.asList(type.split(", ")));
        return buildingDTO;
    }

    @Override
    public void deleteBuilding(Long[] ids) {
		List<BuildingEntity> buildingEntities = buildingRepository.findByIdIn(ids);
		rentAreaRepository.deleteAllByBuildingIn(buildingEntities);
        assignmentBuildingRepository.deleteAllByBuildingIn(buildingEntities);
        buildingRepository.deleteByIdIn(ids);

    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        return buildingRepository.countTotalItems(buildingSearchRequest, pageable);
    }

    @Override
    public void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }

}
