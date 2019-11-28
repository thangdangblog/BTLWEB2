$(document).ready(function () {
    $("#btn-themnhanvien").click(function (e) {
        e.preventDefault();

        $("#modeladduser").modal();

        $("#add_nv").click(function () {
            let email = $("#email_add").val();
            let fullname = $("#name_add").val();
            let password = $("#password_add").val();

            //Kiểm tra ràng buộc dữ liệu
            if (email == "") {
                toastr.warning('Tài khoản Email không được phép để trống.', 'Thông báo!');
                return;
            }

            if (fullname == "") {
                toastr.warning('Tên nhân viên không được phép để trống.', 'Thông báo!');
                return;
            }

            if (password == "") {
                toastr.warning('Mật khẩu không được phép để trống.', 'Thông báo!');
                return;
            }

            $.ajax({
                type: "GET",
                url: "/Ajax/addNV.aspx",
                data: {
                    action: "addnv",
                    email: email,
                    fullname: fullname,
                    password: password
                },
                dataType: "",
                success: function (response) {
                    if (response == 1) {
                        toastr.remove();
                        toastr.success('Thêm thành công.', 'Thông báo!');
                        $("#modeladduser").modal('hide');
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else if (response.includes("exist")) {
                        toastr.warning('Email này đã đăng ký tài khoản nhân viên.', 'Thông báo!');
                    } else {
                        toastr.warning('Lỗi hệ thống.', 'Thông báo!');
                    }
                }
            });

        });

        
       
       
    });

    //Xóa nhân viên
    $(".xoa_nv").click(function (e) {
        e.preventDefault();
        let id_user = $(this).attr("data-nhanvien"); 
        let name_user = $(this).attr("data-name");
        $(".nv_name").text(name_user);
        $("#modeldelete").modal();

        $("#add_delete").click(() => {
            $.ajax({
                type: "GET",
                url: "/Ajax/addNV.aspx",
                data: {
                    action: "deleteNV",
                    id_user: id_user,
                },
                dataType: "",
                success: function (response) {
                    if (response == 1) {
                        $("#modeldelete").modal('hide');
                        toastr.remove();
                        toastr.success('Xóa thành công.', 'Thông báo!');
                        
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        toastr.warning('Lỗi hệ thống.', 'Thông báo!');
                    }
                }
            });
        });
    });

    //Cập nhật dữ liệu nhân viên
    $(".update_nv").click(function (e) {
        e.preventDefault();
        let id_user = $(this).attr("data-nhanvien");
        let name_user = $(this).attr("data-name");
        let email_user = $(this).attr("data-email");

        $(".name_nv_update").val(name_user.trim());
        $(".email_nv_update").val(email_user);

        $("#modelupdate").modal();

        $("#update_nv").click(() => {
            $.ajax({
                type: "GET",
                url: "/Ajax/addNV.aspx",
                data: {
                    action: "updateNV",
                    id_user: id_user,
                    name_user: $(".name_nv_update").val(),
                    user_role: $("#user_role").val(),
                    password: $("#pass_update").val()
                },
                dataType: "",
                success: function (response) {
                    if (response == 1) {
                        $("#modelupdate").modal('hide');
                        toastr.remove();
                        toastr.success('Cập nhật thành công.', 'Thông báo!');

                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        toastr.warning('Lỗi hệ thống.', 'Thông báo!');
                    }
                }
            });
        });
    });
});


function checkEmail() {

}