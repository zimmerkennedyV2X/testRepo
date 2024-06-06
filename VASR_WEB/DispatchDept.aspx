<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispatchDept.aspx.cs" Inherits="VASR_WEB.DispatchDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="row">
        <asp:HiddenField ID="Section" runat="server" />


        <div class="col-md-12">
            <h3 id="title" runat="server">Vehicles Currently Dispatched 
      
            </h3>
            <hr />


        </div>


    </div>

    <div class="row">
        <div class="col-md-12">
                  <asp:ListView ID="listDispatchCurrently" runat="server" DataSourceID="SqlDataSource2">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No vehicles dispatched today.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="VehicleAdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="VehiclePlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ModelLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("Model") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FullNameLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("FullName") %>' />
                    </td>

                    <td>
                        <asp:Label ID="StartDateAndTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("StartDateAndTime") %>' />
                    </td>
                    <td class="text-center  <%# GetStatusColor(Eval("DaysChecked"))  %>">
                        <asp:Label ID="DaysCheckedLabel" Font-Size="Smaller" Font-Bold="true" runat="server" Text='<%# Eval("DaysChecked") %>' />
                    day/s
     

                         <td>
                             <a href="/DispatchExtend.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-info-sign"></span> Extend Usage</a>
                         </td>
                      <td>
                             <a href="/DispatchExtend.aspx?ID=<%# Eval("ID") %>" class="btn btn-warning btn-xs"><span class="glyphicon glyphicon-info-sign"></span> Report Accident</a>
                         </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="width: 100%">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">Admin Number</th>
                                    <th runat="server">Plate Number</th>
                                    <th runat="server">Model</th>
                                    <th runat="server">Operator</th>
                                    <th runat="server">Checkout Date And Time</th>
                                    <th runat="server">Days Used</th>
                                    <th></th>
                                    <th></th>
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




        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewCurrentlyDispatched] WHERE ([Section] Like '%'+ @Section + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="Section" Name="Section" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        </div>
  
    </div>

</asp:Content>
