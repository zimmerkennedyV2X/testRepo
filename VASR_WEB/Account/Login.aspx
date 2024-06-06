<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VASR_WEB.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="row">
        <div class="col-md-9">
            <div class="jumbotron">

                <p class="lead"><b>IMD/SSD Vehicle Assets System of Records</b> </p>
                <div class="row">

                    <div class="col-md-6">
                        <small><strong>Project Name:</strong></small>
                        <h5>IMD/SSD VASR</h5>
                        <small><strong>Project Description:</strong></small>
                        <h5>This system facilitates vehicle operators in efficiently logging their vehicle usage records. The system also provides IMD management comprehensive oversight in maintaining the fleet of company vehicles.
                        </h5>


                        <h5><strong>Management: </strong></h5>
                        <h5>John Kalafice, IMD Director  
                        </h5>
                        <h5>Christopher Adams, ASD Manager
                        </h5>
                        <h5>Consywalo Manning-Thomas, SSD Manager 
                        </h5>
                        <h5>Trina Gardner, TBRO Supervisor
                        </h5>

                    </div>

                    <div class="col-md-6">
                        <small><strong>Project Team:</strong></small>



                        <h5>Todd Sessions, Account Administrator</h5>
                        <h5>Luz Irene Cortes, Account Administrator</h5>
                        <h5>Consywalo Manning-Thomas, SSD Manager 
                        </h5>
                        <h5>Trina Gardner, TBRO Supervisor
                        </h5>
                               <h5>Cynthia Cadena, CPC Lead
                        </h5>
                        <h5>Jackson Johney, Software Developer </h5>
                        <h5>Edgardo Cortes, Systems Analyst</h5>
                        <h5>Wilcris Cortes, Software Developer </h5>






                    </div>


                </div>

            </div>

        </div>
        <div class="col-md-3">
            <section id="loginForm">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Sign In </strong></h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-horizontal">

                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-1 control-label"></asp:Label>
                                <div class="col-md-10">
                                    <label for="Email">Username or Email</label>

                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="The email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-1 control-label"></asp:Label>
                                <div class="col-md-10">
                                    <label for="Password">Password</label>
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <div class="checkbox">
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-8 col-md-10">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </section>
        </div>
    </div>
</asp:Content>
