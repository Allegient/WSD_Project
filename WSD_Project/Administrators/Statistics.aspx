<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WSD_Project.Administrators.Statistics" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT roundID AS RoundID, COUNT(*) AS NumberOfTips FROM tips WHERE (roundID = 1) OR (roundID = 2) OR (roundID = 3) OR (roundID = 4) OR (roundID = 5) OR (roundID = 6) OR (roundID = 7) OR (roundID = 8) OR (roundID = 9) OR (roundID = 10) OR (roundID = 11) OR (roundID = 12) OR (roundID = 13) OR (roundID = 14) OR (roundID = 15) OR (roundID = 16) OR (roundID = 17) OR (roundID = 18) OR (roundID = 19) OR (roundID = 20) GROUP BY roundID"></asp:SqlDataSource>
   <br />

   <p>Select a chart type:</p> <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            
    <br />
    
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
        <series>
            <asp:Series Name="Series1" XValueMember="RoundID" YValueMembers="NumberOfTips">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Round ID"> </AxisX>
                <AxisY Title="Number of Tips"> </AxisY>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <br />
    <br />




</asp:Content>