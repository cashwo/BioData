<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="BioData.admin" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        Application Administration
    </div>

    <div class="card w-75 mx-auto">
        <div class="card-header bg-secondary text-warning">
            <table class="w-100">
                <tr>
                    <td align="left">Add User</td>
                    <td align="right"><asp:Button ID="btnAddUser" runat="server" Text="Add User" class="btn btn-sm" OnClick="btnAddUser_Click" /></td>
                </tr>
            </table>
        </div>
        <div class="card-body">
            <asp:gridview id="gvUsers" runat="server" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                PageSize="10" 
                OnPageIndexChanging="gvUsers_PageIndexChanging"
                OnRowEditing="gvUsers_RowEditing" 
                OnRowCancelingEdit="gvUsers_RowCancelingEdit" 
                OnRowUpdating="gvUsers_RowUpdating" 
                OnRowDeleting="gvUsers_RowDeleting" 
                OnRowDataBound="gvUsers_RowDataBound" 
                OnRowCommand="gvUsers_RowCommand" 
                ShowFooter="false" 
                datakeynames="intUserID" 
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
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblULName" runat="server" Text='<%# Bind("strUserLName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUserLName" runat="server" Text='<%# Bind("strUserLName") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserLName" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblUFName" runat="server" Text='<%# Bind("strUserFName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUserFName" runat="server" Text='<%# Bind("strUserFName") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserFName" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Middle Name">
                        <ItemTemplate>
                            <asp:Label ID="lblUMName" runat="server" Text='<%# Bind("strUserMName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUserMName" runat="server" Text='<%# Bind("strUserMName") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserMName" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("strUserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("strUserName") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Role">
                        <ItemTemplate>
                            <asp:Label ID="lblUserRole" runat="server" Text='<%# Bind("strUserRoleDesc") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="cmbUserRole" runat="server" 
                                DataSourceID="sdsUserRoles" DataTextField="strUserRoleDesc" DataValueField="intUserRoleID" 
                                SelectedValue='<%# Bind("intUserRoleID") %>'>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbUserRole" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="sdsUserRoles" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BioData %>" 
                                SelectCommand="SELECT DISTINCT intUserRoleID, strUserRoleDesc FROM tblUserRoles">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Account Type">
                        <ItemTemplate>
                            <asp:Label ID="lblAcctType" runat="server" Text='<%# Bind("strAcctType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="cmbAcctType" runat="server" 
                                DataSourceID="sdsAcctTypes" DataTextField="strAcctType" DataValueField="intAcctTypeID" 
                                SelectedValue='<%# Bind("intAcctTypeID") %>'>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbAcctType" ValidationGroup="EditUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="sdsAcctTypes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BioData %>" 
                                SelectCommand="SELECT DISTINCT intAcctTypeID, strAcctType FROM tblAccountType">
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  ValidationGroup="EditMapServ"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbResetPWD" runat="server" CausesValidation="False" CommandName="ResetPWD" Text="Reset Password" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#000000" ForeColor="#ffffff" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:gridview>
        </div>
        <div class="card-header bg-secondary text-warning">
            <table class="w-100">
                <tr>
                    <td>Reset Assessment Data</td>
                </tr>
            </table>
        </div>
        <div class="card-body">
            <asp:Button ID="btnRestAsmnts" runat="server" Text="Reset Stations and Assessments" class="btn btn-sm" OnClick="btnRestAsmnts_Click" />
        </div>
    </div>
    <style>
        .AddError{
            color: red;
        }
    </style>
</asp:Content>
