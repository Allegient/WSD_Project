<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyTips.aspx.cs" Inherits="WSD_Project.Administrators.ModifyTips" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">


    <br />
    <br />
    <br />
    <br />
    <br />


    <asp:ListView ID="ListView1" runat="server" DataKeyNames="tipsetID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                </td>
                <td>
                    <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                </td>
                <td>
                    <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                </td>
                <td>
                    <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                </td>
                <td>
                    <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                </td>
                <td>
                    <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                </td>
                <td>
                    <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                </td>
                <td>
                    <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                </td>
                <td>
                    <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                </td>
                <td>
                    <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                </td>
                <td>
                    <asp:Label ID="tiptimeLabel" runat="server" Text='<%# Eval("tiptime") %>' />
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
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="roundIDTextBox" runat="server" Text='<%# Bind("roundID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game1TextBox" runat="server" Text='<%# Bind("game1") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game2TextBox" runat="server" Text='<%# Bind("game2") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game3TextBox" runat="server" Text='<%# Bind("game3") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game4TextBox" runat="server" Text='<%# Bind("game4") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game5TextBox" runat="server" Text='<%# Bind("game5") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game6TextBox" runat="server" Text='<%# Bind("game6") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game7TextBox" runat="server" Text='<%# Bind("game7") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game8TextBox" runat="server" Text='<%# Bind("game8") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game9TextBox" runat="server" Text='<%# Bind("game9") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tiptimeTextBox" runat="server" Text='<%# Bind("tiptime") %>' />
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
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="roundIDTextBox" runat="server" Text='<%# Bind("roundID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game1TextBox" runat="server" Text='<%# Bind("game1") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game2TextBox" runat="server" Text='<%# Bind("game2") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game3TextBox" runat="server" Text='<%# Bind("game3") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game4TextBox" runat="server" Text='<%# Bind("game4") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game5TextBox" runat="server" Text='<%# Bind("game5") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game6TextBox" runat="server" Text='<%# Bind("game6") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game7TextBox" runat="server" Text='<%# Bind("game7") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game8TextBox" runat="server" Text='<%# Bind("game8") %>' />
                </td>
                <td>
                    <asp:TextBox ID="game9TextBox" runat="server" Text='<%# Bind("game9") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tiptimeTextBox" runat="server" Text='<%# Bind("tiptime") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                </td>
                <td>
                    <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                </td>
                <td>
                    <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                </td>
                <td>
                    <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                </td>
                <td>
                    <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                </td>
                <td>
                    <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                </td>
                <td>
                    <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                </td>
                <td>
                    <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                </td>
                <td>
                    <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                </td>
                <td>
                    <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                </td>
                <td>
                    <asp:Label ID="tiptimeLabel" runat="server" Text='<%# Eval("tiptime") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">tipsetID</th>
                                <th runat="server">username</th>
                                <th runat="server">roundID</th>
                                <th runat="server">game1</th>
                                <th runat="server">game2</th>
                                <th runat="server">game3</th>
                                <th runat="server">game4</th>
                                <th runat="server">game5</th>
                                <th runat="server">game6</th>
                                <th runat="server">game7</th>
                                <th runat="server">game8</th>
                                <th runat="server">game9</th>
                                <th runat="server">tiptime</th>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                </td>
                <td>
                    <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                </td>
                <td>
                    <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                </td>
                <td>
                    <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                </td>
                <td>
                    <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                </td>
                <td>
                    <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                </td>
                <td>
                    <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                </td>
                <td>
                    <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                </td>
                <td>
                    <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                </td>
                <td>
                    <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                </td>
                <td>
                    <asp:Label ID="tiptimeLabel" runat="server" Text='<%# Eval("tiptime") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" DeleteCommand="DELETE FROM [tips] WHERE [tipsetID] = @tipsetID" InsertCommand="INSERT INTO [tips] ([username], [roundID], [game1], [game2], [game3], [game4], [game5], [game6], [game7], [game8], [game9], [tiptime]) VALUES (@username, @roundID, @game1, @game2, @game3, @game4, @game5, @game6, @game7, @game8, @game9, @tiptime)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [tips]" UpdateCommand="UPDATE [tips] SET [username] = @username, [roundID] = @roundID, [game1] = @game1, [game2] = @game2, [game3] = @game3, [game4] = @game4, [game5] = @game5, [game6] = @game6, [game7] = @game7, [game8] = @game8, [game9] = @game9, [tiptime] = @tiptime WHERE [tipsetID] = @tipsetID">
        <DeleteParameters>
            <asp:Parameter Name="tipsetID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="game1" Type="Int32" />
            <asp:Parameter Name="game2" Type="Int32" />
            <asp:Parameter Name="game3" Type="Int32" />
            <asp:Parameter Name="game4" Type="Int32" />
            <asp:Parameter Name="game5" Type="Int32" />
            <asp:Parameter Name="game6" Type="Int32" />
            <asp:Parameter Name="game7" Type="Int32" />
            <asp:Parameter Name="game8" Type="Int32" />
            <asp:Parameter Name="game9" Type="Int32" />
            <asp:Parameter Name="tiptime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="game1" Type="Int32" />
            <asp:Parameter Name="game2" Type="Int32" />
            <asp:Parameter Name="game3" Type="Int32" />
            <asp:Parameter Name="game4" Type="Int32" />
            <asp:Parameter Name="game5" Type="Int32" />
            <asp:Parameter Name="game6" Type="Int32" />
            <asp:Parameter Name="game7" Type="Int32" />
            <asp:Parameter Name="game8" Type="Int32" />
            <asp:Parameter Name="game9" Type="Int32" />
            <asp:Parameter Name="tiptime" Type="DateTime" />
            <asp:Parameter Name="tipsetID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>





</asp:Content>



