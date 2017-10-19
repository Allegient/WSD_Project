<%@ Page Title="My Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTips.aspx.cs" Inherits="WSD_Project.Tipsters.MyTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div runat="server" id="title">
        <h1>Please pick a round to view your tips</h1>
    </div>
    <div runat="server" visible="false" id="noTips">
        <em>
            <asp:Label ID="Label1" runat="server" Style="font-size: 18px;" Text="You have no Tips in the system, please click on Make Tips first" ForeColor="Red"></asp:Label></em>
    </div>
    <div runat="server" visible="false" id="selectTip">
        <asp:DropDownList ID="DropDownList2" runat="server" Style="width: 48px; height: 29px;" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" Height="27px" Width="50px">
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
            <div runat="server" id="submitButton">
                <asp:Button ID="submit" runat="server" OnClick="roundResult" CssClass="btn btn-default" Text="Submit" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

