<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleInspectionsUploads.aspx.cs" Inherits="VASR_WEB.VehicleInspectionsUploads" %>

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
        <h3>Accident Report</h3>
        <hr />
        <small>Date Of Accident:</small>

        <asp:TextBox CssClass="form-control" TextMode="Date" id="dateOfAccident" runat="server" />
                <small>Time Of Accident:</small>
        <asp:TextBox CssClass="form-control" id="timeOfAccident" runat="server" />
                <small>Location Of Accident:</small>
        <asp:DropDownList CssClass="form-control" id="ddl_Location" runat="server">
            <asp:ListItem Text="AJ" Value="AJ"></asp:ListItem>
            <asp:ListItem Text="BU" Value="BU" ></asp:ListItem>
            <asp:ListItem Text="Off Base" Value="Off Base" ></asp:ListItem>
        </asp:DropDownList>
                <small>Exact Location of Accident: </small>
        <asp:TextBox CssClass="form-control" id="exactLocation" TextMode="MultiLine"  runat="server" />
     
        
                <small>Operator Type:</small>
        <asp:DropDownList CssClass="form-control" ID="ddl_operatorType" runat="server">
            <asp:ListItem Text="Vectrus"></asp:ListItem>
            <asp:ListItem Text="Subcontractor"></asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
                <small>Accident Statement:</small>
        <asp:TextBox CssClass="form-control" ID="accidentStatement" runat="server" TextMode="MultiLine"></asp:TextBox>
        


    </div>


     <div class="row">
         <h3>Attach Documents for Inspection</h3>
        <div class="col-md-4">
            <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
    
            <div class="text-right" style="padding-top: 2px;">
                <asp:Button ID="btnUploadDocuments" runat="server" Text="Upload File" CssClass="btn btn-success btn-sm text-right" OnClick="btnUploadDocuments_Click" />

            </div>

        </div>
        <div class="col-md-8">




            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="false" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" />
                    <asp:BoundField DataField="FileType" HeaderText="File Type" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" runat="server" CssClass="btn btn-info btn-xs" Text="Download File" OnClick="lnkDownload_Click"
                                CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>

    </div>


    <div class="row" >
        <div class="text-right">
      
            <asp:LinkButton ID="btnSaveAccident" runat="server" CssClass="btn btn-info" OnClick="btnSaveAccident_Click">Save Accident Report and Proceed to Inspection Records</asp:LinkButton>
        </div>
    </div>





</asp:Content>
