<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTips.aspx.cs" Inherits="WSD_Project.Tipsters.MyTips" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />


<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="You have no Tips in the system, please click on Make Tips first"></asp:Label>
    </asp:View>
    
    
    <asp:View ID="View2" runat="server">
        <asp:Label ID="Label2" runat="server" Text="Pick a Round to view your tips"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_TippingConnectionString %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE ([username] = @username)">
            <SelectParameters>
                <asp:Parameter Name="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:View>
    <asp:View ID="View3" runat="server">


    </asp:View>
    </asp:MultiView>














    </asp:Content>