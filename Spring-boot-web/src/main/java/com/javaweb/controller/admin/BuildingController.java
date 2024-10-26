package com.javaweb.controller.admin;



import com.javaweb.enums.BuildingType;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IUserService userService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/admin/building-list")
    private ModelAndView buildingList(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("district", DistrictCode.type());
        modelAndView.addObject("rentType", BuildingType.type());
        modelAndView.addObject("staffs", userService.listStaff());
        DisplayTagUtils.of(request, params);
        List<BuildingSearchResponse> buildings = buildingService.findAll(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        params.setListResult(buildings);
        params.setTotalItems(buildingService.countTotalItems(params, null));
        modelAndView.addObject("listBuilding", params);
        return modelAndView;
    }

    @GetMapping("/admin/building-edit")
    private ModelAndView buildingEdit(@ModelAttribute(name = "buildingEdit")BuildingDTO buildingDTO){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("district", DistrictCode.type());
        modelAndView.addObject("rentType", BuildingType.type());
        return modelAndView;
    }

    @GetMapping("/admin/building-edit-{id}")
    private ModelAndView buildingEdit(@PathVariable Long id){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("district", DistrictCode.type());
        modelAndView.addObject("rentType", BuildingType.type());
        modelAndView.addObject("buildingEdit", buildingService.findById(id));

        return modelAndView;
    }
}
