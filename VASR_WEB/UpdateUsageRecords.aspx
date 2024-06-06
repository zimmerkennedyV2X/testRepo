<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateUsageRecords.aspx.cs" Inherits="VASR_WEB.UpdateUsageRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <h4><strong>Update Vehicle Usage Records</strong> </h4>
    <h5>Note: Can only be modified by the Master Driver.     
    </h5>
    <br />



    <div class="row">
        <asp:UpdatePanel ID="dispatchPanel" runat="server" UpdateMode="Always">
            <ContentTemplate>

                <div class="col-md-4">
                    <div class="panel panel-default" id="panelDispatch_VehicleUnavailable" runat="server" visible="false">
                        <div class="panel-body">
                            <h4 class="text-danger">Vehicle Not Available</h4>
                            <small>Reasons</small>
                            <ul>
                                <li><small>Vehicle is currently dispatched.</small> </li>
                                <li><small>Vehicle is not registered on this system.</small> </li>
                                <li><small>Vehicle is not available for dispatch.</small> </li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel panel-default" id="panelDispatch_VehicleDetails" runat="server" visible="false">
                        <div class="panel-body">
                            <strong>Vehicle Details</strong>
                            <br />

                            <small>Admin Number:</small>
                            <p id="lblDispatch_AdminNumber" runat="server"></p>

                            <small>Plate Number:</small>
                            <p id="lblDispatch_PlateNumber" runat="server">A</p>

                            <small>Make/Model:</small>
                            <p id="lblDispatch_Model" runat="server"></p>

                            <small>Current Mileage(km)</small>
                            <p id="lblDispatch_CurrentMileage" runat="server"></p>

                            <small>Current Fuel Level</small>
                            <p id="lblDispatch_CurrentFuelLevel" runat="server"></p>


                        </div>
                    </div>


                </div>

                <div class="col-md-4">
                    <small>Enter Ending Mileage</small>
                    <input type="number" id="txtReturn_EndingMileage" maxlength="8" class="form-control" runat="server" placeholder="Enter Ending Mileage" />
                    <asp:RequiredFieldValidator ID="reqFieldValidateReturn_EndingMileage" CssClass="text-danger small" runat="server" ErrorMessage=" Enter your Vehicle's Ending Mileage" ControlToValidate="txtReturn_EndingMileage"
                        ValidationGroup="returnValidationGroup">

                    </asp:RequiredFieldValidator>

                    <div class="panel panel-default" id="returnPanel_EndingMileagePanel" runat="server" visible="true">
                        <div class="panel-body">
                            <small>Starting Mileage:</small>
                            <h4 id="lblstartMileage" class="text-bold" runat="server"></h4>
                        </div>
                    </div>





                </div>
                <div class="col-md-4">
                    <small>Fuel Level</small>
                    <select id="cmbReturn_FuelLevel" runat="server" class="form-control">
                        <option></option>
                        <option>Full Tank</option>
                        <option>3/4 Tank</option>
                        <option>Half Tank</option>
                        <option>Quarter Tank</option>
                        <option>Empty Tank</option>

                    </select>
                    <asp:RequiredFieldValidator ID="reqFieldValidateReturn_FuelLevel" CssClass="text-danger small" runat="server" ErrorMessage=" Enter Last Fuel Level" ControlToValidate="cmbReturn_FuelLevel"
                        ValidationGroup="returnValidationGroup">

                    </asp:RequiredFieldValidator>



                </div>


                </div>

            <div class="row">
                <div class="col-md-6">
                    <small>Enter On Post License</small>

                    <asp:TextBox ID="txtDispatch_OperatorId" MaxLength="14" class="form-control" runat="server" placeholder="Enter IMD Operator ID" AutoPostBack="false" OnTextChanged="txtDispatch_OperatorId_TextChanged" onkeyup="moveCursor(this,'btnDispatch_DispatchVehicle')" />


                    <asp:RequiredFieldValidator ID="reqFieldValidateDispatch_OperatorId" CssClass="text-danger small" runat="server" ErrorMessage=" Enter your ID" ControlToValidate="txtDispatch_OperatorId"
                        ValidationGroup="dispatchValdidationGroup">

                    </asp:RequiredFieldValidator>

                    <div class="panel panel-default" id="panelDispatch_OperatorUnavailable" runat="server" visible="false">
                        <div class="panel-body">


                            <h4 class="text-danger">Operator Invalid. </h4>
                            <small>Reasons</small>
                            <ul>
                                <li><small>License is expired</small> </li>
                                <li><small>Not authorized to drive the vehicle.</small> </li>
                                <li><small>Account has been disabled.</small> </li>
                            </ul>

                        </div>
                    </div>



                    <div class="panel panel-default" id="panelDispatch_OperatorDetails" runat="server" visible="false">
                        <div class="panel-body">
                            <strong>Operator Details</strong>
                            <br />

                            <small>Operator License Number:</small>
                            <p id="lblDispatch_OperatorNum" runat="server"></p>

                            <small>Operator Name:</small>
                            <p id="lblDispatch_OperatorName" runat="server"></p>

                            <small>License Issue Date:</small>
                            <p id="lblDispatch_IssueDate" runat="server"></p>

                            <small>License Expiry Date: </small>
                            <p id="lblDispatch_ExpiryDate" runat="server"></p>



                        </div>
                    </div>


                </div>


                <div class="col-md-6">

                    <button id="btnReturn_ReturnVehicle" validationgroup="returnValidationGroup" runat="server" onserverclick="btnReturn_ReturnVehicle_ServerClick" class="btn btn-info  btn-block">Update Usage Records</button>

                    <%--       <asp:Button runat="server" ID="btnDispatch_DispatchVehicle1" OnClick="btnDispatch_DispatchVehicle_Click" Text="Dispatch" />--%>

              
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>





    </div>



</asp:Content>
