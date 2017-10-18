<%@ Page Title="My Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTips.aspx.cs" Inherits="WSD_Project.Tipsters.MyTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Please pick a round to view your tips</h1>
    <div runat="server" visible="false" id="noTips">
        <asp:Label ID="Label1" runat="server" Text="You have no Tips in the system, please click on Make Tips first" ForeColor="Red"></asp:Label>
    </div>
    <br />
    <div runat="server" visible="false" id="selectTip">
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:Parameter Name="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button runat="server" OnClick="roundResult" Text="Submit" />
    </div>
    <br />
    <div runat="server" visible="false" id="tipsTable">
        <table style="width: 50%; text-align: left; padding: 8px;">
            <tr>
                <th>Game Number</th>
                <th>Home Team</th>
                <th>Result</th>
                <th>Away Team</th>
                <th>Margin</th>
            </tr>
            <tr>
                <asp:Label ID="game1" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game2" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game3" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game4" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game5" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game6" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game7" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game8" runat="server"></asp:Label>
            </tr>
            <tr>
                <asp:Label ID="game9" runat="server"></asp:Label>
            </tr>
        </table>
    </div>




</asp:Content>

