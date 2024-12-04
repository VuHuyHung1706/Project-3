<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Thông tin khách hàng</title>
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
                <c:if test="${not empty customerEdit.id}">
                    <h1 style="color: #2a91d8">Sửa thông tin khách hàng</h1>
                </c:if>
                <c:if test="${empty customerEdit.id}">
                    <h1 style="color: #2a91d8">Thêm thông tin khách hàng</h1>
                </c:if>
            </div><!-- /.page-content -->

            <div class="row">
                <div class="col-xs-12">
                    <form:form method="GET" id="formCustomer" modelAttribute="customerEdit">
                        <div class="form-group">
                            <form:input type="hidden" path="id" />
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3">Tên khách hàng</label>
                            <div class="col-xs-9">
                                <form:input path="fullName" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Số điện thoại</label>
                            <div class="col-xs-9">
                                <form:input path="phone" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Email</label>
                            <div class="col-xs-9">
                                <form:input path="email" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Tên công ty</label>
                            <div class="col-xs-9">
                                <form:input path="companyName" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3">Nhu cầu</label>
                            <div class="col-xs-9">
                                <form:input path="demand" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tình trạng</label>
                            <div class="col-xs-9">
                                <form:select path="status" class="form-control">
                                  <form:option value="Chưa xử lý" label="Chưa xử lý"/>
                                  <form:option value="Đang xử lý" label="Đang xử lý"/>
                                  <form:option value="Đã xử lý" label="Đã xử lý"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty customerEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Sửa thông tin</button>
                                </c:if>
                                <c:if test="${empty customerEdit.id}">
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng</button>
                                </c:if>

                                <a href="/admin/customer-list">
                                    <button type="button" class="btn btn-inverse">Hủy</button>
                                </a>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>

            <c:forEach var="item" items="${transactionType}">
                <div class="col-xs-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                    <button class="btn btn-lg btn-primary" onclick="btnAddTransaction('${item.key}', ${customerEdit.id})">
                        <i class="ace-icon fa fa-plus"></i>
                        Thêm giao dịch
                    </button>
                </div>
                <c:if test="${item.key == 'CSKH'}">
                    <div class="col-xs-12">
                        <table id="simple-table-CSKH" class="table table-striped table-bordered">
                            <thead>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </thead>

                            <tbody>
                                <c:forEach var="transaction" items="${CSKH}">
                                    <tr>
                                        <td>${transaction.createdDate}</td>
                                        <td>${transaction.createdBy}</td>
                                        <td>${transaction.modifiedDate}</td>
                                        <td>${transaction.modifiedBy}</td>
                                        <td>${transaction.note}</td>
                                        <td>
                                            <button class="btn btn-xs btn-info" onclick="btnUpdateTransaction('${item.key}', ${transaction.id}, ${customerEdit.id}, '${transaction.note}')">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>

                                <c:if test="${item.key == 'DDX'}">
                    <div class="col-xs-12">
                        <table id="simple-table-DDX" class="table table-striped table-bordered">
                            <thead>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </thead>

                            <tbody>
                                <c:forEach var="transaction" items="${DDX}">
                                    <tr>
                                        <td>${transaction.createdDate}</td>
                                        <td>${transaction.createdBy}</td>
                                        <td>${transaction.modifiedDate}</td>
                                        <td>${transaction.modifiedBy}</td>
                                        <td>${transaction.note}</td>
                                        <td>
                                            <button class="btn btn-xs btn-info" onclick="btnUpdateTransaction('${item.key}', ${transaction.id}, ${customerEdit.id}, '${transaction.note}')">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>


            </c:forEach>

        </div>
</div><!-- /.main-content -->

    <div class="modal fade" id="assignmentCustomerModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nhập giao dịch</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="note" class="col-xs-12 col-sm-3 control-label no-padding-right">Nội dung giao dịch</label>
                        <div class="col-xs-12 col-sm-9">
                <span class="block input-icon input-icon-right">
                  <input type="text" id="note" class="width-100">
                </span>
                        </div>
                    </div>
                    <input type="hidden" id="customerId" name="customerId" value=""/>
                    <input type="hidden" id="code" name="code" value=""/>
                    <input type="hidden" id="idTransaction" name="idTransaction" value=""/>
                </div>
                <div class="modal-footer">
                    <c:if test="${not empty idTransaction}">
                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction">Sửa thông tin</button>
                    </c:if>
                    <c:if test="${empty idTransaction}">
                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    </c:if>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<script>
    $('#btnAddOrUpdateCustomer').click(function(e){
        e.preventDefault();
        var formData = $('#formCustomer').serializeArray();
        var json = {};
        $.each(formData, function (i, v) {
            json[v.name] = v.value;
        });

        addOrUpdateCustomer(json);
    })

    function addOrUpdateCustomer(json) {
        $.ajax({
            url: "/api/customer",
            type: "POST",
            data: JSON.stringify(json),
            contentType: "application/json",
            success: function (result) {
                console.log("success");
                alert("Success");
                window.location.href = "/admin/customer-list";
            },
            error: function (result) {
                console.log("error");
                alert(result.responseJSON.details);
            }
        });
    }


    function btnAddTransaction(code, customerId) {
        $('#assignmentCustomerModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function btnUpdateTransaction(code, id, customerId, note) {
        $('#assignmentCustomerModal').modal();
        $('#customerId').val(customerId);
        $('#idTransaction').val(id);
        $('#code').val(code);
        $('#note').val(note);
    }


    $('#btnAddOrUpdateTransaction').click(function(e){
        e.preventDefault();
        var data = {};
        data['id'] = $('#idTransaction').val();
        data['code'] = $('#code').val();
        data['note'] = $('#note').val();
        data['customerId'] = $('#customerId').val();

        addOrUpdateTransaction(data);
    })

    function addOrUpdateTransaction(data) {
        $.ajax({
            url: '/api/customer/transaction',
            type: 'PUT',
            contentType: 'application/json',
            dataType: 'text',
            data: JSON.stringify(data),
            success: function (result) {
                console.log("success")
                alert("Thêm giao dịch thành công");
                window.location.reload();
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
