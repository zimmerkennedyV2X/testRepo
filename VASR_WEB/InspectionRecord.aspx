<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectionRecord.aspx.cs" Inherits="VASR_WEB.InspectionRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row">

        <div class="col-md-12">


            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%">

                        <ItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Vehicle Inspection Record</h3>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="text-right"><small>Overall Vehicle Condition:</small>
                                        <asp:Label ID="ConditionPassCheckBox" Font-Bold="true" runat="server" Text='<%# Convert.ToBoolean(Eval("ConditionPass")) ? "Serviceable": "Not Serviceable" %>' />
                                </div>
                                </h3> 
                            </div>




                            <div class="well well-sm">
                                <div class="row">
                                    <div class="col-md-3">
                                        <small>Admin #:</small><br />
                                        <asp:Label ID="AdminNumberLabel" runat="server" Text='<%# Bind("AdminNumber") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-3">
                                        <small>Plate #:</small><br />
                                        <asp:Label ID="PlateNumberLabel" runat="server" Text='<%# Bind("PlateNumber") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-3">
                                        <small>Vehicle Model:</small><br />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Model") %>' />
                                        <br />
                                    </div>
                                    <div class="col-md-3">
                                        <small>Vehicle Operator:</small><br />
                                        <asp:Label ID="FullNameLabel" runat="server" Text='<%# Bind("FullName") %>' />
                                        <br />
                                    </div>



                                </div>






                            </div>

                            <hr />

                            <div class="row">
                                <div class="col-md-3">
                                    <small>Vehicle returned/reported at CPC:</small><br />
                                    <asp:Label ID="ReturnTimeLabel" runat="server" Text='<%# Bind("ReturnTime") %>' />
                                    <br />


                                </div>
                                <div class="col-md-3">
                                    <small>Inspection Date:</small>
                                    <br />
                                    <asp:Label ID="InspectionDateCompletedLabel" runat="server" Text='<%# Bind("InspectionDateCompleted") %>' />
                                </div>
                                <div class="col-md-3">
                                    <small>Inspector:</small>
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DispatchInspector") %>' />
                                    <br />
                                </div>
                                <div class="col-md-3">
                                    <small>Ending Mileage:</small>
                                    <br />
                                    <asp:Label ID="EndMileageLabel" runat="server" Text='<%# Bind("EndMileage") %>' />km
                                    <br />
                                    <small>Ending Fuel Level:</small>
                                    <br />
                                    <asp:Label ID="EndFuelLevelLabel" runat="server" Text='<%# Bind("EndFuelLevel") %>' />
                                    <br />
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table table-striped table-hover w-auto ">
                                        <thead>
                                            <tr>

                                                <th style="width: 20%">Items Checked</th>
                                                <th style="width: 10%">Serviceable?</th>
                                                <th style="width: 60%">Comments</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>

                                                <td>Exterior Damage</td>
                                                <td>
                                                    <asp:Label ID="exteriorDamage" runat="server" Text='<%# Bind("ExteriorDamage") %>' />

                                                </td>
                                                <td>
                                                    <asp:Label ID="exteriorDamageComment" runat="server" Text='<%# Bind("ExteriorDamageComment") %>' />

                                                </td>
                                            </tr>

                                            <tr class="">

                                                <td>Exterior Clean</td>
                                                <td>
                                                    <asp:Label ID="exteriorClean" runat="server" Text='<%# Bind("ExteriorClean") %>' /></td>
                                                <td>
                                                    <asp:Label ID="exteriorCleanComment" runat="server" Text='<%# Bind("ExteriorCleanComment") %>' />
                                                </td>
                                            </tr>

                                            <tr class="">

                                                <td>Interior Clean</td>
                                                <td>
                                                    <asp:Label ID="interiorClean" runat="server" Text='<%# Bind("InteriorClean") %>' /></td>
                                                <td>
                                                    <asp:Label ID="interiorCleanComment" runat="server" Text='<%# Bind("InteriorCleanComment") %>' /></td>
                                            </tr>
                                            <tr class="">

                                                <td>Window Damage</td>
                                                <td>
                                                    <asp:Label ID="windowDamage" runat="server" Text='<%# Bind("WindowDamage") %>' /></td>
                                                <td>
                                                    <asp:Label ID="windowDamageComment" runat="server" Text='<%# Bind("WindowDamageComment") %>' /></td>
                                            </tr>
                                            <tr class="">

                                                <td>Light</td>
                                                <td>
                                                    <asp:Label ID="light" runat="server" Text='<%# Bind("Lights") %>' /></td>
                                                <td>
                                                    <asp:Label ID="lightComment" runat="server" Text='<%# Bind("LightsComment") %>' /></td>
                                            </tr>

                                            <tr class="">

                                                <td>Fluid Leaks</td>
                                                <td>
                                                    <asp:Label ID="fluidleaks" runat="server" Text='<%# Bind("FluidLeaks") %>' /></td>
                                                <td>
                                                    <asp:Label ID="fluidleaksComment" runat="server" Text='<%# Bind("FluidLeaksComment") %>' /></td>
                                            </tr>

                                            <tr class="">

                                                <td>Tire Inflation / Ware</td>
                                                <td>
                                                    <asp:Label ID="tire" runat="server" Text='<%# Bind("TireInflation") %>' /></td>
                                                <td>
                                                    <asp:Label ID="tireComment" runat="server" Text='<%# Bind("TireInflationComment") %>' /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <small>Inspector Comments/Notes:</small><br />
                                    <asp:Label ID="CommentsLabel" runat="server" Text='<%# Bind("Comments") %>' />
                                    <br />
                                    <br />

                                </div>
                                <div class="col-md-6">
                                    <br />
                                    <div class="panel panel-default">
                                        <div class="panel-heading ">
                                            <div class="row">
                                                <div class="col-sm-8">
                                                    <h5 class="">Attached Photos and Documents</h5>
                                                </div>
                                                <div class="col-sm-4 text-right">
                                                    <asp:Button Text="Incident Report" ID="Button1" OnClick="btnManageFiles_Click" CssClass="btn btn-info btn-xs" runat="server" />
                                                    <asp:Button Text="Manage Files" ID="ManageFiles" Visible="false" OnClick="ManageFiles_Click" CssClass="btn btn-info btn-xs" runat="server" />
                                                </div>

                                            </div>

                                        </div>
                                        <div class="panel-body">

                                            <asp:ListView ID="lvInspectionRecordsPhoto" runat="server">
                                                <ItemTemplate>
                                                    <div class="item <%# (Container.DataItemIndex == 0 ? "active" : "") %>">
                                                        <asp:Image ID="img_attachedImage" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Data")) %>' runat="server" />
                                                    </div>
                                                </ItemTemplate>

                                                <%--   <img src="img/2019-silverado-family-silverado.jpg" alt="Chania">--%>
                                                <LayoutTemplate>

                                                    <%--   <div class="form-inline text-center" runat="server" id="itemPlaceholderContainer">
                                                        <div id="itemPlaceholder" runat="server"></div>
                                                    </div>--%>


                                                    <div class="carousel slide" data-ride="carousel" id="itemPlaceholderContainer" runat="server">
                                                        <!-- Indicators -->
                                      <%--                          <ol class="carousel-indicators">
                                                            <li data-target="#itemplaceholdercontainer" data-slide-to="0" class="active"></li>
                                                            <li data-target="#itemplaceholdercontainer" data-slide-to="1"></li>
                                                            <li data-target="#itemplaceholdercontainer" data-slide-to="2"></li>
                                                        </ol>--%>

                                                        <!-- Wrapper for slides -->
                                                        <div class="carousel-inner" role="listbox">

                                                            <div  id="itemPlaceholder" runat="server"></div>

                                                            <%--    <div class="carousel-caption">
                                                                    <h3>Chevrolet Silverado</h3>

                                                                </div>--%>
                                                            

                                                        </div>

                                                        <!-- Left and right controls -->
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
                                                <EmptyDataTemplate>
                                                    <small>No attached photos found</small>
                                                </EmptyDataTemplate>




                                            </asp:ListView>

                                            <hr />
                                            <asp:ListView ID="lvInspectionRecordDocs" runat="server">
                                                <ItemTemplate>
                                                    <tr>

                                                        <td>
                                                            <asp:Label ID="lblFileName" Text='<%# Eval("FileName") %>' runat="server" /></td>
                                                        <td>
                                                            <asp:LinkButton Text="Download File" CommandArgument='<%# Eval("ID") %>' ID="downloadDoc" OnClick="downloadDoc_Click" runat="server" /></td>

                                                    </tr>




                                                </ItemTemplate>

                                                <LayoutTemplate>
                                                    <table id="itemPlaceHolderContainer" class="table table-hover" runat="server">
                                                        <tr runat="server">
                                                            <th runat="server">File Name</th>
                                                            <th runat="server">Download</th>
                                                        </tr>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>


                                                </LayoutTemplate>
                                                <EmptyDataTemplate>
                                                    <small>No attached documents found</small>
                                                </EmptyDataTemplate>
                                            </asp:ListView>


                                        </div>
                                    </div>






                                </div>


                            </div>






                        </ItemTemplate>
                    </asp:FormView>

                </div>
            </div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewInspections] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>





</asp:Content>
