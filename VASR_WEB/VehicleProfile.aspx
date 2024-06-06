<%@ Page Title="Vehicle Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleProfile.aspx.cs" Inherits="VASR_WEB.VehicleProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%">
        <EditItemTemplate>

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">

                        <div class="form-group">
                            <small>Permanently Issued:</small>
                            <br />
                            <asp:CheckBox ID="CheckBox1" CssClass="form-control" runat="server" Checked='<%# Bind("PermIssued") %>' />

                        </div>
                        <div class="form-group">
                            <small>Section: </small>
                            <br />
                            <%--                   <asp:DropDownList ID="DDLSection" CssClass="form-control" runat="server" SelectedValue='<%# Eval("Section").ToString().Trim() %>'>
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
                            </asp:DropDownList>--%>

                            <asp:TextBox ID="SectionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Section") %>' />

                            <asp:RequiredFieldValidator ErrorMessage="Section is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="SectionTextBox" runat="server" />

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
                                    <asp:TextBox ID="RegExpiryTextBox" CssClass="form-control" runat="server" Text='<%# Bind("RegExpiry","{0:d}") %>' />
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
                                    <%--        <asp:DropDownList ID="DDLVehicleLocation" CssClass="form-control" runat="server" SelectedValue='<%# Bind("VehicleLocation") %>'>
                                        <asp:ListItem Value="">- Select Location -</asp:ListItem>
                                        <asp:ListItem Value="Camp Arifjan">Camp Arifjan</asp:ListItem>
                                        <asp:ListItem Value="Camp Buehring">Camp Buehring</asp:ListItem>

                                    </asp:DropDownList>--%>
                                    <asp:TextBox ID="VehicleLocationTextBox" CssClass="form-control" runat="server" Text='<%# Bind("VehicleLocation") %>' />

                                    <asp:RequiredFieldValidator ErrorMessage="POC Location is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="VehicleLocationTextBox" runat="server" />

                                </div>



                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <small>Notes:</small>
                                <asp:TextBox CssClass="form-control" Enabled="true" Font-Bold="true" runat="server" ID="Label4" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </div>
                        </div>

                    </div>


                </div>
                <asp:LinkButton ID="CancelButton" CssClass="btn btn-success btn-md" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                <asp:LinkButton ID="UpdateButton" CssClass="btn btn-success btn-md" runat="server" CausesValidation="True" CommandName="Update" Text="Update Vehicle" />

            </div>

        </EditItemTemplate>

        <ItemTemplate>

            <div class="row">
                <div class="col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">

                    <div class="">

                        <div class="col-sm-12">
                            <div class="col-xs-12 col-sm-8">
                                <h2>
                                    <asp:Label CssClass="" ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
                                    - 
                                    <asp:Label CssClass="" ID="AdminNumberLabel" runat="server" Text='<%# Bind("AdminNumber") %>' />
                                    <br />
                                    <asp:Label CssClass="" ID="PlateNumberLabel" runat="server" Text='<%# Bind("PlateNumber") %>' />




                                </h2>


                                <div class="row">
                                    <div class="col-md-4">
                                        <small>Designated Operator:</small>
                                        <br />
                                        <asp:Label CssClass="" ID="Label2" runat="server" Text='<%# Bind("DesignatedOperator") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-4">



                                        <small>Phone Number:</small>
                                        <br />
                                        <asp:Label CssClass="" ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                        <br />

                                    </div>
                                    <div class="col-md-4">

                                        <small>Vehicle Location:</small>
                                        <br />

                                        <asp:Label CssClass="" ID="VehicleLocationLabel" runat="server" Text='<%# Bind("VehicleLocation") %>' />
                                    </div>

                                </div>
                                <hr />
                                <div class="row">

                                    <div class="col-md-4">
                                        <small>Registration Expiry Date:</small>
                                        <br />
                                        <asp:Label CssClass="" ID="RegExpiryLabel" runat="server" Text='<%# Bind("RegExpiry","{0:d}") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <small>Service Due Mileage:</small>
                                        <br />
                                        <asp:Label CssClass="" ID="Label1" runat="server" Text='<%# Bind("DueMileage") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-4"></div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <small>Notes:</small>
                                        <asp:TextBox CssClass="form-control" Enabled="false" Font-Bold="true" runat="server" ID="Label4" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xs-12 col-sm-4 text-center">
                                <figure>
                                    <asp:ListView ID="lvVehiclePhotos1" runat="server">
                                        <ItemTemplate>

                                            <div class="item <%# (Container.DataItemIndex == 0 ? "active" : "") %>">
                                                <asp:Image ID="img_attachedImage" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("VehiclePictures")) %>' runat="server" />
                                            </div>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <div class="carousel slide" data-ride="carousel" id="itemPlaceholderContainer" runat="server">

                                                <div class="carousel-inner" role="listbox">

                                                    <div id="itemPlaceholder" runat="server"></div>


                                                </div>


                                                <a class="left carousel-control" href="#itemPlaceholderContainer" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="right carousel-control" href="#itemPlaceholderContainer" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>

                                            </div>
                                        </LayoutTemplate>
                                    </asp:ListView>

                                    <asp:Repeater ID="lvVehiclePhotos" runat="server">
                                        <HeaderTemplate>
                                            <div class="carousel slide" id="itemPlaceholderContainer" data-ride="carousel">
                                                <div class="carousel-inner" role="listbox">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                                                <asp:Image ID="img_attachedImage" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("VehiclePictures")) %>' runat="server" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </div>
                                            <a class="left carousel-control" href="#itemPlaceholderContainer" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="right carousel-control" href="#itemPlaceholderContainer" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                                <span class="sr-only">Next</span>
                                            </a></div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <figcaption>
                                        <h4>
                                            <asp:Label CssClass="" ID="SectionLabel" runat="server" Text='<%# Bind("Section") %>' />

                                        </h4>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>
                        <div class="col-xs-12 divider text-center">
                            <div class="col-xs-12 col-sm-4 emphasis">
                                <h2><strong>
                                    <asp:Label CssClass="" ID="CurrentMileageLabel" runat="server" Text='<%# Bind("CurrentMileage") %>' />
                                    km
                                </strong></h2>
                                <p><small>Current Mileage</small></p>

                                <asp:LinkButton ID="EditButton" CssClass="btn btn-success btn-block" runat="server" CausesValidation="False" CommandName="Edit"><span class="glyphicon glyphicon-pencil"></span> Edit Vehicle</asp:LinkButton>

                            </div>
                            <div class="col-xs-12 col-sm-4 emphasis">
                                <h2><strong>
                                    <asp:Label ID="CurrentFuelLevelLabel" runat="server" Text='<%# Bind("CurrentFuelLevel") %>' />
                                </strong></h2>
                                <p><small>Current Fuel Level</small></p>

                                <asp:LinkButton ID="lnkUploadPhotos" CssClass="btn btn-info btn-block" OnClick="lnkUploadPhotos_Click" runat="server"><span class="glyphicon glyphicon-camera"></span>&nbsp;Upload Vehicle Photos</asp:LinkButton>

                            </div>
                            <div class="col-xs-12 col-sm-4 emphasis">
                                <h2><strong>
                                    <asp:Label CssClass="" ID="VehicleCodeLabel" runat="server" Text='<%# Bind("VehicleCode") %>' />
                                </strong></h2>
                                <p><small>Vehicle Code</small></p>
                                <div class="btn-group dropup btn-block">
                                    <button type="button" class="btn btn-primary"><span class="fa fa-gear"></span>Options </button>
                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu text-left" role="menu">
                                        <li>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Text="Update Vehicle Usage Records" OnClick="LinkButton1_Click" />
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





        </ItemTemplate>
    </asp:FormView>

    <br />


    <div class="modal fade" id="confirmReservationPop" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-camera"></span>&nbsp;Upload Vehicle Photos</h4>
                </div>
                <div class="modal-body">
                    <label>Choose a photo to upload. <em>Click browse</em> </label>
                    <asp:FileUpload ID="FileUpload2" CssClass="form-control" runat="server" />

                    <div class="text-right" style="padding-top: 3px;">
                        <asp:Button ID="Button1" runat="server" Text="Upload File" CssClass="btn btn-success btn-sm text-right" OnClick="Button1_Click" />

                    </div>

                    <h6><strong>Uploaded Photos</strong></h6>

                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField Visible="false" DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField Visible="false" DataField="VehicleID" HeaderText="VehicleID" SortExpression="VehicleID" />
                            <asp:BoundField DataField="PhotoFileName" HeaderText="Photo Filename" SortExpression="PhotoFileName" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" DeleteCommand="DELETE FROM [tblVehiclePhotos] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblVehiclePhotos] ([VehiclePictures], [VehicleID], [PhotoFileName]) VALUES (@VehiclePictures, @VehicleID, @PhotoFileName)" SelectCommand="SELECT * FROM [tblVehiclePhotos] WHERE ([VehicleID] = @VehicleID)" UpdateCommand="UPDATE [tblVehiclePhotos] SET [VehiclePictures] = @VehiclePictures, [VehicleID] = @VehicleID, [PhotoFileName] = @PhotoFileName WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="VehiclePictures" Type="Object" />
                            <asp:Parameter Name="VehicleID" Type="Int32" />
                            <asp:Parameter Name="PhotoFileName" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="VehicleID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="VehiclePictures" Type="Object" />
                            <asp:Parameter Name="VehicleID" Type="Int32" />
                            <asp:Parameter Name="PhotoFileName" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>



                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" DeleteCommand="DELETE FROM [tblVehicleFleets] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblVehicleFleets] ([AdminNumber], [PlateNumber], [Model], [DueMileage], [RegExpiry], [CurrentMileage], [CurrentFuelLevel], [VehicleStatus], [VehicleCode], [DesignatedOperator], [PhoneNumber], [VehicleLocation], [Section], [Comments], [PermIssued]) VALUES (@AdminNumber, @PlateNumber, @Model, @DueMileage, @RegExpiry, @CurrentMileage, @CurrentFuelLevel, @VehicleStatus, @VehicleCode, @DesignatedOperator, @PhoneNumber, @VehicleLocation, @Section, @Comments, @PermIssued)" SelectCommand="SELECT * FROM [tblVehicleFleets] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [tblVehicleFleets] SET [AdminNumber] = @AdminNumber, [PlateNumber] = @PlateNumber, [Model] = @Model, [DueMileage] = @DueMileage, [RegExpiry] = @RegExpiry, [CurrentMileage] = @CurrentMileage, [CurrentFuelLevel] = @CurrentFuelLevel, [VehicleStatus] = @VehicleStatus, [VehicleCode] = @VehicleCode, [DesignatedOperator] = @DesignatedOperator, [PhoneNumber] = @PhoneNumber, [VehicleLocation] = @VehicleLocation, [Section] = @Section, [Comments] = @Comments, [PermIssued] = @PermIssued WHERE [ID] = @ID">
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
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="PermIssued" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
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
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="PermIssued" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="row">

        <div class="col-md-6">
            <h4><strong>Usage Records</strong></h4>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">

                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No vehicle usage record was found.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="FullNameLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("FullName") %>' />
                        </td>

                        <td>
                            <asp:Label ID="StartDateAndTimeLabel" Font-Size="Smaller" runat="server" Text='<%# Eval("StartDateAndTime") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label3" Font-Size="Smaller" runat="server" Text='<%# Eval("EndMileage") %>' />
                        </td>






                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table table-sm table-striped table-hover " runat="server" border="0" style="">
                                    <tr runat="server" style="color: #004f71">

                                        <th runat="server">Operator</th>
                                        <th runat="server">Record Date/Time</th>
                                        <th runat="server">End Mileage</th>

                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server" style="text-align: right">


                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-info btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-info btn-sm" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewVehicleUsageRecords] WHERE ([VehicleID] = @VehicleID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="VehicleID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6">

                    <h4><strong>Documents</strong></h4>


                </div>
                <div class="col-md-6 text-right">
                    <asp:Button ID="btnUploadWeekly" CssClass="btn btn-warning btn-xs" Text="Upload Files" OnClick="btnUploadWeekly_Click" runat="server" />
                </div>
            </div>

            <section id="weeklyInspectionUploader" runat="server" visible="false">
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />

                <div class="text-right" style="padding-top: 2px;">
                    <asp:Button ID="btnUploadDocuments" runat="server" Text="Upload File" CssClass="btn btn-success btn-sm text-right" OnClick="btnUploadDocuments_Click" />

                </div>

            </section>


            <asp:ListView ID="lvWeeklyInspections" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" Font-Size="Smaller" Text='<%# Eval("FileName") %>' runat="server" /></td>
                        <td>
                            <asp:Label ID="lblFileName" Font-Size="Smaller" Text='<%# Eval("WeeklyInspectionDate","{0:d}") %>' runat="server" /></td>
                        <td>
                            <asp:LinkButton CssClass="btn btn-info btn-xs" CommandArgument='<%# Eval("ID") %>' ID="downloadDoc" OnClick="downloadDoc_Click" runat="server"><span class="glyphicon glyphicon-download-alt"></span></asp:LinkButton>
                        </td>

                    </tr>

                </ItemTemplate>

                <LayoutTemplate>
                    <table id="itemPlaceHolderContainer" class="table table-hover" runat="server">
                        <tr runat="server">
                            <th runat="server"><small>File Name</small></th>
                            <th runat="server"><small>Upload Date</small></th>
                            <th runat="server"><small>Download</small></th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>


                </LayoutTemplate>
                <EmptyDataTemplate>
                    <small>No weekly inspection records found</small>
                </EmptyDataTemplate>
            </asp:ListView>

        </div>


    </div>





</asp:Content>
