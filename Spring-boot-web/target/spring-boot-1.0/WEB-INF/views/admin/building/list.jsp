<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {}
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
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm tòa nhà</h4>

                            <span class="widget-toolbar">

									<a href="#" data-action="reload">
										<i class="ace-icon fa fa-refresh"></i>
									</a>

									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>

									<a href="#" data-action="close">
										<i class="ace-icon fa fa-times"></i>
									</a>
								</span>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <div class="row">
                                    <form:form modelAttribute="modelSearch" action="/admin/building-list" method="get" id="listForm">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <div>
                                                        <label >Tên tòa nhà</label>
<%--                                                        <input type="text" name="name" class="form-control" value="${modelSearch.name}">--%>
                                                        <form:input path="name" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-xs-6">
                                                    <div></div>
                                                    <label >Diện tích sàn</label>
<%--                                                    <input type="number" name="floorArea" class="form-control" value="${modelSearch.floorArea}">--%>
                                                    <form:input path="floorArea" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <div>
                                                        <label >Quận</label>
<%--                                                        <select class="form-control" name="districtCode">--%>
<%--                                                            <option value="">--Chọn Quận--</option>--%>
<%--                                                            <option value="Q1">Quận 1</option>--%>
<%--                                                            <option value="Q2">Quận 2</option>--%>
<%--                                                            <option value="Q3">Quận 3</option>--%>
<%--                                                            <option value="Q4">Quận 4</option>--%>
<%--                                                        </select>--%>
                                                        <form:select path="district" class="form-control">
                                                            <form:option value="" label= "--Quận--"/>
                                                            <form:options items="${district}"/>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-5">
                                                    <div></div>
                                                    <label >Phường</label>
<%--                                                    <input type="text" name="ward" class="form-control" value="${modelSearch.ward}">--%>
                                                    <form:input path="ward" class="form-control"/>
                                                </div>

                                                <div class="col-xs-5">
                                                    <div></div>
                                                    <label >Đường</label>
                                                    <form:input path="street" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <div>
                                                        <label >Số tầng hầm</label>
                                                        <form:input path="numberOfBasement" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-xs-4">
                                                    <div></div>
                                                    <label >Hướng</label>
                                                    <form:input path="direction" class="form-control"/>
                                                </div>

                                                <div class="col-xs-4">
                                                    <div>
                                                        <label >Hạng</label>
                                                        <form:input path="level" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <div>
                                                        <label >Diện tích từ</label>
                                                        <form:input path="areaFrom" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-xs-3">
                                                    <div></div>
                                                    <label >Diện tích đến</label>
                                                    <form:input path="areaTo" class="form-control"/>
                                                </div>

                                                <div class="col-xs-3">
                                                    <div>
                                                        <label >Giá tiền từ</label>
                                                        <form:input path="rentPriceFrom" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-xs-3">
                                                    <div>
                                                        <label >Giá tiền đến</label>
                                                        <form:input path="rentPriceTo" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-4">
                                                    <div></div>
                                                    <label >Tên quản lý</label>
                                                    <form:input path="managerName" class="form-control"/>
                                                </div>

                                                <div class="col-xs-4">
                                                    <div></div>
                                                    <label >SĐT quản lý</label>
                                                    <form:input path="managerPhone" class="form-control"/>
                                                </div>

                                                <security:authorize access="hasRole('MANAGER')">
                                                    <div class="col-xs-4">
                                                        <div>
                                                            <label >Nhân viên phụ trách</label>
                                                            <form:select path="staffId" class="form-control">
                                                                <form:option value="" label="--Chọn nhân viên--"/>
                                                                <form:options items="${staffs}"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </security:authorize>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <div>
                                                        <form:checkboxes items="${rentType}" path="typeCode"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button type="button" class="btn btn-sm btn-primary" id="btnSearchBuilding">
                                                        <i class="ace-icon glyphicon glyphicon-search"></i>
                                                        Tìm kiếm
                                                    </button>
                                                </div>

                                            </div>
                                        </div>

                                    </form:form>
                                </div>
                            </div>
                        </div>

                        <div class="pull-right">
                            <a href="/admin/building-edit">
                                <button class="btn btn-app btn-primary btn-sm" title="Thêm tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round"
                                         class="icon icon-tabler icons-tabler-outline icon-tabler-building">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M3 21l18 0" />
                                        <path d="M9 8l1 0" />
                                        <path d="M9 12l1 0" />
                                        <path d="M9 16l1 0" />
                                        <path d="M14 8l1 0" />
                                        <path d="M14 12l1 0" />
                                        <path d="M14 16l1 0" />
                                        <path d="M5 21v-16a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v16" /></svg>
                                </button>
                            </a>

                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-app btn-danger btn-sm" title="Xóa tòa nhà" id="btnDeleteBuildings">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round"
                                         class="icon icon-tabler icons-tabler-outline icon-tabler-building">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M3 21l18 0" />
                                        <path d="M9 8l1 0" />
                                        <path d="M9 12l1 0" />
                                        <path d="M9 16l1 0" />
                                        <path d="M14 8l1 0" />
                                        <path d="M14 12l1 0" />
                                        <path d="M14 16l1 0" />
                                        <path d="M5 21v-16a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v16" /></svg>
                                </button>
                            </security:authorize>
                        </div>
                    </div>
                </div>
            </div>

            <div class="hr hr-25 dotted hr-double"></div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <form:form modelAttribute="modelSearch" method="GET" action="/admin/building-list">
                            <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                               requestURI="/admin/building-list" partialList="true" sort="external"
                               size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                               id="listBuilding" pagesize="${modelSearch.maxPageItems}"
                               export="false"
                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                               style="margin: 3em 0 1.5em;">

                                <display:column title="<fieldset class='form-group'>
											<input type='checkbox' id='checkAll' class='check-box-element'>
											</fieldset>" class="center select-cell"
                                            headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${listBuilding.id}"
                                               id="checkbox_${listBuilding.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>

                                <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                                <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                                <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>
                                <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                <display:column headerClass="text-left" property="managerPhone" title="Tên quản lý"/>
                                <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                                <display:column headerClass="text-left" property="emptyArea" title="Diện tích trống"/>
                                <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                                <display:column headerClass="text-left" property="rentPrice" title="Giá thuê"/>
                                <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                                <display:column headerClass="text-left" property="brokeragefee" title="Phí môi giới"/>
                                <display:column headerClass="text-left" title="Thao tác">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" type="button"
                                                onclick="assingmentBuilding(${listBuilding.id})">
                                                <i class="ace-icon fa fa-check bigger-120"></i>
                                            </button>
                                        </security:authorize>

                                        <a href="/admin/building-edit-${listBuilding.id}">
                                            <button class="btn btn-xs btn-info" type="button">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </a>

                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deletebuilding(${listBuilding.id})" type="button">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </security:authorize>
                                    </div>
                                </display:column>
                            </display:table>
                        </form:form>
                    </div>
                </div>
            </div>

        </div>
