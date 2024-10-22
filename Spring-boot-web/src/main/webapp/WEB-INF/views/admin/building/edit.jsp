<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Thông tin tòa nhà</title>
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

            </div><!-- /.page-content -->

            <div class="row">
                <div class="col-xs-12">
                    <form:form method="GET" id="form-edit" modelAttribute="buildingEdit">
                        <div class="form-group">
                            <form:input type="hidden" path="id" />
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Quận</label>
                            <div class="col-xs-3">
                                <form:select path="district" class="form-control">
                                    <form:option value="" label= "--Quận--"/>
                                    <form:options items="${district}"/>
                                </form:select>
                            </div>

                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <form:input path="street" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <form:input path="motoFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Tiền nước</label>
                            <div class="col-xs-9">
                                <form:input path="waterFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <form:input path="note" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerPhone" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Loại tòa nhà</label>
                            <div class="col-xs-9">
                                <form:checkboxes items="${rentType}" path="typeCode"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Sửa thông tin</button>
                                </c:if>
                                <c:if test="${empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                </c:if>

                                <a href="/admin/building-list">
                                    <button type="button" class="btn btn-inverse">Hủy</button>
                                </a>
                            </div>

                        </div>
                    </form:form>
                </div>
            </div>

        </div>
</div><!-- /.main-content -->

<script>
    $("#btnAddOrUpdateBuilding").click(function () {
        var formData = $("#form-edit").serializeArray();
        var json = {};
        var typeCode = [];
        $.each(formData, function (i, v) {
            if (v.name == 'typeCode') {
                typeCode.push(v.value);
            } else {
                json[""+v.name+""] = v.value;
            }
        });
        json["typeCode"] = typeCode;
        btnAddOrUpdateBuilding(json);
    });

    function btnAddOrUpdateBuilding(json) {
        $.ajax({
            url: "/api/buildings",
            type: "POST",
            data: JSON.stringify(json),
            contentType: "application/json",
            success: function (result) {
                console.log("success");
                alert("Success");
            },
            error: function (result) {
                console.log("error");
                alert(result.responseJSON.details);
            }
        });
    }
</script>
</body>
</html>
