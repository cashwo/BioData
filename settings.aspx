<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="BioData.settings" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        Application Settings
    </div>
    <div class="card w-75 mx-auto">
        <div class="card-header bg-secondary text-warning">External GIS Map Services</div>
        <div class="card-body">
            <asp:gridview id="gvGISMapServices" runat="server" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                PageSize="10" 
                OnPageIndexChanging="gvGISMapServices_PageIndexChanging"
                OnRowEditing="gvGISMapServices_RowEditing" 
                OnRowCancelingEdit="gvGISMapServices_RowCancelingEdit" 
                OnRowUpdating="gvGISMapServices_RowUpdating" 
                OnRowDataBound="gvGISMapServices_RowDataBound" 
                OnRowDeleting="gvGISMapServices_RowDeleting" 
                datakeynames="intGMS" 
                BackColor="White" 
                BorderColor="#999999" 
                BorderStyle="Solid" 
                BorderWidth="1px" 
                CellPadding="3" 
                ForeColor="Black" 
                GridLines="Vertical" 
                width="100%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="Map Service Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGMSName" runat="server" Text='<%# Bind("strGMSName") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGMSName" ValidationGroup="EditMapServ" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGMSName" runat="server" Text='<%# Bind("strGMSName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Map Service URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGMSURL" runat="server" Text='<%# Bind("strGMSURL") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGMSURL" ValidationGroup="EditMapServ" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGMSURL" runat="server" Text='<%# Bind("strGMSURL") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="630px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  ValidationGroup="EditMapServ"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#ffffff" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:gridview>
            <br />
            <style>
                th{
                    background-color: #000000;
                    color: #ffffff;
                    font-weight: bolder;
                }
            </style>
            <div class="alert alert-dark" role="alert">
                Add External GIS Map Services
            </div>
            <table class="w-100 table-bordered">
                <thead>
                    <tr>
                        <th>Map Service Name</th>
                        <th>Map Service URL</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtGMSNameAdd" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGMSNameAdd" ValidationGroup="AddGMS" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGMSURLAdd" runat="server" size="125"></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGMSURLAdd" ValidationGroup="AddGMS" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td valign="top"><asp:Button ID="btnAddGMS" runat="server" Text="Add" CausesValidation="true" ValidationGroup="AddGMS" class="btn btn-secondary btn-sm" OnClick="btnAddGMS_Click" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
