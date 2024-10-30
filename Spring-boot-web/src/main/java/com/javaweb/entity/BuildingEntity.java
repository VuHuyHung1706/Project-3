package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "building")
@Setter
@Getter
public class BuildingEntity extends BaseEntity {
    @Column(name = "name")
    private String name;

    @Column(name = "street")
    private String street;

    @Column(name = "ward")
    private String ward;

    @Column(name = "district")
    private String district;

    @Column(name = "structure")
    private String structure;

    @Column(name = "numberofbasement")
    private Long numberOfBasement;

    @Column(name = "floorarea")
    private Long floorArea;

    @Column(name = "direction")
    private String direction;

    @Column(name = "level")
    private String level;

    @Column(name = "rentprice", nullable = false)
    private Long rentPrice;

    @Column(name = "rentpricedescription")
    private String rentPriceDescription;

    @Column(name = "servicefee")
    private String serviceFee;

    @Column(name = "carfee")
    private String carFee;

    @Column(name = "motofee")
    private String motoFee;

    @Column(name = "overtimefee")
    private String overtimeFee;

    @Column(name = "waterfee")
    private String waterFee;

    @Column(name = "electricityfee")
    private String electricityFee;

    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;

    @Column(name = "brokeragefee")
    private Float brokerageFee;

    @Column(name = "note")
    private String note;

    @Column(name = "linkofbuilding")
    private String linkOfBuilding;

    @Column(name = "map")
    private String map;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;

    @Column(name = "type")
    private String type;

    @Column(name = "avatar")
    private String image;

    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RentAreaEntity> areaEntities = new ArrayList<>();

//    @ManyToMany(mappedBy = "buildings", fetch = FetchType.LAZY)
//    private List<UserEntity> staffs = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> staffs = new ArrayList<>();
}
