<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTips.aspx.cs" Inherits="WSD_Project.Tipsters.MyTips" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Please pick a round to view your tips</h1>
        <asp:Label ID="Label1" runat="server" Text="You have no Tips in the system, please click on Make Tips first" Visible="False" ForeColor="Red"></asp:Label>
    <br />
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:Parameter Name="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <!-- what you should do is find a way to check if the sql returns any results. if result is null then unhide the statement saying 
you have no tips and hide the drop box instead. if there are results vice versa (so set visible = true c#) -->
    </asp:Content>

