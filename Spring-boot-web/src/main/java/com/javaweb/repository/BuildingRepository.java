package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {
    List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchBuilder);
    List<BuildingEntity> findByIdIn(Long[] ids);
    Optional<BuildingEntity> findById(Long id);
    BuildingEntity getOne(Long id);
    void deleteByIdIn(Long[] ids);
}