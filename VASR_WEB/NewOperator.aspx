<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewOperator.aspx.cs" Inherits="VASR_WEB.NewOperator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4><strong>New Operator Profile</strong> </h4>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DefaultMode="Insert" DataSourceID="SqlDataSource2">
        <InsertItemTemplate>

            <div class="row">
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

                                <%--<asp:TextBox ID="SectionTextBox" runat="server" Text='<%# Bind("Section") %>' />--%>
                                <asp:RequiredFieldValidator ErrorMessage="Section is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLSection" runat="server" />

                            </div>


                            <div class="row">

                                <div class="col-md-4">

                                    <div class="form-group">
                                        <small>IMD Operator Number:</small>
                                        <br />
                                        <asp:TextBox ID="OperatorNumTextBox" CssClass="form-control" runat="server" Text='<%# Bind("OperatorNum") %>' />
                                        <asp:RequiredFieldValidator ErrorMessage="Operator Number is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="OperatorNumTextBox" runat="server" />

                                    </div>

                                </div>



                                <div class="col-md-4">

                                    <div class="form-group">
                                        <small>Operator Name:</small>
                                        <br />
                                        <asp:TextBox ID="FullNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("FullName") %>' />
                                        <asp:RequiredFieldValidator ErrorMessage="Operator Name is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="FullNameTextBox" runat="server" />

                                    </div>

                                </div>


                                <div class="col-md-4">

                                    <small>Job Title:</small>
                                    <br />
                                    <asp:TextBox ID="JobTitleTextBox" CssClass="form-control" runat="server" Text='<%# Bind("JobTitle") %>' />
                                    <asp:RequiredFieldValidator ErrorMessage="Job Title is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="JobTitleTextBox" runat="server" />

                                </div>


                            </div>

                            <hr />


                            <small class="vehicleProfile"><strong>License Records:</strong></small>
                            <h5>
                                Quick License Code Guide</h5>
                            <ul class="list-inline">
                                <li>1 - NTV                  </li>
                                <li>2 - Pick Up              </li>
                                <li>3 - Cargo Van            </li>
                                <li>4 - Canter               </li>
                                <li>5 - Commercial Truck     </li>
                                <li>6 - Heavy License/KDL    </li>
                                <li>7 - Heavy Equipment    </li>
                            </ul>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <small>License Issue Date</small>
                                        <br />
                                        <asp:TextBox ID="LicenseIssueDateTextBox" TextMode="Date" CssClass="form-control" runat="server" Text='<%# Bind("LicenseIssueDate") %>' />
                                        <asp:RequiredFieldValidator ErrorMessage="License Issue Date is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="LicenseIssueDateTextBox" runat="server" />

                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <small>License Expiry Date</small>
                                        <br />
                                        <asp:TextBox ID="LicenseExpiryDateTextBox" TextMode="Date" CssClass="form-control" runat="server" Text='<%# Bind("LicenseExpiryDate") %>' />
                                        <asp:RequiredFieldValidator ErrorMessage="License Expiry Date is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="LicenseExpiryDateTextBox" runat="server" />


                                    </div>


                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <small>License Code:</small>
                                        <br />
                                        <asp:TextBox ID="OperatorLicenseCodeTextBox" CssClass="form-control" TextMode="Number" MaxLength="6" runat="server" Text='<%# Bind("OperatorLicenseCode") %>' />
                                        <asp:RequiredFieldValidator ErrorMessage="License Code is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="OperatorLicenseCodeTextBox" runat="server" />


                                    </div>


                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <small>Operator Status:</small>
                                        <br />
                                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-control" Checked='<%# Bind("OperatorStatus") %>' Enabled="true" />
                                    </div>


                                </div>

                            </div>

                            <hr />

                            <small class="vehicleProfile"><strong>Operator Contact Info</strong></small>
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <small>Work Location: </small>
                                        <br />
                                        <asp:DropDownList ID="DDLVehicleLocation" CssClass="form-control" runat="server" SelectedValue='<%# Bind("Location") %>'>
                                            <asp:ListItem Value="">- Select Location -</asp:ListItem>
                                            <asp:ListItem Value="Camp Arifjan">Camp Arifjan</asp:ListItem>
                                            <asp:ListItem Value="Camp Buehring">Camp Buehring</asp:ListItem>

                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="LocationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Location") %>' />--%>

                                        <asp:RequiredFieldValidator ErrorMessage="Location is required." CssClass="text-danger" Font-Bold="true" ControlToValidate="DDLVehicleLocation" runat="server" />

                                    </div>

                                </div>
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4"></div>


                            </div>



                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Operator" />


                        </div>




                    </div>

                </div>



            </div>
        </InsertItemTemplate>






    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" DeleteCommand="DELETE FROM [tblVehicleOperators] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblVehicleOperators] ([OperatorNum], [FullName], [LicenseIssueDate], [LicenseExpiryDate], [Section], [JobTitle], [Location], [OperatorStatus], [OperatorLicenseCode]) VALUES (@OperatorNum, @FullName, @LicenseIssueDate, @LicenseExpiryDate, @Section, @JobTitle, @Location, @OperatorStatus, @OperatorLicenseCode)" SelectCommand="SELECT * FROM [tblVehicleOperators] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [tblVehicleOperators] SET [OperatorNum] = @OperatorNum, [FullName] = @FullName, [LicenseIssueDate] = @LicenseIssueDate, [LicenseExpiryDate] = @LicenseExpiryDate, [Section] = @Section, [JobTitle] = @JobTitle, [Location] = @Location, [OperatorStatus] = @OperatorStatus, [OperatorLicenseCode] = @OperatorLicenseCode WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OperatorNum" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
            <asp:Parameter Name="LicenseExpiryDate" Type="DateTime" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="OperatorStatus" Type="Boolean" />
            <asp:Parameter Name="OperatorLicenseCode" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OperatorNum" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="LicenseIssueDate" Type="DateTime" />
            <asp:Parameter Name="LicenseExpiryDate" Type="DateTime" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="OperatorStatus" Type="Boolean" />
            <asp:Parameter Name="OperatorLicenseCode" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>













</asp:Content>
