<%@ Page Title="Statistics" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WSD_Project.Administrators.Statistics" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">

    <!-- NOTE FOR CHRIS: Add titles to chart, fix up the 2D and 3D (I have given my code in the aspx.cs page) 
        switch with chart pattern everything else looks good -->



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT roundID AS RoundID, COUNT(*) AS NumberOfTips FROM tips GROUP BY roundID"></asp:SqlDataSource>
   <br />

   <br />
    <asp:UpdatePanel ID="Up1" runat="server" updatemode="Conditional">
        <ContentTemplate>
            <p>
                Select a chart type:</p>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            Select 2D or 3D chart:<br />
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem Value="2D">2D Chart</asp:ListItem>
                <asp:ListItem Value="3D">3D Chart</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <Titles>
                    <asp:Title Font="Arial, 11pt, style=Bold" Text="The Number of Tip Sets for each round" TextStyle="Default"></asp:Title>
                </Titles>
                <series>
                    <asp:Series Name="Series1" XValueMember="RoundID" YValueMembers="NumberOfTips">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Round ID">
                        </AxisX>
                        <AxisY Title="Number of Tips">
                        </AxisY>
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    <asp:UpdatePanel ID="Up2" runat="server" updatemode="Conditional">


        <ContentTemplate>
            Select a chart type:<br />
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            Select 2D or 3D charts:<br />
            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                <asp:ListItem Value="2D">2D Chart</asp:ListItem>
                <asp:ListItem Value="3D">3D Chart</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                <Titles>
                    <asp:Title Font="Arial, 11pt, style=Bold" Text="Number of Tips sets Submitted Each Week Day" TextStyle="Default"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series2" XValueMember="weekday" YValueMembers="NumberOfTips">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea2">
                        <AxisX Title="Day of the week">
                        </AxisX>
                        <AxisY Title="Number of Tips">
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT DATENAME(Weekday, tiptime) AS 'weekday', COUNT(*) AS 'NumberOfTips' FROM tips GROUP BY DATENAME(Weekday, tiptime) ORDER BY CASE datename(weekday , tiptime) WHEN 'Monday' THEN 1 WHEN 'Tuesday' THEN 2 WHEN 'Wednesday' THEN 3 WHEN 'Thursday' THEN 4 WHEN 'Friday' THEN 5 END"></asp:SqlDataSource>
    <br />
            
    <br />
    
    <br />
    <br />




</asp:Content>
