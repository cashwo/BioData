<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chngpwd.aspx.cs" Inherits="BioData.chngpwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EDS: BioData</title>
    <script src="jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="css/BioData.css" rel="stylesheet" />
    <link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="bootstrap-4.3.1-dist/js/bootstrap.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">EDS: BioData</a>
    </nav>
    <br /><br />
    <form id="frmEDSLogin" runat="server">
        <div class="card bg-light mb-3 mx-auto" style="max-width: 26rem;">
            <div class="card-body">
                <h5 class="alert bg-dark text-warning">Change Password</h5>
                <p class="card-text">
                    <table align="center" border="0">
                        <tr>
                            <td>Old Password</td>
                            <td><asp:TextBox ID="txtOldPWD" TextMode="Password" runat="server" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>New Password</td>
                            <td><asp:TextBox ID="txtNewPWD1" TextMode="Password" runat="server" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Retype New Password</td>
                            <td><asp:TextBox ID="txtNewPWD2" TextMode="Password" runat="server" required></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="lblErrMsg" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><asp:Button ID="btnChangePWD" runat="server" Text="Submit" class="btn btn-dark btn-sm" OnClick="btnChangePWD_Click" /></td>
                        </tr>
                    </table>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
