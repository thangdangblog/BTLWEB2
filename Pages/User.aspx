<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="MITComputerWebForm.Pages.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="index.php">Dashboard</a></li>
                <li class="active">Danh sách thành viên</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh sách nhân viên</h1>
            </div>
        </div>
        <!--/.row-->
        <% if (getCurrentRole())
            { %>
        <div id="toolbar" class="btn-group">
            <a href="#" class="btn btn-success" id="btn-themnhanvien">
                <i class="glyphicon glyphicon-plus"></i>Thêm nhân viên
            </a>
        </div>
        <% } %>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table
                            data-toolbar="#toolbar"
                            data-toggle="table">

                            <thead>
                                <tr>
                                    <th data-field="id" data-sortable="true">ID</th>
                                    <th data-field="name" data-sortable="true">Họ & Tên</th>
                                    <th data-field="price" data-sortable="true">Email</th>
                                    <th>Quyền</th>
                                    <% if (getCurrentRole())
                                        { %>
                                    <th>Hành động</th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (string[] nhanvien in getAllNV())
                                    { %>
                                <tr>
                                    <td style=""><%= nhanvien[0] %></td>
                                    <td style=""><%= nhanvien[2] %></td>
                                    <td style=""><%= nhanvien[1] %></td>
                                    <td><span class="label <%= getClassRole(nhanvien[3]) %>"><%= getRole(nhanvien[3]) %></span></td>
                                    <% if (getCurrentRole())
                                        { %>
                                    <td class="form-group">
                                        <a href="#" class="btn btn-primary update_nv" data-name="<%= nhanvien[2] %>" data-email="<%= nhanvien[1] %>" data-nhanvien="<%= nhanvien[0] %>"><i class="glyphicon glyphicon-pencil"></i></a>
                                        <a href="#" data-name="<%= nhanvien[2] %>" data-nhanvien="<%= nhanvien[0] %>" class="btn btn-danger xoa_nv"><i class="glyphicon glyphicon-remove"></i></a>
                                    </td>
                                    <% } %>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <%--<div class="panel-footer">
                        <nav aria-label="page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                            </ul>
                        </nav>
                    </div>--%>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
    <!--/.main-->

    <div id="modeladduser" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm nhân viên</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username_add">Email:</label>
                        <input type="text" class="form-control" id="email_add">
                    </div>
                    <div class="form-group">
                        <label for="username_add">Họ tên:</label>
                        <input type="text" class="form-control" id="name_add">
                    </div>
                    <div class="form-group">
                        <label for="password_add">Password:</label>
                        <input type="password" class="form-control" id="password_add">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="add_nv" class="btn btn-success">Thêm nhân viên</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
    <div id="modeldelete" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Xác nhận xóa nhân viên</h4>
                </div>
                <div class="modal-body">
                    Bạn có đồng ý xóa nhân viên <strong style="color: red;"><span class="nv_name"></span></strong>?
                </div>
                <div class="modal-footer">
                    <button type="button" id="add_delete" class="btn btn-danger">Xóa nhân viên</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
    <div id="modelupdate" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Cập nhật nhân viên</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username_add">Email:</label>
                        <input type="text" class="form-control email_nv_update" disabled>
                    </div>
                    <div class="form-group">
                        <label for="username_add">Họ tên:</label>
                        <input type="text" class="form-control name_nv_update">
                    </div>

                    <div class="form-group">
                        <label for="username_add">Quyền:</label>
                        <select id="user_role">
                            <option value="false">Nhân viên</option>
                            <option value="true">Quản lý</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="password_add">Password:</label>
                        <input type="password" class="form-control password_nv_update" id="pass_update">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="update_nv" class="btn btn-success">Cập nhật</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
