<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagersList.aspx.cs" Inherits="VASR_WEB.ManagersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="row">


        <h3><strong>Department Manager List </strong> </h3>
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
                         <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Section") %>' />
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
                                    <th runat="server">Department</th>
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
                     <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Section") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT AspNetUsers.Email, AspNetRoles.Name, tblDeptManagerSections.Section FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id INNER JOIN tblDeptManagerSections ON AspNetUsers.Id = tblDeptManagerSections.UserID"></asp:SqlDataSource>
    </div>

</asp:Content>
