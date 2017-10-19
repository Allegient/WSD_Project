<%@ Page Title="Make Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="WSD_Project.Tipsters.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server" OnActivate="View1_Activate">
                    <br />
                    <div runat="server" id="title">
                        <h1>Please select the round you would like to tip</h1>
                    </div>
                    <em>
                        <asp:Label ID="Label1" runat="server" Style="font-size: 18px;" Text="You have already tipped every single round!" ForeColor="Red"></asp:Label></em>
                    <asp:DropDownList ID="DropDownList1" runat="server" style="width: 48px; height: 29px;" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFL_Tipping %>" SelectCommand="SELECT [roundID] FROM [fixtures] EXCEPT SELECT [roundID] FROM [tips] WHERE ([username] = @username)">
                        <SelectParameters>
                            <asp:Parameter Name="username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button ID="button1" runat="server" CommandName="NextView" Text="Make Tip" CssClass="btn btn-default" />
                </asp:View>
                <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                    <br />
                    <br />

                    <!-- Table for user to input their tips along with drop down box, textbox and validation -->
                    <table style="width: 50%; text-align: left; padding: 8px;">
                        <tr>
                            <th>Game Number</th>
                            <th>Home Team</th>
                            <th>Away Team</th>
                            <th>Match Result</th>
                            <th>Predicted Margin</th>
                        </tr>
                        <tr>
                            <asp:Label ID="game1" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game1Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game1Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game1Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game1Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ControlToValidate="game1Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game2" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game2Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game2Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game2Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game2Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger" ControlToValidate="game2Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game3" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game3Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game3Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game3Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game3Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="text-danger" ControlToValidate="game3Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game4" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game4Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game4Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game4Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game4Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger" ControlToValidate="game4Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game5" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game5Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game5Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game5Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game5Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" CssClass="text-danger" ControlToValidate="game5Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game6" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game6Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game6Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game6Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game6Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" CssClass="text-danger" ControlToValidate="game6Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game7" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game7Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game7Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game7Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game7Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" CssClass="text-danger" ControlToValidate="game7Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game8" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game8Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game8Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game8Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game8Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" CssClass="text-danger" ControlToValidate="game8Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="game9" runat="server"></asp:Label>
                            <td>
                                <asp:DropDownList ID="game9Drop" runat="server">
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Draw</asp:ListItem>
                                    <asp:ListItem>Lose</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="text-danger" ErrorMessage="<br />Please select the result!" ControlToValidate="game9Drop" InitialValue="Please Select" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="game9Margin" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" CssClass="text-danger" ErrorMessage="<br /> Predicted Margin is required!" ControlToValidate="game9Margin" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" CssClass="text-danger" ControlToValidate="game9Margin" ErrorMessage="<br / >Must be a number between 0-200!" ValidationExpression="^[0-9]$|^[0-9][0-9]$|^[0-1][0-9][0-9]$|^200$" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="Button2" runat="server" Text="Select Round" CommandName="SwitchViewByID" CommandArgument="View1" CssClass="btn btn-default" CausesValidation="False" />
                    <asp:Button runat="server" OnClick="validationCheck" Text="Submit" CssClass="btn btn-default" />
                    <br />
                    <em>
                        <asp:Label ID="validationMessage" Style="font-size: 18px;" runat="server"></asp:Label></em>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