</div><!-- /.main-content -->

    <div class="modal fade" id="assingmentBuildingModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Danh sách nhân viên</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table id="staffList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">Chọn</th>
                            <th class="center">Tên nhân viên</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                    <input type="hidden" id="buildingId" value=""/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAssignmentBuilding">Giao tòa nhà</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function assingmentBuilding(buildingId) {
            // event.preventDefault();
            console.log(buildingId);
            $('#assingmentBuildingModal').modal()
            $('#buildingId').val(buildingId);
            loadStaffs(buildingId);
        }

        function loadStaffs(buildingId) {
            $.ajax({
                url: '/api/buildings/' + buildingId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (result) {
                    var row = '';
                    $.each(result, function (index, item) {
                        row += '<tr> class="center">';
                        row += '<td> <input type="checkbox" value=' + item.staffId + ' id=checkbox_' + item.staffId + ' ' + item.checked + '/></td>';
                        row += '<td>' + item.userName + '</td>';
                        row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                },
                error: function (result) {
                    console.log("failed");
                }
            })
        }

        $('#btnAssignmentBuilding').click(function(e){
            e.preventDefault();
            var json = {};
            json['buildingId'] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            json['staffIds'] = staffs;

            UpdateAssignmentBuilding(json);
        })

        function UpdateAssignmentBuilding(data) {
            $.ajax({
                url: '/api/buildings/staffs',
                type: 'PUT',
                contentType: 'application/json',
                dataType: 'text',
                data: JSON.stringify(data),
                success: function (result) {
                    console.log("success")
                    alert("Giao tòa nhà thành công");
                },
                error: function (result) {
                    console.log("failed");
                    alert("Failed");
                }
            })
        }

        $('#btnDeleteBuildings').click(function(e){
            e.preventDefault();
            var buildingIds = $('#listBuilding').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();

            console.log("ok");

            if (buildingIds.length == 0) {
                alert('Chưa chọn tòa nhà cần xóa');
            }
            else {
                btnDeleteBuilding(buildingIds);
            }
        })

        function deletebuilding(buildingId) {
            // event.preventDefault();
            btnDeleteBuilding(buildingId);
        }

        function btnDeleteBuilding(data) {
            $.ajax({
                url: '/api/buildings/' + data,
                type: 'DELETE',
                dataType: 'text',
                success: function (result) {
                    console.log("success")
                    alert("Xóa thành công");
                    window.location.href = "/admin/building-list";
                },
                error: function (result) {
                    console.log("failed");
                    alert("Failed");
                }
            })
        }

        $('#btnSearchBuilding').click(function(e){
            e.preventDefault();
            $("#listForm").submit();
        })
    </script>

</body>
</html>
