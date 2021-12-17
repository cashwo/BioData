<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="stationadd.aspx.cs" Inherits="BioData.stationadd" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
<br />
<div class="card w-50 mx-auto">
    <div class="card-header bg-secondary text-white">
        Add Station
    </div>
    <div class="card-body">
        <table align="center">
            <tr>
                <td class="text-muted">Stream Name</td>
                <td class="text-muted">Station Number</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtStreamName" runat="server" required></asp:TextBox></td>
                <td><asp:TextBox ID="txtStationNum" runat="server" required></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="text-muted">Location</td>
                <td class="text-muted">River Mile</td>
                <td class="text-muted">Stream Class</td>
            </tr>
            <tr>
                <td valign="top"><asp:TextBox ID="txtLocation" runat="server" width="250" required></asp:TextBox></td>
                <td valign="top">
                    <asp:TextBox ID="txtRiverMile" runat="server" required></asp:TextBox><br />
                    <asp:CompareValidator ID="cvRiverMile" runat="server" 
                        ControlToValidate="txtRiverMile" 
                        Type="Double"
                        ForeColor="Red" 
                        Operator="DataTypeCheck" 
                        ErrorMessage="Value must be numeric" />
                </td>
                <td valign="top"><asp:TextBox ID="txtStreamClass" runat="server" width="250" required></asp:TextBox></td>
            </tr>
            <tr>
                <td class="text-muted">Latitude</td>
                <td class="text-muted">Longitude</td>
                <td class="text-muted">&nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:TextBox ID="txtLatitude" runat="server" Text='<%# Bind("fltLatitude") %>' required></asp:TextBox><br />
                    <asp:CompareValidator ID="cvLatitude" runat="server" 
                        ControlToValidate="txtLatitude" 
                        Type="Double"
                        ForeColor="Red" 
                        Operator="DataTypeCheck" 
                        ErrorMessage="Value must be numeric" />
                </td>
                <td valign="top">
                    <asp:TextBox ID="txtLongitude" runat="server" required></asp:TextBox><br />
                    <asp:CompareValidator ID="cvLongitude" runat="server" 
                        ControlToValidate="txtLongitude" 
                        Type="Double"
                        ForeColor="Red" 
                        Operator="DataTypeCheck" 
                        ErrorMessage="Value must be numeric" />
                </td>
                <td><asp:Label ID="lblViewOnMap" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="text-muted">River Basin</td>
                <td class="text-muted">Agency</td>
                <td class="text-muted">&nbsp</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtRiverBasin" runat="server" width="250" required></asp:TextBox></td>
                <td colspan="2"><asp:TextBox ID="txtAgency" runat="server" size="62" required></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnAddStation" runat="server" Text="Add Station" class="btn btn-secondary btn-sm" OnClick="btnAddStation_Click" />
                </td>
            </tr>
            </table>
        </div>     
   </div>
</asp:Content>
