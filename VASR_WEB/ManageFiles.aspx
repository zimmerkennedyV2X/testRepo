<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageFiles.aspx.cs" Inherits="VASR_WEB.ManageFiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
</asp:Content>
