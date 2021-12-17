<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BioData._default2" %>

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
        <div class="card bg-light mb-3 mx-auto" style="max-width: 18rem;">
            <div class="card-body">
                <h5 class="alert bg-dark text-warning">Log In</h5>
                <p class="card-text">
                    <table align="center" border="0">
                    <tr>
	                    <td><asp:TextBox ID="txtUID" runat="server" placeholder="User Name" class="form-control" required></asp:TextBox></td>
                    </tr>
                    <tr>
	                    <td><asp:TextBox ID="txtPWD" runat="server" placeholder="Password" class="form-control" required TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
	                    <td align="center" style="padding: 5px;"><asp:Label ID="lblErrMsg" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
	                    <td align="center"><asp:Button ID="btnLogin" runat="server" Text="Log In" class="btn btn-dark btn-sm" OnClick="btnLogin_Click" /></td>
                    </tr>
                    </table>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
