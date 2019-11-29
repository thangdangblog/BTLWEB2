<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="donhang.aspx.cs" Inherits="MITComputerWebForm.Pages.donhang" %>
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
                <h1 class="page-header">Danh sách đơn hàng</h1>
            </div>
        </div>
        <!--/.row-->
        <% if (getCurrentRole())
            { %>
        <div id="toolbar" class="btn-group">
            <a href="#" class="btn btn-success" id="btn-themdonhang">
                <i class="glyphicon glyphicon-plus"></i>Thêm đơn
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
                                    <th data-field="id" data-sortable="true">Mã đơn hàng</th>
                                    <th data-field="name" data-sortable="true">Mã sản phẩm</th>
                                    <th data-field="price" data-sortable="true">Tên sản phẩm</th>
                                    <th>Người lên đơn</th>
                                    <th>Khách hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Số lượng</th>
                                    <th>Ngày lên đơn</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (string[] donhang in getAllDH())
                                    { %>
                                <tr>
                                    <td style=""><%= donhang[0] %></td>
                                    <td style=""><%= donhang[2] %></td>
                                    <td style=""><%= getNameProduct(donhang[2]) %></td>
                                    <td><%= getNameNhanVien(donhang[1]) %></td>
                                    <td><%=donhang[4] %></td>
                                    <td><%=donhang[5] %></td>
                                    <td><%=donhang[6] %></td>
                                    <td><%=donhang[3] %></td>
                                    <td class="form-group">
                                        <%--<a href="#" class="btn btn-primary update_nv" "><i class="glyphicon glyphicon-pencil"></i></a>--%>
                                        <a href="#" data-name="" class="btn btn-primary xoa_nv"><i class="glyphicon glyphicon-print"></i></a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
    <!--/.main-->

    <div id="modeladddh" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Cập nhật đơn hàng</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username_add">Tên sản phẩm:</label>
                        <select id="nameChange" class="form-control">
                            <% foreach (string[] sanpham in getSanPham()) { %>
                            <option data-money="<%= sanpham[3] %>" data-masanpham="<%= sanpham[1] %>" value="<%= sanpham[0] %>"><%= sanpham[1] %> - <%= sanpham[2] %></option>
                            <%} %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="username_add">Giá:</label>
                        <input id="gia_donhang" type="text" class="form-control soluong_donhang" disabled>
                    </div>
                    <div class="form-group">
                        <label for="username_add">Số lượng:</label>
                        <input id="soluong_donhang" type="number" min="1" max="1000" class="form-control soluong_donhang">
                    </div>
                    <div class="form-group">
                        <label for="username_add">Họ tên khách hàng:</label>
                        <input id="namekh" type="text" class="form-control name_khachhang">
                    </div>

                    <div class="form-group">
                        <label for="username_add">Số điện thoại:</label>
                        <input id="sdtkh" type="text" class="form-control sodienthoai_khachhang">
                    </div>
                    <div class="form-group">
                        <label for="username_add">Tổng tiền: <span class="totalMoney" style="color:red;font-weight:bold">...</span></label>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="them_don_hang" class="btn btn-success">Thêm mới</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
