package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum districtCode {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_5("Quận 5"),
    QUAN_6("Quận 6"),
    QUAN_7("Quận 7"),
    QUAN_8("Quận 8"),
    QUAN_10("Quận 10"),
    QUAN_11("Quận 11"),
    QUAN_12("Quận 12"),
    QUAN_BINH_TAN("Quận Bình Tân"),
    QUAN_BINH_THANH("Quận Bình Thạnh"),
    QUAN_GO_VAP("Quận Gò Vấp"),
    QUAN_PHU_NHUAN("Quận Phú Nhuận"),
    QUAN_TAN_BINH("Quận Tân Bình"),
    QUAN_TAN_PHU("Quận Tân Phú"),
    THANH_PHO_THU_DUC("Thành Phố Thủ Đức");

    private final String districtName;

    districtCode(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String, String> type(){
        Map<String, String> listType = new LinkedHashMap<>();
        for (districtCode districtCode : districtCode.values()){
            listType.put(districtCode.name(), districtCode.getDistrictName());
        }
        return listType;
    }
}
