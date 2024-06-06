<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccidentReport.aspx.cs" Inherits="VASR_WEB.AccidentReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%">

                <ItemTemplate>
                    <div class="row">

                        <div class="col-md-6">
                            <h3>Dispatch Record </h3>
                        </div>
                        <div class="col-md-6">
                            <h3 class="text-right"><small>Inspection Assessment:</small>
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


                </ItemTemplate>


            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewInspections] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="DispatchID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>



    </div>

   

    <div class="row">

            <h3>Accident Report </h3>

        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
            
            <ItemTemplate>
                <small>Date:</small><br />
                <asp:Label ID="DateOfIncidentLabel" runat="server" Text='<%# Bind("DateOfIncident","{0:d}") %>' />
                <br />
                 <small>Time:</small><br />
                <asp:Label ID="TimeOfIncidentLabel" runat="server" Text='<%# Bind("TimeOfIncident") %>' />
                <br />
                 <hr />
                 <small>Operator:</small><br />
                <asp:Label ID="OperatorTypeLabel"  Font-Bold="true" runat="server" Text='<%# Bind("OperatorType") %>' />
                <br />
               <small>Location Of MVA:</small> 
                <br />
                <asp:Label ID="LocationOfIncidentLabel"  Font-Bold="true" runat="server" Text='<%# Bind("LocationOfIncident") %>' />
                <br />
               <small>Exact Location Of MVA:</small> 
                <br />
             
                <asp:Label ID="ExactLocationOfIncidentLabel"  Font-Bold="true" runat="server" Text='<%# Bind("ExactLocationOfIncident") %>' />
                <br />
                 <hr />
                <small>Incident Statement:</small> 
               
                <br />
                <asp:Label ID="IncidentStatementLabel"  Font-Bold="true" ForeColor="red" runat="server" Text='<%# Bind("IncidentStatement") %>' />
                <br />
              

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection2 %>" SelectCommand="SELECT * FROM [viewAccidentReport] WHERE ([DispatchID] = @DispatchID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="DispatchID" QueryStringField="DispatchID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>



</asp:Content>
