package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        Optional<BuildingEntity> optionalBuildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId());
        BuildingEntity buildingEntity = optionalBuildingEntity.get();
        assignmentBuildingRepository.deleteByBuilding(buildingEntity);
        for (Long staffId : assignmentBuildingDTO.getStaffIds()) {
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();

            UserEntity userEntity = userRepository.findById(staffId).get();
            assignmentBuildingEntity.setBuilding(buildingEntity);
            assignmentBuildingEntity.setStaffs(userEntity);
            assignmentBuildingRepository.save(assignmentBuildingEntity);
        }
    }
}
