<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="adminmob.aspx.cs" Inherits="BioData.adminmob" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        Mobile Data Administration
    </div>
    <div class="card w-75 mx-auto">
        <div class="card-header bg-secondary text-warning">Web Services</div>
        <div class="card-body">
        <div class="alert alert-dark" role="alert">
            Local Web Services
        </div>
            <asp:gridview id="gvWebServices" runat="server" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                PageSize="10" 
                OnPageIndexChanging="gvWebServices_PageIndexChanging"
                OnRowEditing="gvWebServices_RowEditing" 
                OnRowCancelingEdit="gvWebServices_RowCancelingEdit" 
                OnRowUpdating="gvWebServices_RowUpdating" 
                datakeynames="intWSID" 
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
                    <asp:TemplateField HeaderText="Web Service Name">
                        <ItemTemplate>
                            <asp:Label ID="lblWSKey" runat="server" Text='<%# Bind("strWSKey") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web Service Location">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cmbWebServLoc" runat="server"  
                                DataSourceID="sdsWebServLoc" DataTextField="strWSLName" DataValueField="intWSLID" 
                                SelectedValue='<%# Bind("intWSLID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("strWSLName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web Service URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtWSURL" runat="server" Text='<%# Bind("strWSURL") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWSURL" ValidationGroup="EditWebServ" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWSURL" runat="server" Text='<%# Bind("strWSURL") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="630px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  ValidationGroup="EditWebServ"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
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
        <div class="alert alert-dark" role="alert">
            Authorized Data Share Web Services
        </div>
        <asp:gridview id="gvWebServicesRemote" runat="server" 
                AutoGenerateColumns="False" 
                AllowPaging="True" 
                PageSize="10" 
                OnPageIndexChanging="gvWebServicesRemote_PageIndexChanging"
                OnRowEditing="gvWebServicesRemote_RowEditing" 
                OnRowCancelingEdit="gvWebServicesRemote_RowCancelingEdit" 
                OnRowUpdating="gvWebServicesRemote_RowUpdating" 
                OnRowDeleting="gvWebServicesRemote_RowDeleting" 
                OnRowDataBound="gvWebServicesRemote_RowDataBound" 
                datakeynames="intWSID" 
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
                    <asp:TemplateField HeaderText="Web Service Name">
                        <ItemTemplate>
                            <asp:Label ID="lblWSKeyRemote" runat="server" Text='<%# Bind("strWSKey") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web Service Location">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cmbWebServLocRemote" runat="server"  
                                DataSourceID="sdsWebServLoc" DataTextField="strWSLName" DataValueField="intWSLID" 
                                SelectedValue='<%# Bind("intWSLID") %>'>
                            </asp:DropDownList>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWSLNameRemote" runat="server" Text='<%# Bind("strWSLName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web Service URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtWSURLRemote" runat="server" Text='<%# Bind("strWSURL") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWSURLRemote" ValidationGroup="EditWebServ" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWSURLRemote" runat="server" Text='<%# Bind("strWSURL") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="630px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdateRemote" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  ValidationGroup="EditWebServ"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancelRemote" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEditRemote" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDeleteRemote" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
                Add Authorized External Web Map Services
            </div>
            <table class="w-100 table-bordered">
                <thead>
                    <tr>
                        <th>Web Service Location</th>
                        <th>Web Service Name</th>
                        <th>Web Service URL</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <asp:DropDownList ID="cmbWebServLocRemoteAdd" runat="server"  
                                DataTextField="strWSLName" DataValueField="intWSLID">
                            </asp:DropDownList><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbWebServLocRemoteAdd" ValidationGroup="AddWSR" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebNameAdd" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWebNameAdd" ValidationGroup="AddWSR" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebURLAdd" runat="server" size="100"></asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWebURLAdd" ValidationGroup="AddWSR" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td valign="top"><asp:Button ID="btnAddWebServRemote" runat="server" Text="Add" CausesValidation="true" ValidationGroup="AddWSR" class="btn btn-secondary btn-sm" OnClick="btnAddWebServRemote_Click" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <br /><br />
    <asp:SqlDataSource ID="sdsWebServLoc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BioData %>" 
        SelectCommand="SELECT DISTINCT intWSLID, strWSLName FROM tblWebServicesLocation">
    </asp:SqlDataSource>
</asp:Content>
