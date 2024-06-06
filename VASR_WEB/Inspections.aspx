<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inspections.aspx.cs" Inherits="VASR_WEB.Inspections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

        <div class="col-md-6">
            <h3>Daily Fleet Inspections</h3>
            <h4 id="txtDateFiltered" runat="server"></h4>
            <hr />


        </div>

        <div class="col-md-6">

            <br />
            <div class="row">
                <div class="col-md-6">
                    <small style="font-weight: bold;">Filter by Date </small>

                    <asp:TextBox ID="inspectionDateFilter" AutoPostBack="True" OnTextChanged="inspectionDateFilter_TextChanged" CssClass="form-control" TextMode="date" runat="server"></asp:TextBox>

                </div>
                <div class="col-md-6 text-right">
                    <asp:LinkButton ID="redirectToInspectionLogs" runat="server" CssClass="btn btn-info btn-sm" OnClick="redirectToInspectionLogs_Click">Inspection Logs</asp:LinkButton>
                    <button class="btn btn-success btn-sm" id="exportExelInspections" runat="server" onserverclick="exportExelInspections_ServerClick"><span class="glyphicon glyphicon-export"></span> Export Excel</button>

                </div>

            </div>




        </div>





    </div>



    <div class="row">
        <div class="col-lg-12">
            <br />


            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">


                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr class="<%# GetColor(Eval("InspectionDateCompleted"))  %>">

                        <td>
                            <a class="btn btn-default btn-xs" href="InspectionRecord.aspx?ID=<%# Eval("ID") %>"><span class="glyphicon glyphicon-info-sign"></span></a>

                        </td>

                        <td>
                            <asp:Label ID="AdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FullNameLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("FullName") %>' />
                        </td>

                        <td>
                            <asp:Label ID="EndDateLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndDate","{0:d}") %>' />
                        </td>

                        <td>
                            <asp:Label ID="EndTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndTime") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StartMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("StartMileage") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("EndMileage") %>' />
                        </td>

                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="Smaller" Text='<%# Convert.ToBoolean(Eval("ConditionPass")) ? "Good" : "Poor" %>' />
                        </td>


                        <td>
                            <asp:Label ID="InspectionDateCompletedLabel" Font-Size="Smaller" runat="server" Text='<%# FormatInspectionDate(Eval("InspectionDateCompleted")) %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-striped table-hover " id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">

                                        <th runat="server">View</th>
                                        <th runat="server">Admin # </th>
                                        <th runat="server">Plate #</th>
                                        <th runat="server">Make/Model</th>
                                        <th runat="server">Operator</th>
                                        <th runat="server">Return Date</th>
                                        <th runat="server">Return Time</th>
                                        <th runat="server">Start Mileage</th>
                                        <th runat="server">End Mileage</th>
                                        <th runat="server">Condition</th>
                                        <th runat="server">Inspected</th>

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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="spFilterDailyInspection" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="inspectionDateFilter" DbType="Date" DefaultValue="" Name="DateFilter" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>






    <div class="row">

        <div class="col-md-12">
            <h3>Pending Inspections</h3>
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2">

                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>All inspections completed.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">

                        <td>
                            <a class="btn btn-info btn-xs" href="VehicleInspections.aspx?ID=<%# Eval("ID") %>&VehicleID=<%# Eval("VehicleID") %>"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;Inspect</a>

                        </td>
                        <td>
                            <asp:Label ID="AdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ModelLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("Model") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FullNameLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("FullName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StartDateLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("StartDate") %>' />
                        </td>

                        <td>
                            <asp:Label ID="StartTimeLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("StartTime") %>' />
                        </td>

                        <td>
                            <asp:Label ID="StartMileageLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("StartMileage") %>' />
                        </td>

                        <td>
                            <asp:Label ID="EndDateLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("EndDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndTimeLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("EndTime") %>' />
                        </td>

                        <td>
                            <asp:Label ID="EndMileageLabel" runat="server" Font-Size="Smaller" Text='<%# Eval("EndMileage") %>' />
                        </td>


                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                    <tr runat="server" style="">

                                        <th runat="server">Action</th>
                                        <th runat="server">Admin #</th>
                                        <th runat="server">Plate #</th>
                                        <th runat="server">Make/Model</th>
                                        <th runat="server">Operator</th>
                                        <th runat="server">Checkout</th>

                                        <th runat="server">Checkout Time</th>
                                        <th runat="server">Start Mileage</th>
                                        <th runat="server">Return Date</th>
                                        <th runat="server">Return Time</th>

                                        <th runat="server">End Mileage</th>


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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT tblVehicleFleets.AdminNumber, tblVehicleFleets.PlateNumber, tblVehicleFleets.Model, tblVehicleOperators.FullName, CONVERT (Varchar(11), tblDispatchLogs.CheckoutTime, 106) AS StartDate, CONVERT (Varchar(11), tblDispatchLogs.ReturnTime, 106) AS EndDate, CONVERT (Varchar(11), tblDispatchLogs.CheckoutTime, 108) AS StartTime, CONVERT (Varchar(11), tblDispatchLogs.ReturnTime, 108) AS EndTime, tblDispatchLogs.StartMileage, tblDispatchLogs.EndMileage, tblDailyInspection.InspectionDateCompleted, tblDispatchLogs.ID, tblDispatchLogs.VehicleID FROM tblVehicleFleets INNER JOIN tblDispatchLogs ON tblVehicleFleets.ID = tblDispatchLogs.VehicleID INNER JOIN tblVehicleOperators ON tblDispatchLogs.OperatorID = tblVehicleOperators.ID LEFT OUTER JOIN tblDailyInspection ON tblDispatchLogs.ID = tblDailyInspection.DispatchID WHERE (tblDailyInspection.InspectionDateCompleted IS NULL) AND (tblDispatchLogs.ReturnTime IS NOT NULL) ORDER BY StartDate DESC"></asp:SqlDataSource>
            <hr />


        </div>






    </div>






</asp:Content>
