<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MITComputerWebForm.Pages.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentLayout" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="index.php">Dashboard</a></li>
			<li><a href="index.php?page_layout=product">Quản lý sản phẩm</a></li>
			<li class="active">Thêm sản phẩm</li>
		</ol>
	</div><!--/.row-->
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Thêm sản phẩm</h1>
		</div>
	</div><!--/.row-->
	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>Mã sản phẩm</label>
                                <asp:TextBox ID="txtPrdCode" runat="server" class="form-control"  ></asp:TextBox>
							</div>
															
							<div class="form-group">
								<label>Tên sản phẩm</label>
								<asp:TextBox ID="txtPrdName" runat="server" class="form-control"  ></asp:TextBox>
							</div>
							 
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Danh mục</label>
								<asp:TextBox ID="txtPrdCat" runat="server" class="form-control"  ></asp:TextBox>
							</div>    
							<div class="form-group">
								<label>Số lượng sản phẩm</label>
								<asp:TextBox ID="txtPrdNumber" runat="server" class="form-control"  ></asp:TextBox>
							</div>                  
							<div class="form-group">
								<label>Giá sản phẩm</label>
								<asp:TextBox ID="txtPrdPrice" runat="server" class="form-control"  ></asp:TextBox>
							</div> 
                         <asp:Button ID="btnAddProduct" runat="server" Text="Thêm mới"  CssClass="btn btn-success" OnClick="btnAddProduct_Click"/>
						</div>
					</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
	
</div>	<!--/.main-->	

</asp:Content>
