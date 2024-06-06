<%@ Page Title="IMD Vehicles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="VASR_WEB.Vehicles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        
        <ul class="nav nav-tabs">
            <li class="active"><a href="#all" data-toggle="tab" aria-expanded="true">All Vehicles</a></li>
            <li class=""><a href="#30days" data-toggle="tab" aria-expanded="false">Registration Expires in 60 Days or Less</a></li>
            <li class=""><a href="#expired" data-toggle="tab" aria-expanded="false">Registration Expired</a></li>


        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="all">
                <br />
                <div class="row">
                    <div class="col-md-8">
                        <small>Search Vehicle by</small>
                        <div class="form-inline">


                            <asp:DropDownList CssClass="form-control" ID="vehicleSearchSelector" runat="server" Width="220">
                                <asp:ListItem Text="Admin Number" />
                                <asp:ListItem Text="Plate Number" />
                                <asp:ListItem Text="Department" />
                                <asp:ListItem Text="Model" />

                            </asp:DropDownList>


                            <asp:TextBox ID="txtfilterVehicles" placeholder="Enter Number" runat="server" CssClass="form-control" OnTextChanged="txtfilterVehicles_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:Button ID="btnSearchVehicle" runat="server" Text="Search Vehicle" CssClass="btn btn-primary" />




                        </div>
                    </div>
                    <div class="col-md-4 text-right">


                        <div class="form-inline">

                            <%--   <asp:Button ID="btnAddOperator" runat="server" CssClass="btn btn-success btn-sm " Text="+Add New Vehicle" OnClick="btnAddOperator_Click" />--%>

                            <asp:LinkButton ID="lnkAddVehicle" runat="server" CssClass="btn btn-success btn-sm" OnClick="lnkAddVehicle_Click"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add New Vehicle</asp:LinkButton>
                            <asp:LinkButton ID="lnkExportVehicles" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnExportVehicles_Click"><span class="glyphicon glyphicon-export"></span>&nbsp;Export Excel</asp:LinkButton>

                        </div>
                        
                

                    </div>

                </div>

                <br />





                <asp:ListView ID="ListViewVehicleAll" runat="server" DataKeyNames="ID">

                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>Vehicle records not found.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">

                            <td>
                                <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-info-sign"></span></a>
                            </td>

                            <td>
                                <asp:Label ID="VehicleAdminNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>

                            <td>
                                <asp:Label ID="VehiclePlateNumberLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("Model") %>' />
                            </td>


                            <td>
                                <asp:Label ID="Label1" Font-Size="Smaller" runat="server" Text='<%# Eval("Section") %>' />
                            </td>

                            <td>
                                <asp:Label ID="Label2" Font-Size="Smaller" runat="server" Text='<%# Eval("DesignatedOperator") %>' />
                            </td>

                            <td>
                                <asp:Label ID="Label3" Font-Size="Smaller" runat="server" Text='<%# Eval("VehicleLocation") %>' />
                            </td>


                            <td>
                                <asp:Label ID="DueMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("DueMileage") %>' />&nbsp;km
                            </td>
                            <td>
                                <asp:Label ID="RegistrationExpiryLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentMileageLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("CurrentMileage") %>' />&nbsp;km
                            </td>
                            <td class="<%# GetStatusColor(Eval("VehicleStatus"))  %>">
                                <span class="glyphicon glyphicon-flag"></span>
                                <asp:Label ID="Label5" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("VehicleStatus")) ? "Serviceable" : "Not-Serviceable" %>' />&nbsp; -
                            
                                <asp:Label ID="Label4" Font-Size="Smaller" runat="server" Text='<%# Convert.ToBoolean(Eval("PermIssued")) ? "P" : "M" %>' />
                            </td>

                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" style="width: 100%">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                        <thead>
                                            <tr runat="server" style="color: #9a9500">

                                                <th runat="server">Open</th>

                                                <th runat="server">Admin #</th>

                                                <th runat="server">Plate #</th>
                                                <th runat="server">Make/Model</th>
                                                <th runat="server">Section</th>
                                                <th runat="server">Operator</th>
                                                <th runat="server">Location</th>

                                                <th runat="server">Due Mileage</th>
                                                <th runat="server">Registration Expiry</th>
                                                <th runat="server">Current Mileage</th>
                                                <th runat="server">Vehicle Status</th>

                                            </tr>
                                        </thead>

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

            <div class="tab-pane fade" id="30days">


                <asp:ListView ID="ListView30VehiclesExpired" runat="server" DataKeyNames="ID">
                    <AlternatingItemTemplate>
                        <tr style="">


                            <td>
                                <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>

                            <td>
                                <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>

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
                                <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>

                            <td>
                                <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                        <tr runat="server" style="">

                                            <th runat="server">Admin #</th>

                                            <th runat="server">Plate #</th>
                                            <th runat="server">Make/Model</th>
                                            <th runat="server">Due Mileage</th>
                                            <th runat="server">Registration Expiry</th>
                                            <th runat="server">Current Mileage</th>
                                            <th runat="server">Current FuelTank Level</th>
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

            <div class="tab-pane fade" id="expired">

                <asp:ListView ID="ListViewVehiclesExpired" runat="server" DataKeyNames="ID">
                    <AlternatingItemTemplate>
                        <tr style="">

                            <td>
                                <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-outline-info btn-xs">Open</a>
                            </td>

                            <td>
                                <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>

                            <td>
                                <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>

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
                                <a href="/VehicleProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-outline-info btn-xs">Open</a>
                            </td>
                            <td>
                                <asp:Label ID="VehicleAdminNumberLabel" runat="server" Text='<%# Eval("AdminNumber") %>' />
                            </td>

                            <td>
                                <asp:Label ID="VehiclePlateNumberLabel" runat="server" Text='<%# Eval("PlateNumber") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                            </td>
                            <td>
                                <asp:Label ID="DueMileageLabel" runat="server" Text='<%# Eval("DueMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RegistrationExpiryLabel" runat="server" Text='<%# Eval("RegExpiry","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentMileageLabel" runat="server" Text='<%# Eval("CurrentMileage") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CurrentFuelTankLevelLabel" runat="server" Text='<%# Eval("CurrentFuelLevel") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                        <tr runat="server" style="">

                                            <th runat="server">Admin Number</th>

                                            <th runat="server">Plate Number</th>
                                            <th runat="server">Make/Model</th>
                                            <th runat="server">Due Mileage</th>
                                            <th runat="server">Registration Expiry</th>
                                            <th runat="server">Current Mileage</th>
                                            <th runat="server">Current FuelTank Level</th>
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






        </div>












    </div>




</asp:Content>
