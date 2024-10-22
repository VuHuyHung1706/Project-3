package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteAllByBuildingIn(List<BuildingEntity> buildingEntities);
    void deleteAllByBuilding(BuildingEntity buildingEntity);
    List<RentAreaEntity> findAllByBuilding(BuildingEntity buildingEntity);
}
