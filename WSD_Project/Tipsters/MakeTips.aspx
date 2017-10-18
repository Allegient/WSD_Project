<%@ Page Title="Make Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="WSD_Project.Tipsters.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server" OnActivate="View1_Activate">
            <br />
            <asp:Label ID="Label1" runat="server" Text="You have already tipped every single round!" ForeColor="Red"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [fixtures] EXCEPT SELECT [roundID] FROM [tips] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:Parameter Name="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="button1" runat="server" CommandName="NextView" Text="Make Tip" />
        </asp:View>
        <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" DeleteCommand="DELETE FROM [tips] WHERE [tipsetID] = @tipsetID" InsertCommand="INSERT INTO [tips] ([game3], [game5], [game2], [game4], [game9], [game1], [game8], [game6], [game7], [roundID]) VALUES (@game3, @game5, @game2, @game4, @game9, @game1, @game8, @game6, @game7, @roundID)" SelectCommand="SELECT [tipsetID], [game3], [game5], [game2], [game4], [game9], [game1], [game8], [game6], [game7], [roundID] FROM [tips] WHERE (([roundID] = @roundID) AND ([username] = @username))" UpdateCommand="UPDATE [tips] SET [game3] = @game3, [game5] = @game5, [game2] = @game2, [game4] = @game4, [game9] = @game9, [game1] = @game1, [game8] = @game8, [game6] = @game6, [game7] = @game7, [roundID] = @roundID WHERE [tipsetID] = @tipsetID">
                <DeleteParameters>
                    <asp:Parameter Name="tipsetID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="game3" Type="Int32" />
                    <asp:Parameter Name="game5" Type="Int32" />
                    <asp:Parameter Name="game2" Type="Int32" />
                    <asp:Parameter Name="game4" Type="Int32" />
                    <asp:Parameter Name="game9" Type="Int32" />
                    <asp:Parameter Name="game1" Type="Int32" />
                    <asp:Parameter Name="game8" Type="Int32" />
                    <asp:Parameter Name="game6" Type="Int32" />
                    <asp:Parameter Name="game7" Type="Int32" />
                    <asp:Parameter Name="roundID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="username" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="game3" Type="Int32" />
                    <asp:Parameter Name="game5" Type="Int32" />
                    <asp:Parameter Name="game2" Type="Int32" />
                    <asp:Parameter Name="game4" Type="Int32" />
                    <asp:Parameter Name="game9" Type="Int32" />
                    <asp:Parameter Name="game1" Type="Int32" />
                    <asp:Parameter Name="game8" Type="Int32" />
                    <asp:Parameter Name="game6" Type="Int32" />
                    <asp:Parameter Name="game7" Type="Int32" />
                    <asp:Parameter Name="roundID" Type="Int32" />
                    <asp:Parameter Name="tipsetID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="tipsetID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="tipsetIDLabel1" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game3TextBox" runat="server" Text='<%# Bind("game3") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game5TextBox" runat="server" Text='<%# Bind("game5") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game2TextBox" runat="server" Text='<%# Bind("game2") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game4TextBox" runat="server" Text='<%# Bind("game4") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game9TextBox" runat="server" Text='<%# Bind("game9") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game1TextBox" runat="server" Text='<%# Bind("game1") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game8TextBox" runat="server" Text='<%# Bind("game8") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game6TextBox" runat="server" Text='<%# Bind("game6") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game7TextBox" runat="server" Text='<%# Bind("game7") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roundIDTextBox" runat="server" Text='<%# Bind("roundID") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="game3TextBox" runat="server" Text='<%# Bind("game3") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game5TextBox" runat="server" Text='<%# Bind("game5") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game2TextBox" runat="server" Text='<%# Bind("game2") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game4TextBox" runat="server" Text='<%# Bind("game4") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game9TextBox" runat="server" Text='<%# Bind("game9") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game1TextBox" runat="server" Text='<%# Bind("game1") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game8TextBox" runat="server" Text='<%# Bind("game8") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game6TextBox" runat="server" Text='<%# Bind("game6") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="game7TextBox" runat="server" Text='<%# Bind("game7") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roundIDTextBox" runat="server" Text='<%# Bind("roundID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">tipsetID</th>
                                        <th runat="server">game3</th>
                                        <th runat="server">game5</th>
                                        <th runat="server">game2</th>
                                        <th runat="server">game4</th>
                                        <th runat="server">game9</th>
                                        <th runat="server">game1</th>
                                        <th runat="server">game8</th>
                                        <th runat="server">game6</th>
                                        <th runat="server">game7</th>
                                        <th runat="server">roundID</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
