﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MITComputerWebForm.Pages.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    
  
    
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                </li><a href="#">Dashboard 2</a></li>
                <li class="active">Quản lý danh mục</li>
            </ol>

        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Quản lý danh mục</h1>
            </div>
        </div>
        <!--/.row-->
        <div id="toolbar" class="btn-group">
           <asp:Button ID="btnAddCat" runat="server" Text="Thêm danh mục"  CssClass="btn btn-success" OnClick="btnAddCat_Click"/>
        </div>
        <div class="row">
            <div class="col-md-12">
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
                                <% foreach (string[] danhmuc in getAllCategories())
                                    { %>
                                <tr>
                                    <td style=""><%= danhmuc[0] %></td>
                                    <td style=""><%= danhmuc[1] %></td>
                                    <td class="form-group">
                                        <a href="editcategory.aspx?id=<%=danhmuc[0]%>" class="btn btn-primary">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                        </a>

                                        <a href="deletecategory.aspx?id=<%=danhmuc[0]%>" class="btn btn-danger">
                                            <i class="glyphicon glyphicon-remove"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% } %>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
</asp:Content>
