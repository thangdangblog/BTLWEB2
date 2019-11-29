<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Layout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MITComputerWebForm.Pages.Dashboard" %>

<asp:Content ID="ContentLayout" ContentPlaceHolderID="ContentLayout" runat="server">
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="active">Dashboard</li>
            </ol>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-blue panel-widget ">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <em class="glyphicon glyphicon-shopping-cart glyphicon-l"></em>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large"><%=getNewOrder() %></div>
                            <div class="text-muted">Đơn hàng</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-orange panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <em class="glyphicon glyphicon-star glyphicon-l"></em>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large"><%=getProduct() %></div>
                            <div class="text-muted">Sản phẩm</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-4">
                <div class="panel panel-teal panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <em class="glyphicon glyphicon-user glyphicon-l"></em>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large"><%=getNhanVien() %></div>
                            <div class="text-muted">Nhân viên</div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="col-xs-12 col-md-6 col-lg-3">
                <div class="panel panel-red panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <em class="glyphicon glyphicon-stats glyphicon-l"></em>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">25.2k</div>
                            <div class="text-muted">Tổng hóa đơn</div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Biểu đồ</div>
                    <div class="panel-body">
                        <div class="canvas-wrapper">
                            <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->

        <div class="row">
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Đơn hàng mới</h4>
                        <div class="easypiechart" id="easypiechart-blue" data-percent="92">
                            <span class="percent">92%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Nhân viên mới</h4>
                        <div class="easypiechart" id="easypiechart-orange" data-percent="65">
                            <span class="percent">65%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Số lượng khách</h4>
                        <div class="easypiechart" id="easypiechart-teal" data-percent="56">
                            <span class="percent">56%</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body easypiechart-panel">
                        <h4>Đơn hàng mới</h4>
                        <div class="easypiechart" id="easypiechart-red" data-percent="27">
                            <span class="percent">27%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
    <!--/.main-->
</asp:Content>

