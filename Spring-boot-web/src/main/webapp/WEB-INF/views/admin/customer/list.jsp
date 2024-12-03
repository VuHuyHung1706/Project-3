<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Danh sách khách hàng</title>
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
              Quản lý khách hàng
            </h1>
          </div><!-- /.page-header -->

        </div><!-- /.page-content -->

        <div class="row">
          <div class="col-xs-12">
            <div class="widget-box">
              <div class="widget-header">
                <h4 class="widget-title">Tìm kiếm khách hàng</h4>

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
                    <form:form modelAttribute="modelSearch" action="/admin/customer-list" method="get" id="listCustomer">
                      <div class="form-group">
                        <div class="col-xs-12">
                          <div class="col-xs-4">
                            <div>
                              <label>Tên khách hàng</label>
                              <form:input path="fullName" class="form-control"/>
                            </div>
                          </div>

                          <div class="col-xs-4">
                            <div></div>
                            <label>Số điện thoại</label>
                            <form:input path="phone" class="form-control"/>
                          </div>

                          <div class="col-xs-4">
                            <div>
                              <label>Email</label>
                              <form:input path="email" class="form-control"/>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-xs-12">

                          <div class="col-xs-4">
                            <div></div>
                            <label >Tình trạng</label>
                            <form:select path="status" class="form-control">
                                <form:options items="${status}"/>
                            </form:select>
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


                          <security:authorize access="hasRole('MANAGER')">
                            <div class="col-xs-4">
                              <div></div>
                              <label >Người thêm</label>
                              <form:input path="createdBy" class="form-control"/>
                            </div>
                          </security:authorize>

                        </div>
                      </div>


                      <div class="form-group">
                        <div class="col-xs-12">
                          <div class="col-xs-6">
                            <button type="button" class="btn btn-sm btn-primary" id="btnSearchCustomer">
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
                <a href="/admin/customer-edit">
                  <button class="btn btn-app btn-primary btn-sm" title="Thêm tòa nhà">
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-users-plus"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4c.96 0 1.84 .338 2.53 .901" /><path d="M16 3.13a4 4 0 0 1 0 7.75" /><path d="M16 19h6" /><path d="M19 16v6" /></svg>
                  </button>
                </a>

                <security:authorize access="hasRole('MANAGER')">
                  <button class="btn btn-app btn-danger btn-sm" title="Xóa tòa nhà" id="btnDeleteCustomers">
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-user-off"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M8.18 8.189a4.01 4.01 0 0 0 2.616 2.627m3.507 -.545a4 4 0 1 0 -5.59 -5.552" /><path d="M6 21v-2a4 4 0 0 1 4 -4h4c.412 0 .81 .062 1.183 .178m2.633 2.618c.12 .38 .184 .785 .184 1.204v2" /><path d="M3 3l18 18" /></svg>
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
              <form:form modelAttribute="modelSearch" method="GET" action="/admin/customer-list">
                <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                               requestURI="/admin/customer-list" partialList="true" sort="external"
                               size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                               id="listCustomer" pagesize="${modelSearch.maxPageItems}"
                               export="false"
                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                               style="margin: 3em 0 1.5em;">

                  <display:column title="<fieldset class='form-group'>
                                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                                </fieldset>" class="center select-cell"
                                  headerClass="center select-cell">
                    <fieldset>
                      <input type="checkbox" name="checkList" value="${listCustomer.id}"
                             id="checkbox_${listCustomer.id}" class="check-box-element"/>
                    </fieldset>
                  </display:column>
                  <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                  <display:column headerClass="text-left" property="phone" title="Số điện thoại"/>
                  <display:column headerClass="text-left" property="email" title="Email"/>
                  <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                  <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                  <display:column headerClass="text-left" property="modifiedDate" title="Ngày thêm"/>
                  <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                  <display:column headerClass="text-left" title="Thao tác">
                    <div class="hidden-sm hidden-xs btn-group">

                      <security:authorize access="hasRole('MANAGER')">
                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" type="button"
                              onclick="assignmentCustomer(${listCustomer.id})">
                          <i class="ace-icon fa fa-check bigger-120"></i>
                        </button>
                      </security:authorize>

                      <a href="/admin/customer-edit-${listCustomer.id}">
                        <button class="btn btn-xs btn-info" type="button">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>
                      </a>

                      <security:authorize access="hasRole('MANAGER')">
                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteCustomer(${listCustomer.id})" type="button">
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

    <div class="modal fade" id="assignmentCustomerModal">
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
            <input type="hidden" id="customerId" value=""/>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnAssignmentCustomer">Giao tòa nhà</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

<script>
  $('#btnSearchCustomer').click(function(e){
    e.preventDefault();
    $("#listCustomer").submit();
  })

  function assignmentCustomer(customerId) {
    // event.preventDefault();
    console.log(customerId);
    $('#assignmentCustomerModal').modal()
    $('#customerId').val(customerId);
    loadStaffs(customerId);
  }

  function loadStaffs(customerId) {
    $.ajax({
      url: '/api/customer/' + customerId,
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

  $('#btnAssignmentCustomer').click(function(e){
    e.preventDefault();
    var json = {};
    json['customerId'] = $('#customerId').val();
    var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
      return $(this).val();
    }).get();
    json['staffIds'] = staffs;

    UpdateAssignmentBuilding(json);
  })

  function UpdateAssignmentBuilding(data) {
    $.ajax({
      url: '/api/customer/staffs',
      type: 'PUT',
      contentType: 'application/json',
      dataType: 'text',
      data: JSON.stringify(data),
      success: function (result) {
        console.log("success")
        alert("Giao thành công");
      },
      error: function (result) {
        console.log("failed");
        alert("Failed");
      }
    })
  }

  $('#btnDeleteCustomers').click(function(e){
    e.preventDefault();
    // var customerIds = $('#listCustomer').find('tbody input[type=checkbox]:checked').map(function(){
    //   return $(this).val();
    // }).get();

    var customerIds = $('#listCustomer tbody input[type=checkbox]:checked').map(function() {
      return $(this).val();
    }).get();

    if (customerIds.length == 0) {
      alert('Chưa chọn khách hàng cần xóa');
    }
    else {
      btnDeleteCustomer(customerIds);
    }
  })

  function deleteCustomer(customerId) {
    // event.preventDefault();
    btnDeleteCustomer(customerId);
  }

  function btnDeleteCustomer(data) {
    $.ajax({
      url: '/api/customer/' + data,
      type: 'DELETE',
      dataType: 'text',
      success: function (result) {
        console.log("success")
        alert("Xóa thành công");
        window.location.href = "/admin/customer-list";
      },
      error: function (result) {
        console.log("failed");
        alert("Failed");
      }
    })
  }
</script>
</body>
</html>
