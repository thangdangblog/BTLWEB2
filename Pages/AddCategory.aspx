<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MITComputerWebForm.Pages.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="index.php">Dashboard</a></li>
			<li><a href="index.php?page_layout=category">Quản lý danh mục</a></li>
			<li class="active">Thêm danh mục</li>
		</ol>
	</div><!--/.row-->
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Thêm danh mục</h1>
		</div>
	</div><!--/.row-->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-md-8">
						<div class="alert alert-danger box">Danh mục đã tồn tại !</div>
						<form role="form" method="post">
						<div class="form-group">
							<label>Tên danh mục:</label>
                            <asp:TextBox ID="txtCatName" name="cat_name" runat="server" CssClass="form-control"></asp:TextBox>
						</div>
                        <asp:Button ID="btnAddCategory" runat="server" Text="Thêm mới"  CssClass="btn btn-success" OnClick="btnAddCategory_Click"/>
					</div>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
</div>	<!--/.main-->	
</div>
</asp:Content>
