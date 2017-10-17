<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WSD_Project.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new AFL account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required!" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" CssClass="text-danger" ErrorMessage="Email format must be name@domain.com" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="givenName" CssClass="col-md-2 control-label">Given Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="givenName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="givenName"
                    CssClass="text-danger" ErrorMessage="The given name field is required!" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" CssClass="text-danger" ControlToValidate="givenName" ErrorMessage="Can only consist of 20 English letters, hyphen and apostrophe!" ValidationExpression="^[a-zA-Z-']{1,20}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="familyName" CssClass="col-md-2 control-label">Family Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="familyName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="familyName"
                    CssClass="text-danger" ErrorMessage="The family name field is required!" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" CssClass="text-danger" ControlToValidate="familyName" ErrorMessage="Can only consist of 20 English letters, hyphen and apostrophe!" ValidationExpression="^[a-zA-Z-']{1,20}$" Display="Dynamic"></asp:RegularExpressionValidator> 
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DOB" CssClass="col-md-2 control-label">Date of Birth</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="DOB" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                    CssClass="text-danger" ErrorMessage="The date of birth field is required!" Display="Dynamic" />
                <asp:CompareValidator ID="CompareValidator1" CssClass="text-danger" runat="server" ControlToValidate="DOB" ErrorMessage="Date must be in the format: dd/mm/yyyy or dd-mm-yyyy!" Operator="DataTypeCheck" Type="Date" ValidateRequestMode="Inherit" Display="Dynamic"></asp:CompareValidator>
                  <asp:CompareValidator ID="CompareValidator2" CssClass="text-danger" runat="server" ControlToValidate="DOB" ErrorMessage="You must be at least 20 years old!" Operator="LessThanEqual" Type="Date" Display="Dynamic"></asp:CompareValidator> 
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" ErrorMessage="The address field is required!" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="suburb" CssClass="col-md-2 control-label">Suburb</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="suburb" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="suburb"
                    CssClass="text-danger" ErrorMessage="The suburb field is required!" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="state" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="state" runat="server" CssClass="input-group">
                    <asp:ListItem>Please Select</asp:ListItem>
                    <asp:ListItem>ACT</asp:ListItem>
                    <asp:ListItem>NSW</asp:ListItem>
                    <asp:ListItem>NT</asp:ListItem>
                    <asp:ListItem>QLD</asp:ListItem>
                    <asp:ListItem>SA</asp:ListItem>
                    <asp:ListItem>TAS</asp:ListItem>
                    <asp:ListItem>WA</asp:ListItem>
                    <asp:ListItem>VIC</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ErrorMessage="The state field is required!" ControlToValidate="state" InitialValue="Please Select"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="postcode" CssClass="col-md-2 control-label">Postcode</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="postcode" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="postcode"
                    CssClass="text-danger" ErrorMessage="The postcode field is required!" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ControlToValidate="postcode" ErrorMessage="Can only consist of 4 digit numbers!" ValidationExpression="^[0-9]{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="phone" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="phone" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="phone"
                    CssClass="text-danger" ErrorMessage="The phone field is required!" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger" ControlToValidate="phone" ErrorMessage="Must be in the format of 0ndddddddd, where ‘n’ can be ‘2-4’, ‘7-8’, and ‘d’ can be any digit. " ValidationExpression="^[0]{1}[2-4,7-8]{1}[0-9]{8}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
                <asp:Label ID="validationMessage" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
