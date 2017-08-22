<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WSD_Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div runat="server" id="anonymousUser" Visible="false">
    <%-- Anonymous user links go here! --%>
    <h2>Welcome!</h2>   
        <p>Welcome to our Fantastic AFL Tipping! To make a tip please register or log in! </p>

    </div>

    <div runat="server" id="loggedInTipsters" Visible="false">
    <%-- Logged In Tipster links go here! --%>
        <h2>Welcome!</h2>   
        <p>Welcome to our Fantastic AFL Tipping! You are able to place a tip for games in each of the 20 rounds! </p>
        <p>To make a tip please head to "Make Tips" link above!</p>

    </div>

    <div runat="server" id="loggedInAdmin" Visible="false">
    <%-- Logged in Admin links go here! --%>
        <h2>Welcome ADMIN!</h2>   
        <p>You are able to modify tips and look at statistical charts!</p>

    </div>


    
    
   

</asp:Content>
