<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewVehicle.aspx.cs" Inherits="VASR_WEB.NewVehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3><strong>+ Add a New Vehicle to the Fleet</strong></h3>


    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DefaultMode="Insert" DataSourceID="SqlDataSource1" Width="60%">

        <InsertItemTemplate>

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">

                        <div class="form-group">
                            <small>Section: </small>
                            <br />
                            <asp:DropDownList ID="DDLSection" CssClass="form-control" runat="server" SelectedValue='<%# Bind("Section") %>'>
                                <asp:ListItem Value="">- Select Department -</asp:ListItem>
                                <asp:ListItem Value="ASD-N">ASD-N</asp:ListItem>
                                <asp:ListItem Value="ASD-S">ASD-S</asp:ListItem>
                                <asp:ListItem Value="AVD-N">AVD-N</asp:ListItem>
                                <asp:ListItem Value="AVD-S">AVD-S</asp:ListItem>
                                <asp:ListItem Value="PMD-N">PMD-N</asp:ListItem>
                                <asp:ListItem Value="PMD-S">PMD-S</asp:ListItem>
                                <asp:ListItem Value="IM-N">IM-N</asp:ListItem>
                                <asp:ListItem Value="IM-S">IM-S</asp:ListItem>
                                <asp:ListItem Value="SSD-N">SSD-N</asp:ListItem>
                                <asp:ListItem Value="SSD-S">SSD-S</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:TextBox ID="SectionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Section") %>' />--%>

                            <asp:RequiredFieldValidator ErrorMessage="Section is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLSection" runat="server" />

                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Admin Number:</small>
                                    <br />
                                    <asp:TextBox ID="AdminNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("AdminNumber") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Admin Number is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="AdminNumberTextBox" runat="server" />

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Vehicle Plate Number:</small>
                                    <br />
                                    <asp:TextBox ID="PlateNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("PlateNumber") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Vehicle Plate Number is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="PlateNumberTextBox" runat="server" />
                                </div>
                            </div>


                            <div class="col-md-4">

                                <div class="form-group">
                                    <small>Model/Make:</small>
                                    <br />
                                    <asp:TextBox ID="ModelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Model") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Model/Make is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="ModelTextBox" runat="server" />


                                </div>

                            </div>


                        </div>



                        <h5 class="vehicleProfile"><strong>Current Records</strong></h5>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <small>Current Mileage:</small>
                                    <br />
                                    <asp:TextBox ID="CurrentMileageTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CurrentMileage") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Current Mileage of the vehicle is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="CurrentMileageTextBox" runat="server" />


                                </div>

                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <small>Current Fuel Level:</small>
                                    <br />
                                    <asp:DropDownList ID="DDLFuelLevel" CssClass="form-control" runat="server" SelectedValue='<%# Bind("CurrentFuelLevel") %>'>
                                        <asp:ListItem Value="">- Select Level -</asp:ListItem>
                                        <asp:ListItem Value="Full Tank">Full Tank</asp:ListItem>
                                        <asp:ListItem Value="3/4 Tank">3/4 Tank</asp:ListItem>
                                        <asp:ListItem Value="Half Tank">Half Tank</asp:ListItem>
                                        <asp:ListItem Value="Quarter Tank">Quarter Tank</asp:ListItem>
                                        <asp:ListItem Value="Empty Tank">Empty Tank</asp:ListItem>

                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="CurrentFuelLevelTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CurrentFuelLevel") %>' />--%>
                                    <asp:RequiredFieldValidator ErrorMessage="Current fuel level of the vehicle is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLFuelLevel" runat="server" />


                                </div>

                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <small>Vehicle Code:</small>
                                    <br />
                                    <asp:DropDownList ID="DDLVehicleCode" CssClass="form-control" runat="server" SelectedValue='<%# Bind("VehicleCode") %>'>
                                        <asp:ListItem Value="">- Select Code -</asp:ListItem>
                                        <asp:ListItem Value="1">1 - NTV</asp:ListItem>
                                        <asp:ListItem Value="2">2 - Pick-up</asp:ListItem>
                                        <asp:ListItem Value="3">3 - Cargo Van</asp:ListItem>
                                        <asp:ListItem Value="4">4 - Canter</asp:ListItem>
                                        <asp:ListItem Value="5">5 - Commercial</asp:ListItem>
                                        <asp:ListItem Value="6">6 - Heavy License/KDL</asp:ListItem>
                                        <asp:ListItem Value="6">7 - Heavy Equipment</asp:ListItem>

                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("VehicleCode") %>' />--%>


                                    <asp:RequiredFieldValidator ErrorMessage="Vehicle code is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLVehicleCode" runat="server" />

                                </div>


                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <small>Vehicle Status:</small>
                                    <br />
                                    <asp:CheckBox ID="VehicleStatusCheckBox" CssClass="form-control" runat="server" Checked='<%# Bind("VehicleStatus") %>' />

                                </div>

                            </div>

                        </div>


                        <h5 class="vehicleProfile"><strong>Vehicle Maintenance</strong></h5>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Registration Expiry Date:</small>
                                    <br />
                                    <asp:TextBox ID="RegExpiryTextBox" CssClass="form-control" TextMode="Date" runat="server" Text='<%# Bind("RegExpiry") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Vehicle registration expiry is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="RegExpiryTextBox" runat="server" />


                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Service Due Mileage:</small>
                                    <br />
                                    <asp:TextBox ID="DueMileageTextBox" CssClass="form-control" runat="server" Text='<%# Bind("DueMileage") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Vehicle registration expiry is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DueMileageTextBox" runat="server" />

                                </div>


                            </div>
                            <div class="col-md-4"></div>


                        </div>

                        <h5 class="vehicleProfile"><strong>Vehicle POC and Location </strong></h5>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Designated Operator:</small>
                                    <br />
                                    <asp:TextBox ID="DesignatedOperatorTextBox" CssClass="form-control" runat="server" Text='<%# Bind("DesignatedOperator") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="POC Operator is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DesignatedOperatorTextBox" runat="server" />


                                </div>



                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Phone Number:</small>
                                    <br />
                                    <asp:TextBox ID="PhoneNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="POC Phone is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="PhoneNumberTextBox" runat="server" />

                                </div>




                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <small>Vehicle Location:</small>
                                    <br />
                                    <asp:DropDownList ID="DDLVehicleLocation" CssClass="form-control" runat="server" SelectedValue='<%# Bind("VehicleLocation") %>'>
                                        <asp:ListItem Value="">- Select Location -</asp:ListItem>
                                        <asp:ListItem Value="Camp Arifjan">Camp Arifjan</asp:ListItem>
                                        <asp:ListItem Value="Camp Buehring">Camp Buehring</asp:ListItem>

                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("VehicleLocation") %>' />--%>

                                    <asp:RequiredFieldValidator ErrorMessage="POC Location is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLVehicleLocation" runat="server" />

                                </div>



                            </div>

                        </div>

                    </div>


                </div>
                <asp:LinkButton ID="InsertButton" CssClass="btn btn-success btn-lg" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Vehicle" />

            </div>


        </InsertItemTemplate>

    </asp:FormView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" DeleteCommand="DELETE FROM [tblVehicleFleets] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblVehicleFleets] ([AdminNumber], [PlateNumber], [Model], [DueMileage], [RegExpiry], [CurrentMileage], [CurrentFuelLevel], [VehicleStatus], [VehicleCode], [DesignatedOperator], [PhoneNumber], [VehicleLocation], [Section]) VALUES (@AdminNumber, @PlateNumber, @Model, @DueMileage, @RegExpiry, @CurrentMileage, @CurrentFuelLevel, @VehicleStatus, @VehicleCode, @DesignatedOperator, @PhoneNumber, @VehicleLocation, @Section)" SelectCommand="SELECT * FROM [tblVehicleFleets]" UpdateCommand="UPDATE [tblVehicleFleets] SET [AdminNumber] = @AdminNumber, [PlateNumber] = @PlateNumber, [Model] = @Model, [DueMileage] = @DueMileage, [RegExpiry] = @RegExpiry, [CurrentMileage] = @CurrentMileage, [CurrentFuelLevel] = @CurrentFuelLevel, [VehicleStatus] = @VehicleStatus, [VehicleCode] = @VehicleCode, [DesignatedOperator] = @DesignatedOperator, [PhoneNumber] = @PhoneNumber, [VehicleLocation] = @VehicleLocation, [Section] = @Section WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AdminNumber" Type="String" />
            <asp:Parameter Name="PlateNumber" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="DueMileage" Type="String" />
            <asp:Parameter DbType="Date" Name="RegExpiry" />
            <asp:Parameter Name="CurrentMileage" Type="String" />
            <asp:Parameter Name="CurrentFuelLevel" Type="String" />
            <asp:Parameter Name="VehicleStatus" Type="Boolean" />
            <asp:Parameter Name="VehicleCode" Type="Int32" />
            <asp:Parameter Name="DesignatedOperator" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="VehicleLocation" Type="String" />
            <asp:Parameter Name="Section" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AdminNumber" Type="String" />
            <asp:Parameter Name="PlateNumber" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="DueMileage" Type="String" />
            <asp:Parameter DbType="Date" Name="RegExpiry" />
            <asp:Parameter Name="CurrentMileage" Type="String" />
            <asp:Parameter Name="CurrentFuelLevel" Type="String" />
            <asp:Parameter Name="VehicleStatus" Type="Boolean" />
            <asp:Parameter Name="VehicleCode" Type="Int32" />
            <asp:Parameter Name="DesignatedOperator" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="VehicleLocation" Type="String" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>








</asp:Content>
