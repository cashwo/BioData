<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="BioData.addUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            th{
                background-color: #000000;
                color: #ffffff;
                font-weight: bolder;
            }
        </style>
        <div class="alert alert-dark" role="alert">
            Add User
        </div>
        <table class="w-100 table-bordered">
            <thead>
                <tr>
                    <th>Last Name</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>User Name</th>
                    <th>User Role</th>
                    <th>Account Type</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUserLNameAdd" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserLNameAdd" ValidationGroup="AddUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserFNameAdd" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserFNameAdd" ValidationGroup="AddUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserMNameAdd" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserMNameAdd" ValidationGroup="AddUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserNameAdd" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserNameAdd" ValidationGroup="AddUsers" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbUserRoleAdd" runat="server" 
                            DataTextField="strUserRoleDesc" DataValueField="intUserRoleID">
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbUserRoleAdd" ValidationGroup="AddUsers" ErrorMessage="Required" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbAcctTypeAdd" runat="server" 
                            DataTextField="strAcctType" DataValueField="intAcctTypeID">
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbAcctTypeAdd" ValidationGroup="AddUsers" ErrorMessage="Required" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td valign="top"><asp:Button ID="btnAddUser" runat="server" Text="Add User" CausesValidation="true" ValidationGroup="AddUsers" class="btn btn-secondary btn-sm" OnClick="btnAddUser_Click" /></td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
