﻿$(document).ready(function () {
    $("#submit-login").click(function (e) {
        e.preventDefault();

        let inputEmail = $("#inputEmail").val();
        let inputPassword = $("#inputPassword").val();

        if (inputEmail == "") {
            toastr.warning('Tài khoản Email không được phép để trống.', 'Thông báo!');
            return;
        }

        if (inputPassword == "") {
            toastr.warning('Mật khẩu không được phép để trống.', 'Thông báo!');
            return;
        }

        
        $.ajax({
            type: "GET",
            url: "/Ajax/Login.aspx",
            data: {
                action: "login",
                inputEmail: inputEmail,
                inputPassword: inputPassword
            },
            dataType: "",
            success: function (response) {
                if (response == "1") {
                    toastr.success('Đăng nhập thành công.', 'Thông báo!');

                    setTimeout(function () {
                        window.location.href = window.location.origin;
                    }, 1000);

                } else {
                    toastr.warning('Tài khoản mật khẩu không chính xác.', 'Thông báo!');
                }
            }
        });
    });
});


function checkEmail() {

}