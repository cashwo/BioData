<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="stationinfo.aspx.cs" Inherits="BioData.stationinfo" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <link href="-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    <div class="alert alert-dark" role="alert">
        Station Information
    </div>
    <div class="card w-75 mx-auto">
        <div class="card-header bg-secondary text-warning">
            <asp:Label ID="lblStationNameNum" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="card-body">
            <asp:FormView ID="fvStationInfo" 
                runat="server" 
                DataKeyNames="intStationID" 
                OnModeChanging="fvStationInfo_ModeChanging" 
                OnItemUpdating="fvStationInfo_ItemUpdating" 
                OnItemDeleting="fvStationInfo_OnItemDeleting" 
                BackColor="White" 
                BorderColor="#999999" 
                BorderStyle="Solid" 
                BorderWidth="1px" 
                CellPadding="3" 
                ForeColor="Black" 
                GridLines="Vertical" 
                Width="100%">
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table class="w-100">
                    <tr>
                        <td class="text-muted">Location</td>
                        <td class="text-muted">River Mile</td>
                        <td class="text-muted">Stream Class</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="txtLocationView" runat="server" Text='<%# Bind("strLocation") %>' width="250" ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td><asp:TextBox ID="txtRiverMileView" runat="server" Text='<%# Bind("intRiverMile") %>' ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td><asp:TextBox ID="txtStreamClassView" runat="server" Text='<%# Bind("strStreamClass") %>' width="250" ReadOnly="true" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="text-muted">Latitude</td>
                        <td class="text-muted">Longitude</td>
                        <td class="text-muted">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="txtLatitudeView" runat="server" Text='<%# Bind("fltLatitude") %>' ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td><asp:TextBox ID="txtLongitudeView" runat="server" Text='<%# Bind("fltLongitude") %>' ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td><asp:Label ID="lblViewOnMap" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="text-muted">River Basin</td>
                        <td class="text-muted">Agency</td>
                        <td class="text-muted">&nbsp</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="txtRiverBasinView" runat="server" Text='<%# Bind("strRiverBasin") %>' ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td><asp:TextBox ID="txtAgencyView" runat="server" Text='<%# Bind("strAgency") %>' ReadOnly="true" Enabled="false"></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" class="btn btn-secondary bg-dark btn-sm" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" class="btn btn-secondary bg-dark  btn-sm" OnClientClick="return confirm('Are you sure you want to delete this station and all of the associated assessments and historic data?');" />
                        </td>
                    </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table class="w-100">
                    <tr>
                        <td class="text-muted">Location</td>
                        <td class="text-muted">River Mile</td>
                        <td class="text-muted">Stream Class</td>
                    </tr>
                    <tr>
                        <td valign="top"><asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("strLocation") %>' width="250" required></asp:TextBox></td>
                        <td valign="top">
                            <asp:TextBox ID="txtRiverMile" runat="server" Text='<%# Bind("intRiverMile") %>' required></asp:TextBox><br />
                            <asp:CompareValidator ID="cvRiverMile" runat="server" 
                                ControlToValidate="txtRiverMile" 
                                Type="Double"
                                ForeColor="Red" 
                                Operator="DataTypeCheck" 
                                ErrorMessage="Value must be numeric" />
                        </td>
                        <td valign="top"><asp:TextBox ID="txtStreamClass" runat="server" Text='<%# Bind("strStreamClass") %>' width="250" required></asp:TextBox></td>
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
                            <asp:TextBox ID="txtLongitude" runat="server" Text='<%# Bind("fltLongitude") %>' required></asp:TextBox><br />
                            <asp:CompareValidator ID="cvLongitude" runat="server" 
                                ControlToValidate="txtLongitude" 
                                Type="Double"
                                ForeColor="Red" 
                                Operator="DataTypeCheck" 
                                ErrorMessage="Value must be numeric" />
                        </td>
                        <td valign="top"><asp:Label ID="lblViewOnMap" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="text-muted">River Basin</td>
                        <td class="text-muted">Agency</td>
                        <td class="text-muted">&nbsp</td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="txtRiverBasin" runat="server" Text='<%# Bind("strRiverBasin") %>' width="250" required></asp:TextBox></td>
                        <td><asp:TextBox ID="txtAgency" runat="server" Text='<%# Bind("strAgency") %>' width="250" required></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                        </td>
                    </tr>
                    </table>
                </EditItemTemplate>
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            </asp:FormView>
        </div>
    </div>
    <br />
    <div class="card w-75 mx-auto">
        <div class="card-header bg-secondary text-warning">
            <table class="w-100">
                <tr>
                    <td align="left">Water Quality Assessments</td>
                    <td align="right"><asp:Button ID="btnAddWQ" runat="server" Text="Add New" class="btn btn-dark btn-sm" OnClick="btnAddWQ_Click" /></td>
                </tr>
            </table>
        </div>
        <div class="card-body">
            <asp:GridView ID="gvWQAssessments" runat="server" 
                ShowHeaderWhenEmpty="True" 
                AllowPaging="True" 
                PageSize="10" 
                OnPageIndexChanging="gvWQAssessments_PageIndexChanging" 
                AutoGenerateColumns="False" 
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
                    <asp:HyperLinkField DataNavigateUrlFields="intWQID,intStationID" DataNavigateUrlFormatString="~\wqassessment.aspx?wqid={0}&sid={1}" NavigateUrl="wqassessment.aspx" Text="View" />
                    <asp:BoundField DataField="strCompletedBy" HeaderText="Completed By" />
                    <asp:BoundField DataField="dtmSurveyInfoDT" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Survey Date" />
                    <asp:BoundField DataField="dtmSurveyInfoTM" HeaderText="Survey Time" />
                    <asp:BoundField DataField="strSTORET" HeaderText="STORET #" />
                    <asp:BoundField DataField="strInvestigators" HeaderText="Investigators" />
                    <asp:BoundField DataField="strSurveyReason" HeaderText="Reason" />
                </Columns>
                <EmptyDataTemplate>No assessments available</EmptyDataTemplate>
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
        </div>
    </div>
    <style>
        .icon-view-map
        {
            fill: red;
        }
    </style>
</asp:Content>
