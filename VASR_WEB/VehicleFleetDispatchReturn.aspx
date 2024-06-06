<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleFleetDispatchReturn.aspx.cs" Inherits="VASR_WEB.VehicleFleetDispatchReturn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IMD/SSD VASR</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery.autotab.min.js"></script>
    <script>
        $(document).ready(function () {
            $("div.imdvasr-tab-menu>div.list-group>a").click(function (e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.imdvasr-tab>div.imdvasr-tab-content").removeClass("active");
                $("div.imdvasr-tab>div.imdvasr-tab-content").eq(index).addClass("active");
            });
        });

        $('.answer').autotab({ maxlength: 1 });
    </script>

</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>


        <div class="modal fade" id="confirmCheckout" aria-hidden="true" style="height: 400px;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">&nbsp;Vehicle Checked Out</h4>

                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-12 text-center">
                                <hr />
                                <h2 class="text-success">Vehicle Succesfully checked out!</h2>
                                <p class="lead text-success">&nbsp;Drive Safe!</p>

                                <hr />

                                <button id="Button3" runat="server" onserverclick="refreshDispatch_ServerClick" visible="true" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-refresh"></span>Refresh - Return Vehicle</button>

                            </div>


                        </div>


                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade" id="confirmReturn" aria-hidden="true" style="height: 400px;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">&nbsp;Vehicle has been returned</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-12 text-center">
                                <hr />
                                <h2 class="text-success">Vehicle Returned</h2>
                                <p class="lead text-success">&nbsp;You have successfully returned the Vehicle. Enjoy the rest of the day!</p>

                                <hr />


                            </div>

                        </div>

                        <button id="Button2" runat="server" onserverclick="refreshDispatch_ServerClick" visible="true" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-refresh"></span>Refresh - Return Vehicle</button>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <h2>IMD/SSD Vehicle Assets System Of Records  <small>v1.0</small></h2>
                </div>
                <div class="col-md-2">
                    <button id="Button1" runat="server" onserverclick="refreshDispatch_ServerClick" visible="true" class="btn btn-success">Refresh</button>
                </div>




            </div>

            <div class="row">
                <div class="col-lg-11 col-md-11 col-sm-8 col-xs-9 imdvasr-tab-container">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 imdvasr-tab-menu">
                        <div class="list-group">

                            <a href="#" class="list-group-item active text-center">
                                <h4 class="glyphicon glyphicon-export"></h4>
                                <br />
                                Check Out Vehicle
                            </a>
                            <a href="#" class="list-group-item text-center">
                                <h4 class="glyphicon glyphicon-import"></h4>
                                <br />
                                Return Vehicle
                            </a>

                            <%--       <a href="#" class="list-group-item  text-center">
                                <h4 class="glyphicon glyphicon-home"></h4>
                                <br />
                                Dispatched Vehicles
                            </a>--%>

                            <a href="#" class="list-group-item  text-center" style="background: #53565a">
                                <img src="img/vectrus-v2(1).png" height="85" />
                            </a>

                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 imdvasr-tab">

                        <!-- train section -->
                        <div class="imdvasr-tab-content active">

                            <%--     1  - Dispatch      --%>


                            <div class="row">
                                <asp:UpdatePanel ID="updatePanelDispatch" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <div class="col-md-4">
                                            <small><strong>STEP 1 </strong>- Scan Vehicle Code</small>

                                            <asp:TextBox ID="txtDispatch_VehicleID" MaxLength="14" class="form-control" AutoPostBack="true" runat="server" placeholder="Scan Vehicle ID Key" OnTextChanged="txtDispatch_VehicleID_ServerChange" onkeyup="moveCursor(this,'txtDispatch_OperatorId')" />


                                            <asp:RequiredFieldValidator ID="reqFieldValidateDispatch_VehicleId" runat="server" CssClass="text-danger small" ErrorMessage="Scan your Vehicle Key" ControlToValidate="txtDispatch_VehicleID"
                                                ValidationGroup="dispatchValdidationGroup">

                                            </asp:RequiredFieldValidator>


                                            <div class="panel panel-default" id="panelDispatch_VehicleUnavailable" runat="server" visible="false">
                                                <div class="panel-body">
                                                    <h4 class="text-danger">Vehicle Not Available</h4>
                                                    <small>Possible Reasons</small>
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

                                                    <small>Model:</small>
                                                    <p id="lblDispatch_Model" runat="server"></p>

                                                    <small>Current Mileage(km)</small>
                                                    <p id="lblDispatch_CurrentMileage" runat="server"></p>

                                                    <small>Current Fuel Level</small>
                                                    <p id="lblDispatch_CurrentFuelLevel" runat="server"></p>


                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-md-4">
                                            <small><strong>STEP 2 </strong>- Scan On Post License</small>

                                            <asp:TextBox ID="txtDispatch_OperatorId" MaxLength="14" class="form-control" runat="server" placeholder="Scan Operator ID" AutoPostBack="true" OnTextChanged="txtDispatch_OperatorId_TextChanged" onkeyup="moveCursor(this,'btnDispatch_DispatchVehicle')" />


                                            <asp:RequiredFieldValidator ID="reqFieldValidateDispatch_OperatorId" CssClass="text-danger small" runat="server" ErrorMessage=" Scan your ID" ControlToValidate="txtDispatch_OperatorId"
                                                ValidationGroup="dispatchValdidationGroup">

                                            </asp:RequiredFieldValidator>

                                            <div class="panel panel-default" id="panelDispatch_OperatorUnavailable" runat="server" visible="false">
                                                <div class="panel-body">


                                                    <h4 class="text-danger">Operator Invalid. </h4>
                                                    <small>Possible Reasons</small>
                                                    <ul>
                                                        <li><small>Your License is expired</small> </li>
                                                        <li><small>You are not authorized to drive the vehicle.</small> </li>
                                                        <li><small>You account has been disabled.</small> </li>
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

                                    </ContentTemplate>

                                </asp:UpdatePanel>

                                <div class="col-md-4">
                                    <input id="txtDispatch_Hidden" runat="server" style="display: none;" visible="TRUE" />
                                    <small><strong>STEP 3 </strong>- Dispatch Vehicle</small>
                                    <button id="btnDispatch_DispatchVehicle" validationgroup="dispatchValdidationGroup" runat="server" onserverclick="btnDispatch_DispatchVehicle_ServerClick" class="btn btn-success btn-block">Dispatch Vehicle</button>

                                    <%--       <asp:Button runat="server" ID="btnDispatch_DispatchVehicle1" OnClick="btnDispatch_DispatchVehicle_Click" Text="Dispatch" />--%>

                                    <h3 id="dispatchStatus" class="text-success" runat="server"></h3>
                                    <button id="refreshDispatch" runat="server" onserverclick="refreshDispatch_ServerClick" visible="false" class="btn btn-info btn-xs">Refresh - New Check Out</button>

                                </div>


                                <script type="text/javascript"> function moveCursor(fromTextBox, toTextBox) {
                                        // Get the count of characters in fromTextBox
                                        var length = fromTextBox.value.length;
                                        // Get the value of maxLength attribute from the fromTextBox
                                        var maxLength = fromTextBox.getAttribute("maxLength");
                                        if (length == maxLength) {
                                            // If the number of charactes typed in the fromText is
                                            // equal to the maxLength attribute then set focus on
                                            // the next textbox
                                            document.getElementById(toTextBox).focus();
                                        }
                                    }</script>

                            </div>







                        </div>


                        <div class="imdvasr-tab-content">

                            <%--2 - Return--%>

                            <asp:UpdatePanel ID="dispatchPanel" runat="server">
                                <ContentTemplate>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <small><strong>STEP 1 </strong>- Scan Vehicle Code</small>
                                            <asp:TextBox type="text" ID="txtReturn_VehicleID" MaxLength="14" class="form-control" runat="server" placeholder="Scan Vehicle ID Key" AutoPostBack="true" OnTextChanged="txtReturn_VehicleID_TextChanged" onkeyup="moveCursor(this,'txtReturn_EndingMileage')" />
                                            <asp:RequiredFieldValidator ID="reqFieldValidateReturn_VehicleId" runat="server" CssClass="text-danger small" ErrorMessage="Scan your Vehicle Key" ControlToValidate="txtReturn_VehicleID"
                                                ValidationGroup="returnValidationGroup">

                                            </asp:RequiredFieldValidator>




                                        </div>
                                        <div class="col-md-4">
                                            <small><strong>STEP 2 </strong>- Enter Ending Mileage</small>
                                            <input type="number" id="txtReturn_EndingMileage" maxlength="8" class="form-control" runat="server" placeholder="Enter Ending Mileage" />
                                            <asp:RequiredFieldValidator ID="reqFieldValidateReturn_EndingMileage" CssClass="text-danger small" runat="server" ErrorMessage=" Enter your Vehicle's Ending Mileage" ControlToValidate="txtReturn_EndingMileage"
                                                ValidationGroup="returnValidationGroup">

                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator runat="server" ID="cmpNumbers" CssClass="text-danger small" ControlToValidate="txtReturn_EndingMileage" ControlToCompare="txtStartMileageReturn" Operator="GreaterThanEqual" Type="Integer"
                                                ErrorMessage="The ending mileage lesser than the starting mileage.  " />
                                            <br />

                                            <div class="panel panel-default" id="returnPanel_EndingMileagePanel" visible="true">
                                                <div class="panel-body">
                                                    <small>You started with this</small>
                                                    <small>Mileage:</small>
                                                    <asp:TextBox ID="txtStartMileageReturn" Enabled="false" CssClass="form-control" Font-Size="Large" Font-Bold="true" runat="server"></asp:TextBox>

                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-md-4">
                                            <small><strong>STEP 3 </strong>- Fuel Level</small>
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
                                        <div class="col-md-12">

                                            <div class="panel panel-default" id="panelReturn_NoDispatchRecords" runat="server" visible="false">
                                                <div class="panel-body">
                                                    <h3 class="text-danger">Vehicle Dispatch Record not Found.</h3>

                                                </div>
                                            </div>


                                            <div class="panel panel-default" id="panelReturn_DispatchRecords" runat="server" visible="false">
                                                <div class="panel-body">
                                                    <strong>Vehicle Dispatch Record</strong>
                                                    <br />

                                                    <small>Check out Time: </small>
                                                    <p id="lblReturn_CheckoutTime" runat="server"></p>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <p></p>
                                                            <small>Admin Number:</small>
                                                            <p id="lblReturn_AdminNumber" runat="server"></p>

                                                            <small>Plate Number</small>
                                                            <p id="lblReturn_PlateNumber" runat="server"></p>
                                                            <small>Model:</small>
                                                            <p id="lblReturn_Model" runat="server"></p>

                                                            <small>Starting Mileage(km)</small>
                                                            <p id="lblReturn_StartMileage" runat="server"></p>


                                                            <small>Starting Fuel(km)</small>
                                                            <p id="lblReturn_StartingFuel" runat="server"></p>





                                                        </div>
                                                        <div class="col-md-6">
                                                            <small>Operator License Number:</small>
                                                            <p id="lblReturn_OperatorLicense" runat="server">A</p>

                                                            <small>Operator Number</small>
                                                            <p id="lblReturn_OperatorNumber" runat="server"></p>


                                                        </div>

                                                    </div>



                                                </div>
                                            </div>

                                        </div>









                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="row">

                                <div class="col-md-12">
                                    <small><strong>STEP 4 </strong>- Return Vehicle</small>
                                    <button id="btnReturn_ReturnVehicle" validationgroup="returnValidationGroup" runat="server" onserverclick="btnReturn_ReturnVehicle_ServerClick" class="btn btn-info  btn-block">Return Vehicle</button>

                                    <h2 id="returnStatus" runat="server"></h2>
                                    <button id="refreshReturn" runat="server" onserverclick="refreshDispatch_ServerClick" visible="false" class="btn btn-info btn-xs">Refresh - Return Vehicle</button>

                                </div>

                            </div>






                        </div>


                        <div class="imdvasr-tab-content">

                            <div class="row">
                                <div class="col-md-6">
                                    <small><strong>Project Name:</strong></small>
                                    <h5>IMD VASR</h5>
                                    <small><strong>Project Description:</strong></small>
                                    <h5>Develop a system that would facilitate vehicle operators in efficiently logging their vehicle usage records, and to provide management better oversight in maintaining the fleet of company vehicles.
                                    </h5>


                                    <h5><strong>Management: </strong></h5>
                                    <h5>Edgar Williams, IMD Director  
                                    </h5>
                                    <h5>Peter Williams, ASB Manager

                                    </h5>
                                    <h5>Consywalo Manning-Thomas, SSB Manager 
                                    </h5>

                                    <h5>Trina Gardner, TBRO Supervisor
                                    </h5>

                                </div>

                                <div class="col-md-6">
                                    <small><strong>Project Team:</strong></small>


                                    <h5>Cynthia Cadena, CPC Lead</h5>
                                    <h5>Luz Irene Cortes, Account Administrator</h5>

                                    <h5>Todd Sessions, Account Administrator</h5>
                                    <h5>Jackson Johney, Admin Assistant </h5>
                                    <h5>Edgardo Cortes, Systems Analyst</h5>
                                    <h5>Wilcris Cortes, Software Developer </h5>





                                </div>




                            </div>


                        </div>

                    </div>
                </div>

            </div>
            <div class="row">
                <hr />
                <small>&copy; <%: DateTime.Now.Year %> - IMD VASR , A proud product of K-BOSSS: Information Management Directorate 
                </small>
            </div>
        </div>


    </form>



</body>
</html>
