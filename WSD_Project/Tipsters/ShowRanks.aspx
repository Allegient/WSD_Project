<%@ Page Title="Show Ranks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowRanks.aspx.cs" Inherits="WSD_Project.Tipsters.ShowRanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div runat="server" id="title">
        <h1>Please pick a round to view your rank</h1>
    </div>
    <div runat="server" id="noTips">
        <em>
            <asp:Label ID="Label1" runat="server" Style="font-size: 18px;" Text="You have no Tips in the system, please click on Make Tips first" ForeColor="Red"></asp:Label></em>
    </div>
    <div runat="server" id="roundSeletion">
        <asp:DropDownList ID="DropDownList1" runat="server" style="width: 48px; height: 29px;" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE ([username] = @username) ORDER BY roundID ASC">
            <SelectParameters>
                <asp:Parameter Name="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div runat="server" id="submissionButton">
                <asp:Button runat="server" OnClick="rankResult" CssClass="btn btn-default" Text="Submit" />
            </div>
            <br />
            <div runat="server" id="rankingTable" visible="false">
                <!-- Table for the rankings -->
                <table style="width: 50%; text-align: left; padding: 8px;">
                    <tr>
                        <th>Rank</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Error Points</th>
                    </tr>
                    <asp:Label ID="Rankings" runat="server"></asp:Label>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
