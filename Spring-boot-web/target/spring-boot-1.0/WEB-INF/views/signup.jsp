<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
    <div class="container">
        <div class="signup-form">
            <div class="container-fluid" >
                <section class="vh-100 gradient-custom form-register">
                    <div class="container">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
                                    <div class="card-body p-2 px-5 text-center">
                                        <div class="md-5 md-4 mt-4 pb-2">
                                            <h2 class="fw-bold mb-2 text-uppercase">Create an account</h2>
                                            <p class="text-white-50 mb-2">Please enter your Information</p>


                                            <form method="post" id="formSignUp">
                                                <div class="form-outline form-white mb-2">
                                                    <label class="form-label" for="fullName">Fullname</label>
                                                    <input type="text" id="fullName" name="fullName" class="form-control form-control-lg" placeholder="Tên đăng nhập"/>
                                                </div>

                                                <div class="form-outline form-white mb-2">
                                                    <label class="form-label" for="userName">Username</label>
                                                    <input type="text" id="userName" name="userName" class="form-control form-control-lg" placeholder="Tên đăng nhập"/>
                                                </div>

                                                <div class="form-outline form-white mb-2">
                                                    <label class="form-label" for="password">Password</label>
                                                    <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Nhập mật khẩu"/>
                                                </div>

                                                <div class="form-outline form-white mb-2">
                                                    <label class="form-label" for="confirmPassword">Repeat your password</label>
                                                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control form-control-lg" placeholder="Nhập lại mật khẩu"/>
                                                </div>

                                                <input type="hidden" name="roleCode" value="USER" />

                                                <div class="form-check d-flex flex-column align-items-center justify-content-center mb-2">
                                                    <div class="d-flex align-items-center mb-2">
                                                        <input class="form-check-input me-2" type="checkbox" id="form2Example3cg" />
                                                        <label class="form-check-label" for="form2Example3cg" style="color: white;">
                                                            I agree to all statements in
                                                        </label>
                                                    </div>
                                                    <a href="#!" class="text-body" style="color: white; text-decoration: underline;">Terms of Service</a>
                                                </div>
                                                <button class="btn btn-outline-light btn-lg px-5" type="button" id="register">Register</button>
                                            </form>




                                            <p class="text-center text-muted mt-2 mb-0">Have already an account? <a href="/login"
                                                                                                                    class="fw-bold text-body"><u style="color: white ;">Login here</u></a></p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $('#register').click(function(e){
            e.preventDefault();

            if (!$('#form2Example3cg').is(':checked')) {
                alert("Bạn phải đồng ý với điều khoản trước khi tạo tài khoản!");
                return;
            }

            // Lấy giá trị từ các trường input
            var password = $('#password').val();
            var confirmPassword = $('#confirmPassword').val();

            if (password === '' || confirmPassword === '') {
                alert("Vui lòng nhập mật khẩu và xác nhận mật khẩu!");
                return;
            }

            if (password !== confirmPassword) {
                alert("Mật khẩu và mật khẩu xác nhận không khớp!");
                return;
            }

            var formData = $('#formSignUp').serializeArray();
            var jsonData = {};

            $.each(formData, function (i, field) {
                jsonData[field.name] = field.value;
            });

            createUser(jsonData);
        })

        function createUser(json) {
            $.ajax({
                url: "/api/user/create",
                type: "POST",
                data: JSON.stringify(json),
                contentType: "application/json",
                success: function (result) {
                    console.log("success");
                    alert("Success");
                    window.location.href = "/login";
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
