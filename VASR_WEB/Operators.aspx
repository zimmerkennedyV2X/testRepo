<%@ Page Title="IMD Operators" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operators.aspx.cs" Inherits="VASR_WEB.Operators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">


        <ul class="nav nav-tabs">
            <li class="active"><a href="#all" data-toggle="tab" aria-expanded="true">All</a></li>
            <li class=""><a href="#30days" data-toggle="tab" aria-expanded="false">Expires in 30 Days or Less</a></li>
            <li class=""><a href="#expired" data-toggle="tab" aria-expanded="false">Expired</a></li>



        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="all">

                <br />

                <div class="row">
                    <div class="col-md-6">
                        <small>Search Operator by</small>
                        <div class="form-inline">




                            <asp:DropDownList CssClass="form-control" ID="operatorSearchSelector" runat="server" Width="220">
                                <asp:ListItem Text="Name" />
                                <asp:ListItem Text="License Number" />
                             
                                <asp:ListItem Text="Section" />
                                <asp:ListItem Text="Location" />

                            </asp:DropDownList>


                            <asp:TextBox ID="txtfilterOperators" runat="server" CssClass="form-control" OnTextChanged="txtfilterOperators_TextChanged" AutoPostBack="true"></asp:TextBox>

                            <asp:Button ID="btnSearchVehicle" runat="server" Text="Search Operator" CssClass="btn btn-primary" />


                        </div>




                    </div>


                    <div class="col-md-6">

                       <div>
                            <h5>What can you drive? <br /> Quick License Code Guide</h5>
                            <ul class="list-inline">
                                <li>1 - NTV                  </li>
                                <li>2 - Pick Up              </li>
                                <li>3 - Cargo Van            </li>
                                <li>4 - Canter               </li>
                                <li>5 - Commercial Truck     </li>
                                <li>6 - Heavy License/KDL    </li>
                                <li>7 - Heavy Equipment    </li>
                            </ul>

                        </div>
                        <div class="form-inline text-right">

                            <asp:Button ID="btnAddOperator" runat="server" CssClass="btn btn-success btn-sm " Text="+Add New Operator" OnClick="btnAddOperator_Click" />
                            <asp:Button ID="btnExportOperators" OnClick="btnExportOperators_Click" runat="server" CssClass="btn btn-default btn-sm " Text="Export Operator List to Excel" />

                        </div>
                     
                    </div>
                </div>

                <br />








                <asp:ListView ID="ListViewOperatorsAll" runat="server" DataKeyNames="ID">

                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <a href="/OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;Open</a>
                            </td>
                            <td>
                                <a href="#" > <%# Eval("OperatorNum") %></a>
                            </td>


                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>

                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Section") %>' />
                            </td>


                            <td>
                                <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                            </td>


                            <td>
                                <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("OperatorLicenseCode") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Location") %>' />
                            </td>
                            <td class="<%# GetStatusColor(Eval("OperatorStatus"))  %>">
                                <span class="glyphicon glyphicon-flag"></span>
                                <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToBoolean(Eval("OperatorStatus")) ? "Authorized" : "Inactive" %>' />
                            </td>




                            <td>
                                <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" style="width: 100%">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                        <tr runat="server" style="color: #004f71">
                                            <th runat="server">Open Profile</th>
                                            <th runat="server">License No.</th>
                                            <th runat="server">Operator Name</th>
                                            <th runat="server">Section</th>
                                            <th runat="server">Issue Date</th>
                                            <th runat="server">Expiry Date</th>

                                            <th>License Code
                                            </th>
                                            <th runat="server">Location</th>
                                            <th runat="server">Status</th>

                                            <th runat="server" visible="false">ID</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>

                </asp:ListView>

                <div class="tab-pane fade" id="30days">

                    <asp:ListView ID="ListView30Expire" runat="server">

                        <AlternatingItemTemplate>
                            <tr style="">
                                <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs">Edit</a> </td>
                                <td>
                                    <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                </td>
                                <td>
                                    <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs">Edit</a> </td>
                                <td>
                                    <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                </td>
                                <td>
                                    <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                            <tr runat="server" style="color: #8a1538">
                                                <th runat="server">Action</th>
                                                <th runat="server">License No. </th>
                                                <th runat="server">Operator Name</th>

                                                <th runat="server">Issue Date</th>
                                                <th runat="server">Expiry Date</th>
                                                <th runat="server">Location</th>
                                                <th runat="server" visible="false">ID</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>




                    </asp:ListView>

                </div>

                <div class="tab-pane fade" id="expired">
                    <asp:ListView ID="ListViewExpired" runat="server">


                        <AlternatingItemTemplate>
                            <tr style="">
                                <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs">Edit</a> </td>
                                <td>
                                    <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                </td>
                                <td>
                                    <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <td><a href="OperatorProfile.aspx?ID=<%# Eval("ID") %>" class="btn btn-info btn-xs">Edit</a> </td>
                                <td>
                                    <asp:Label ID="OperatorNumLabel" runat="server" Text='<%# Eval("OperatorNum") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseIssueDateLabel" runat="server" Text='<%# Eval("LicenseIssueDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LicenseExpiryDateLabel" runat="server" Text='<%# Eval("LicenseExpiryDate","{0:d}") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                                </td>
                                <td>
                                    <asp:Label Visible="false" ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" class="table table-striped table-hover " runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Action</th>
                                                <th runat="server">License No. </th>
                                                <th runat="server">Operator Name</th>
                                                <th runat="server">Issue Date</th>
                                                <th runat="server">Expiry Date</th>
                                                <th runat="server">Location</th>
                                                <th runat="server" visible="false">ID</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>












                    </asp:ListView>
                </div>



            </div>









        </div>
    </div>



</asp:Content>
