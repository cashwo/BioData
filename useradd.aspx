<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="useradd.aspx.cs" Inherits="BioData.useradd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        Add User
    </div>
    <table class="w-75 table-bordered mx-auto">
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
                <td valign="top">
                    <asp:TextBox ID="txtUserLNameAdd" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvUserLNameAdd" ControlToValidate="txtUserLNameAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:TextBox ID="txtUserFNameAdd" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvUserFNameAdd" ControlToValidate="txtUserFNameAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:TextBox ID="txtUserMNameAdd" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvUserMNameAdd" ControlToValidate="txtUserMNameAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:TextBox ID="txtUserNameAdd" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvUserNameAdd" ControlToValidate="txtUserNameAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:DropDownList ID="cmbUserRoleAdd" runat="server" 
                        DataTextField="strUserRoleDesc" DataValueField="intUserRoleID">
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvUserRoleAdd" ControlToValidate="cmbUserRoleAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:DropDownList ID="cmbAcctTypeAdd" runat="server"  
                        DataTextField="strAcctType" DataValueField="">
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfvAcctTypeAdd" ControlToValidate="cmbAcctTypeAdd" ForeColor="Red" runat="server" ErrorMessage="Required" />
                </td>
                <td valign="top">
                    <asp:Button ID="btnAddUser" runat="server" Text="Add User" class="btn btn-secondary btn-sm" OnClick="btnAddUser_Click" />
                </td>
            </tr>
        </tbody>
    </table>

    <script>
        function ValAddUser() {
            var ddlUserRoleAdd = document.getElementById("cphContent_cmbUserRoleAdd");
            var ddlUserRoleAddSelVal = ddlUserRoleAdd.options[ddlUserRoleAdd.selectedIndex].value;

            var ddlAcctTypeAdd = document.getElementById("cphContent_cmbAcctTypeAdd");
            var ddlAcctTypeAddSelVal = ddlAcctTypeAdd.options[ddlAcctTypeAdd.selectedIndex].value;


            if (document.getElementById("txtUserLNameAdd").value == "") {
                document.getElementById("spUserLNameAdd").innerHTML = "Required";
            }
            else if (document.getElementById("txtUserFNameAdd").value == "") {
                document.getElementById("spUserFNameAdd").innerHTML = "Required";
            }
            else if (document.getElementById("txtUserMNameAdd").value == "") {
                document.getElementById("spUserMNameAdd").innerHTML = "Required";
            }
            else if (document.getElementById("txtUserNameAdd").value == "") {
                document.getElementById("spUserNameAdd").innerHTML = "Required";
            }
            else if (ddlUserRoleAddSelVal == "0") {
                document.getElementById("spUserRoleAdd").innerHTML = "Required";
            }
            else if (ddlAcctTypeAddSelVal == "0") {
                document.getElementById("spAcctTypeAdd").innerHTML = "Required";
            }
            else {
                document.getElementById("spUserLNameAdd").innerHTML = "";
                document.getElementById("spUserFNameAdd").innerHTML = "";
                document.getElementById("spUserMNameAdd").innerHTML = "";
                document.getElementById("spUserNameAdd").innerHTML = "";
                document.getElementById("spUserRoleAdd").innerHTML = "";
                document.getElementById("spAcctTypeAdd").innerHTML = "";

                document.getElementById("cphContent_hidAddUser").value = 1;

                alert("ADD USER");

                document.frmAddUser.submit();
            }
        }
    </script>
</asp:Content>
