<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuperAdminDashboard.aspx.cs" Inherits="VASR_WEB.SuperAdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Application Admin Dashboard</h2>

    <hr />
    <div class="row" runat="server" visible="false">

        <h5>Add a Role</h5>
        <h6 style="color: red">*Add a New Role</h6>
        <asp:TextBox ID="txtRole" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-sm" Text="Add a New Role" OnClick="Button1_Click" />
        <h3 id="admin_name" runat="server"></h3>


    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="well well-sm text-center">

                <h5 id="H1" runat="server">Add a Manager</h5>
                <h5 id="roleAdmin" runat="server"></h5>

                <h6 style="color: red"><small>*Enter the email address of the new manager</small></h6>
                <div class="text-center">
                    <asp:TextBox ID="txtManagerEmail" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
                </div>
                <div class="text-right" style="padding-top: 3px;">
                    <asp:Button ID="btnAddtoManager" runat="server" CssClass="btn btn-primary btn-sm " Text="Add a Manager" OnClick="btnAddtoManager_Click" />
                </div>

            </div>
        </div>
        <div class="col-sm-4">
            <div class="well well-sm text-center">

                <h5 id="H2" runat="server">Add a Master Driver</h5>
                <h5 id="H3" runat="server"></h5>

                <h6 style="color: red"><small>*Enter the email address of the new master driver</small></h6>
                <div class="text-center">
                    <asp:TextBox ID="txtMasterDriverEmail" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
                </div>
                <div class="text-right" style="padding-top: 3px;">
                    <asp:Button ID="btnAddtoMasterDriver" runat="server" CssClass="btn btn-primary btn-sm " Text="Add a Master Driver" OnClick="btnAddtoMasterDriver_Click" />
                </div>

            </div>
        </div>
        <div class="col-sm-4">
            <div class="well well-sm text-center">

                <h5 id="H4" runat="server">Add an IMD Admin</h5>
                <h5 id="H5" runat="server"></h5>

                <h6 style="color: red"><small>*Enter the email address of the new admin</small></h6>
                <div class="text-center">
                    <asp:TextBox ID="txtIMDAdminEmail" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
                </div>
                <div class="text-right" style="padding-top: 3px;">
                    <asp:Button ID="btnAddtoIMDAdmin" runat="server" CssClass="btn btn-primary btn-sm " Text="Add an IMD Admin" OnClick="btnAddtoIMDAdmin_Click" />
                </div>

            </div>
        </div>


    </div>

    <div class="row">


        <h3><strong>VASR Application Users </strong> </h3>
        <asp:ListView ID="lvUserRoles" runat="server" DataSourceID="SqlDataSource1">
 
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="width:100%">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer"  class="table table-striped table-hover " runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">Email</th>
                                    <th runat="server">Role</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT AspNetUsers.Email, AspNetRoles.Name FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id"></asp:SqlDataSource>
    </div>


</asp:Content>
