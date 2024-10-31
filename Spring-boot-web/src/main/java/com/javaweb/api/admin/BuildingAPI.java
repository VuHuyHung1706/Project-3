package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private UserService userService;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @PostMapping
    public ResponseEntity<?> createOrUpdateBuilding(@Valid @RequestBody BuildingDTO buildingDTO, BindingResult result){
        try {
            if (result.hasErrors()) {
                List<String> errorsMessages = result.getFieldErrors().stream()
                                                    .map(FieldError::getDefaultMessage)
                                                    .collect(Collectors.toList());
                ResponseDTO responseDTO = new ResponseDTO();
                responseDTO.setMessage("Faided");
                responseDTO.setDetails(errorsMessages);
                return ResponseEntity.badRequest().body(responseDTO);
            }
            buildingService.createBuilding(buildingDTO);
            return ResponseEntity.ok("Success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable Long[] ids){
        buildingService.deleteBuilding(ids);
    }

    @GetMapping("/{id}")
    public Object loadStaffs(@PathVariable Long id) {
        List<StaffResponseDTO> staffs = userService.getStaffs(id);
        return staffs;
    }

    @PutMapping("/staffs")
    private Object updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignmentBuildingService.updateAssignmentBuilding(assignmentBuildingDTO);
        return "success";
    }
}
