<%@ Page Title="Fixtures" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fixtures.aspx.cs" Inherits="WSD_Project.Tipsters.Fixtures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Please select the round of the fixture you would like to view</h1>
    <!-- Retreiving roudn IDs -->
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" Height="28px" Width="95px"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [fixtures]"></asp:SqlDataSource>
    <asp:Button runat="server" OnClick="roundChange" Text="Register" />
    <br />
    <div>
        <asp:Label ID="game1" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game2" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game3" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game4" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game5" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game6" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game7" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game8" runat="server"></asp:Label>
    </div>
    <div>
        <asp:Label ID="game9" runat="server"></asp:Label>
    </div>

</asp:Content>
