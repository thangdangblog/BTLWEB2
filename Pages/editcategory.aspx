<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="editcategory.aspx.cs" Inherits="MITComputerWebForm.Pages.editcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    <%=idCate() %>
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
						
						<form role="form" method="post">
						<div class="form-group">
							<label>Sửa danh mục:</label>
                            <asp:TextBox ID="txtCatName" name="cat_name" runat="server" CssClass="form-control"></asp:TextBox>
						</div>
                        <asp:Button ID="btnSaveCategory" runat="server" Text="Lưu"  CssClass="btn btn-success" OnClick="btnSaveCategory_Click"/>
                        <asp:Button ID="btnDetroyCategory" runat="server" Text="Thoát"  CssClass="btn btn-danger" OnClick="btnDetroyCategory_Click"/>
					</div>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
    </div>	<!--/.main-->	
</div>

</asp:Content>
