package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.util.List;

@Setter
@Getter
public class BuildingDTO extends AbstractDTO{
    @NotBlank(message = "Name Building can not be blank")
    private String name;
    private String district;
    private String street;
    private String ward;
    private String structure;

    @Min(value = 0, message = "Number of basement must be greater than 0")
    private Long numberOfBasement;

    @Min(value = 1, message = "Building area must be greater than 0")
    private Long floorArea;

    private String direction;
    private String level;

    @Min(value = 0, message = "Rent price must be greater than 0")
    private Long rentPrice;
    private String rentPriceDescription;

    @NotBlank(message = "Rent area can not be blank")
    private String rentArea;
    private String serviceFee;

    private String carFee;
    private String motoFee;
    private String overtimeFee;
    private String waterFee;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private Float brokerageFee;
    private String note;
    private String managerName;

    @Pattern(regexp = "^(0[0-9]{9})?$", message = "Manager phone must be 10 digits")
    private String managerPhone;

    @NotEmpty(message = "Type code can not be empty")
    private List<String> typeCode;

    private String image;

    private String imageBase64;

    private String imageName;

    public String getImageBase64() {
        if (imageBase64 != null) {
            return imageBase64.split(",")[1];
        }
        return null;
    }
}
