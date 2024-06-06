<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleInspections.aspx.cs" Inherits="VASR_WEB.VehicleInspections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h3>Vehicle Inspections</h3>

            <div class="col-md-4">
                <h4><strong>Dispatch Record to be Inspected</strong> </h4>
                <div class="panel panel-default">
                    <div class="panel-body">

                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%">

                            <ItemTemplate>
                                <table class="table table-hover">
                                    <tr>
                                        <td>Admin Number:</td>
                                        <td>
                                            <asp:Label ID="AdminNumberLabel" runat="server" Text='<%# Bind("AdminNumber") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td>PlateNumber:</td>
                                        <td>
                                            <asp:Label ID="PlateNumberLabel" runat="server" Text='<%# Bind("PlateNumber") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Make/Model:</td>
                                        <td>
                                            <asp:Label ID="ModelLabel" runat="server" Text='<%# Bind("Model") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Operator:</td>
                                        <td>
                                            <asp:Label ID="FullNameLabel" runat="server" Text='<%# Bind("FullName") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Issue Date:</td>
                                        <td>
                                            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Issue Time: </td>
                                        <td>
                                            <asp:Label ID="StartTimeLabel" runat="server" Text='<%# Bind("StartTime") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Receive Date:</td>
                                        <td>
                                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Bind("EndDate") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Receive Time: </td>
                                        <td>
                                            <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Bind("EndTime") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Beginning Mileage:</td>
                                        <td>
                                            <asp:Label ID="StartMileageLabel" runat="server" Text='<%# Bind("StartMileage") %>' />
                                        </td>
                                    </tr>
                                </table>


                                <div class="well">


                                    <small>Ending Mileage:</small>
                                    <asp:Label ID="EndMileageLabel" runat="server" Font-Bold="true" Text='<%# Bind("EndMileage") %>' />
                                    km

                                    <br />
                                    <small>Ending Fuel Level:</small>
                                    <asp:Label ID="EndFuelLevelLabel" runat="server" Font-Bold="true" Text='<%# Bind("EndFuelLevel") %>' />

                                </div>


                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' Visible="false" />



                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewDispatchProfile] WHERE ([ID] = @ID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>





                    </div>
                </div>
            </div>



            <div class="col-md-8">

                <h4><strong>IMD Vehicle Inspection Checklist</strong> </h4>

                <div class="row">
                    <div class="col-md-6">
                        <p>Exterior Damage found?</p>

                        <asp:RadioButtonList ID="rbl_exteriorDamage" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_ExteriorDamageComment" CssClass="form-control" />



                    </div>
                    <hr />
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <p>Exterior Clean?</p>

                        <asp:RadioButtonList ID="rbl_exteriorClean" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_ExteriorCleanComment" CssClass="form-control" Width="100%" />



                    </div>
                    <hr />
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <p>Interior Clean?</p>

                        <asp:RadioButtonList ID="rbl_interiorClean" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_interiorCleanComment" CssClass="form-control" />



                    </div>
                    <hr />
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <p>Window Damage found?</p>

                        <asp:RadioButtonList ID="rbl_windowDamage" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_windowDamageComment" CssClass="form-control" />



                    </div>
                    <hr />
                </div>



                <div class="row">
                    <div class="col-md-6">
                        <p>Lights Serviceable?</p>

                        <asp:RadioButtonList ID="rbl_lightsServiceable" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_lightsServiceableComment" CssClass="form-control" />



                    </div>
                    <hr />
                </div>



                <div class="row">
                    <div class="col-md-6">
                        <p>Fluid Leaks Serviceable?</p>

                        <asp:RadioButtonList ID="rbl_fluidLeaksServiceable" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_fluidLeaksServiceableComment" CssClass="form-control" />



                    </div>
                    <hr />
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <p>Tire Inflation/Wear Serviceable?</p>

                        <asp:RadioButtonList ID="rbl_tireInflationServiceable" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                            <asp:ListItem Text="No" Value="n" />
                        </asp:RadioButtonList>

                    </div>
                    <div class="col-md-6">
                        <small>Comments</small>
                        <asp:TextBox runat="server" ID="txt_tireInflationServiceableComments" CssClass="form-control" />



                    </div>
                    <hr />
                </div>



                <div class="row">

                    <div class="col-md-6">
                        <p>Ending Mileage entered correctly?</p>
                        <asp:UpdatePanel ID="endMileageUpdatePanel" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList2" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                                    <asp:ListItem Text="No" Value="n" />
                                </asp:RadioButtonList>
                                <section runat="server" id="editMileage" visible="false">

                                    <small>Ending Mileage:</small>
                                    <asp:TextBox ID="txtappendEndMileage" runat="server" CssClass="form-control"></asp:TextBox>


                                </section>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                    <div class="col-md-6">
                    </div>

                    <hr />




                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p>Ending Fuel Level entered correctly?</p>

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:RadioButtonList ID="RadioButtonList3" AutoPostBack="true" RepeatDirection="Horizontal" CssClass="rbl" runat="server" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Value="y" style="margin-right: 35px;" />
                                    <asp:ListItem Text="No" Value="n" />
                                </asp:RadioButtonList>
                                <section runat="server" id="editFuelevel" visible="false">

                                    <small>Ending Fuel Level:</small>
                                    <select id="appendEndFuelLevel" runat="server" class="form-control">
                                        <option></option>
                                        <option>Full Tank</option>
                                        <option>3/4 Tank</option>
                                        <option>Half Tank</option>
                                        <option>Quarter Tank</option>
                                        <option>Empty Tank</option>

                                    </select>

                                </section>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-6">
                    </div>
                    <hr />
                </div>





                <div class="row">

                    <div class="col-md-12">

                        <hr />
                        <asp:UpdatePanel ID="vehicleCondition" runat="server">
                            <ContentTemplate>
                                <p>Overall Vehicle Condition Serviceable?</p>

                                <asp:RadioButtonList ID="rbl_OverallVehicleCondition" RepeatDirection="Horizontal" AutoPostBack="true" CssClass="rbl" runat="server" OnSelectedIndexChanged="rbl_OverallVehicleCondition_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Value="yes" style="margin-right: 35px;" />
                                    <asp:ListItem Text="No" Value="no" />
                                </asp:RadioButtonList>


                                <section id="mvaSection" runat="server" visible="false">
                                    <p>MVA occured?</p>
                                    <asp:RadioButtonList ID="rbl_Accident" RepeatDirection="Horizontal" AutoPostBack="true" Visible="true" CssClass="rbl" runat="server" OnSelectedIndexChanged="rbl_Accident_SelectedIndexChanged">
                                        <asp:ListItem Text="Yes" Value="yes" style="margin-right: 35px;" />
                                        <asp:ListItem Text="No" Value="no" />
                                    </asp:RadioButtonList>


                                </section>




                                <small>Notes: </small>
                                <asp:TextBox ID="txtInspectionNotes" runat="server" CssClass="form-control" placeholder="Enter Vehicle Issue" TextMode="MultiLine" Rows="2"></asp:TextBox>

                                <br />
                                <asp:Button ID="btnAddDailyInspectionPhotos" runat="server" Text="Complete Inspection and Provide documentation of Damage " CssClass="btn btn-danger" Visible="false" OnClick="btnAddDailyInspectionPhotos_Click" />


                                <br />
                                <asp:Button ID="btnCompleteInspection" runat="server" CssClass="btn btn-success " Text="Complete Inspection" OnClick="btnCompleteInspection_Click" Visible="false" />

                            </ContentTemplate>
                        </asp:UpdatePanel>



                    </div>

                </div>










            </div>

        </div>
    </div>

</asp:Content>
