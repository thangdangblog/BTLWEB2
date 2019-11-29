﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MITComputerWebForm.Pages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="index.php">Dashboard</a></li>
			<li class="active">Danh sách sản phẩm</li>
		</ol>
	</div><!--/.row-->
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Danh sách sản phẩm</h1>
		</div>
	</div><!--/.row-->
	<div id="toolbar" class="btn-group">
	
        <asp:Button ID="btnAddProduct" runat="server" Text="Thêm sản phẩm"  CssClass="btn btn-success" OnClick="btnAddProduct_Click"/>
	</div>
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
							<th data-field="name"  data-sortable="true">Tên sản phẩm</th>
                            <th data-field="code"  data-sortable="true">Mã sản phẩm</th>
							<th data-field="price" data-sortable="true">Giá</th>
							<th>Trạng thái</th>
							<th>Danh mục</th>
							<th>Hành động</th>
						</tr>
						</thead>
						<tbody>
                           
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
	</div><!--/.row-->	
</div>	<!--/.main-->
</asp:Content>
