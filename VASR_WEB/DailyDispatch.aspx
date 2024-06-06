<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyDispatch.aspx.cs" Inherits="VASR_WEB.DailyDispatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="row">

        <div class="col-md-6">
            <h3>Vehicle Daily Dispatch Report</h3>
            <h4 id="txtDateFiltered" runat="server"></h4>
            <hr />


        </div>

        <div class="col-md-6">

            <br />
            <div class="row">
                <div class="col-md-6">
                    <small style="font-weight: bold;">Filter by Date </small>

                    <asp:TextBox ID="dispatchDateFilter" AutoPostBack="True" OnTextChanged="dispatchDateFilter_TextChanged" CssClass="form-control" TextMode="date" OnLoad="dispatchDateFilter_Load" runat="server"></asp:TextBox>

                </div>
                <div class="col-md-6">
                    <button class="btn btn-success" id="exportExelDispatch" runat="server" onserverclick="exportExelDispatch_ServerClick">Export to Excel</button>

                </div>

            </div>




        </div>





    </div>





    <div class="row">
        <div class="col-lg-12">
            <br />



            <asp:ListView ID="listDailyDispatch" runat="server" DataSourceID="SqlDataSource1">
         
          
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No dispatch records found for this date. </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
       
                <ItemTemplate>
                    <tr style="">

                        <td>
                            <asp:Label ID="FullNameLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("FullName") %>' />
                        </td>
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
                            <asp:Label ID="StartDateLabel" runat="server" Font-Size="Smaller" Text='<%# FormatDate(Eval("StartDate","{0:d}")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="StartTimeLabel" runat="server" Font-Size="Smaller" Text='<%# FormatTime(Eval("StartTime")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndDateLabel" runat="server" Font-Size="Smaller" Text='<%# FormatDate(Eval("EndDate","{0:d}")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndTimeLabel" runat="server" Font-Size="Smaller" Text='<%# FormatTime(Eval("EndTime")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="StartMileageLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("StartMileage") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndMileageLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("EndMileage") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-striped table-hover " id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">Name of Operator</th>

                                        <th runat="server">Admin #</th>
                                        <th runat="server">Plate #</th>
                                        <th runat="server">Model</th>

                                        <th runat="server">Issue Date</th>
                                        <th runat="server">Issue Time</th>
                                        <th runat="server">Receive Date</th>
                                        <th runat="server">Receive Time</th>

                                        <th runat="server">Start Mileage (km)</th>
                                        <th runat="server">End Mileage (km)</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>
                </LayoutTemplate>
            


            </asp:ListView>






        </div>


    </div>





    <div class="row">

        <div class="col-md-12">
            <h3>Vehicles Currently Dispatched
                <br />
                <small style="color: #004F71"> as of <%: DateTime.Now.Date.ToString("dddd, dd MMMM yyyy") %></small>
            </h3>
            <hr />


        </div>






    </div>
    <div class="row">

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
                        <asp:Label ID="FullNameLabel" runat="server"  Font-Size="Smaller" Text='<%# Eval("FullName") %>' />
                    </td>
            
                    <td>
                        <asp:Label ID="StartDateAndTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("StartDateAndTime") %>' />
                    </td>
                    <td class="text-center  <%# GetStatusColor(Eval("DaysChecked"))  %>">
                        <asp:Label ID="DaysCheckedLabel" Font-Size="Smaller" Font-Bold="true" runat="server" Text='<%# Eval("DaysChecked") %>' /> day/s
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

    </div>






    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewCurrentlyDispatched] ORDER BY [StartDateAndTime] DESC"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="spFilterDailyDispatch" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="dispatchDateFilter" Name="DateFilter" PropertyName="Text" Type="String" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
