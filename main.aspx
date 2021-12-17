<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BioData._default1" %>
<asp:Content ID="conBody" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        Home
    </div>
        <table align="center">
            <tr>
                <td><div class="card-header bg-secondary text-warning" role="alert">Station List</div></td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td><asp:TextBox ID="txtSearch" runat="server" size="47%"></asp:TextBox></td>
                            <td>
                                <asp:DropDownList ID="cmbSearchCriteria" runat="server">
                                    <asp:ListItem Value="1">Stream Name</asp:ListItem>
                                    <asp:ListItem Value="2">Stream Number</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td><button type="submit" class="btn btn-secondary btn-sm">Search</button></td>
                            <td><asp:Button ID="btnAddStation" runat="server" Text="Add Station" class="btn btn-secondary btn-sm" onclick="AddStation" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvStationList" 
                        runat="server" 
                        AllowPaging="True" 
                        OnPageIndexChanging="gvStationList_PageIndexChanging" 
                        AutoGenerateColumns="False" 
                        ShowHeaderWhenEmpty="True" 
                        BackColor="White" 
                        BorderColor="#999999" 
                        BorderStyle="Solid" 
                        BorderWidth="1px" 
                        CellPadding="3" 
                        ForeColor="Black" 
                        GridLines="Vertical" 
                        Width="100%">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:HyperLinkField DataTextField="strStreamName" HeaderText="Stream Name" NavigateUrl="stationinfo.aspx" DataNavigateUrlFields="intStationID" DataNavigateUrlFormatString="~\stationinfo.aspx?sid={0}" />
                            <asp:BoundField DataField="strStationNum" HeaderText="Station #" SortExpression="strStationNum" />
                            <asp:BoundField DataField="strLocation" HeaderText="Location" SortExpression="strLocation" />
                            <asp:BoundField DataField="intRiverMile" HeaderText="River Mile" SortExpression="intRiverMile" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fstrFullName" HeaderText="Entered By" ReadOnly="True" SortExpression="fstrFullName" />
                        </Columns>
                        <EmptyDataTemplate>No records available</EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
            </tr>
        </table>     
    
    </asp:Content>
