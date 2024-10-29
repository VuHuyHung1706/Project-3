package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();

        for (UserEntity user : buildingEntity.getStaffs()) {
            user.getBuildings().remove(buildingEntity);
        }

        List<UserEntity> staffs = userRepository.findByIdIn(assignmentBuildingDTO.getStaffIds());
        buildingEntity.setStaffs(staffs);

        for (UserEntity user : staffs) {
            user.getBuildings().add(buildingEntity);
        }

        buildingRepository.save(buildingEntity);
    }

}
