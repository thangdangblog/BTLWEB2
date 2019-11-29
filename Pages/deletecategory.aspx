<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="deletecategory.aspx.cs" Inherits="MITComputerWebForm.Pages.deletecategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
     <%=idCate() %>
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="index.php">Dashboard</a></li>
                <li><a href="index.php?page_layout=category">Quản lý danh mục</a></li>
                <li class="active">Xóa danh mục</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Xóa danh mục</h1>
            </div>
        </div>
        <!--/.row-->
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
                                    <th>Tên danh mục</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="">
                                         <asp:TextBox ID="txtCatId" name="cat_id" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td style="">
                                         <asp:TextBox ID="txtCatName" name="cat_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td class="form-group">
                                        <asp:Button ID="btnDelete" runat="server" Text="Xóa danh mục"  CssClass="btn btn-danger" OnClick="btnDelete_Click"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.col-->
        </div>
        <!--/.main-->
    </div>
</asp:Content>
