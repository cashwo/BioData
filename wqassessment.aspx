<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true" CodeBehind="wqassessment.aspx.cs" Inherits="BioData.wqassessment" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="server">
    <div class="alert alert-dark" role="alert">
        <asp:Label ID="lblStationNameNum" runat="server" Text="Label"></asp:Label>
    </div>

    <div class="container">
        <div class="row">
            <div>
                <div id="btngWaterQuality" class="btn-group-vertical">
                    <button type="button" id="btnWQSurveyInfo" class="btn btn-secondary" onclick="SetActive('colWQSurveyInfo');">Survey Information</button>
                    <button type="button" id="btnWQWeatherCond" class="btn btn-secondary" onclick="SetActive('colWQWeatherCond');">Weather Conditions</button>
                    <button type="button" id="btnWQStreamChar" class="btn btn-secondary" onclick="SetActive('colWQStreamChar');">Stream Characterization</button>
                    <button type="button" id="btnWQWatershedFeat" class="btn btn-secondary" onclick="SetActive('colWQWatershedFeat');">Watershed Features</button>
                    <button type="button" id="btnWQRipVeg" class="btn btn-secondary" onclick="SetActive('colWQRipVeg');">Riparian Vegetation<br /><small class="text-warning">(18 Meter Buffer)</small></button>
                    <button type="button" id="btnWQInStreamFeat" class="btn btn-secondary" onclick="SetActive('colWQInStreamFeat');">Instream Features</button>
                    <button type="button" id="btnWQLargeWoodyDebris" class="btn btn-secondary" onclick="SetActive('colWQLargeWoodyDebris');">Large Woody Debris</button>
                    <button type="button" id="btnWQAquaticVeg" class="btn btn-secondary" onclick="SetActive('colWQAquaticVeg');">Aquatic Vegetation</button>
                    <button type="button" id="btnWQWaterQuality" class="btn btn-secondary" onclick="SetActive('colWQWaterQuality');">Water Quality</button>
                    <button type="button" id="btnWQSedSub" class="btn btn-secondary" onclick="SetActive('colWQSedSub');">Sediment&#47;Substrate</button>
                    <button type="button" id="btnWQInorgSub" class="btn btn-secondary" onclick="SetActive('colWQInorgSub');">Inorganic Substrate Components</button>
                    <button type="button" id="btnWQOrgSub" class="btn btn-secondary" onclick="SetActive('colWQOrgSub');">Organic Substrate Components</button>
                </div>
            </div>
            <div>
                <div id="WQForms" style="padding-left: 15px; width: 730px;">
                    <div class="bg-danger rounded-lg" style="padding-left: 15px;">
                        <asp:Label ID="lblInsertAlert" runat="server" class="text-wrap text-white" Visible="false" 
                            Text="When adding a new Water Quality Assessment, the Survey Information must be filled out first.  
                                  <br />Then the rest of the form can be entered."></asp:Label>
                    </div>
                    <!--########################################################-->
                    <!-- Survey Information: Start -->
                    <!--########################################################-->
                    <div id="colWQSurveyInfo" class="show">
                        <div class="alert alert-dark" role="alert">
                            Survey Information
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQSurveyInfo" 
                            runat="server" 
                            OnModeChanging="fvWQSurveyInfo_ModeChanging" 
                            OnItemUpdating="fvWQSurveyInfo_ItemUpdating"  
                            OnItemInserting="fvWQSurveyInfo_ItemInserting"
                            BackColor="White" 
                            BorderColor="#999999" 
                            BorderStyle="Solid" 
                            BorderWidth="1px" 
                            CellPadding="3" 
                            ForeColor="Black" 
                            GridLines="Vertical" 
                            Width="700px">
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="mx-auto table-sm w-100">
                                        <tr>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Form Completed By</small></td>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Date (mm/dd/yyyy)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Time (hh:mm:ss)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>STORET #</small></td>
							            </tr>
                                        <tr>
                                            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblCompletedBy" runat="server" Text='<%# Bind("strCompletedBy") %>'></asp:Label></td>
                                            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblCompleteDate" runat="server" Text='<%# Eval("dtmSurveyInfoDT", "{0:MM/dd/yyyy}") %>'></asp:Label></td>
                                            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblCompleteTime" runat="server" Text='<%# Bind("dtmSurveyInfoTM") %>'></asp:Label></td>
                                            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblStoretNum" runat="server" Text='<%# Bind("strSTORET") %>'></asp:Label></td>
                                        </tr>
                                     </table>
                                    <br />
                                    <table class="mx-auto w-100">
						                <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Investigators</small></td>
							            </tr>
                                        <tr>
								            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblInvestigators" runat="server" Text='<%# Bind("strInvestigators") %>'></asp:Label></td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Survey Reason</small></td>
							            </tr>
							            <tr>
								            <td class="border-bottom border-left border-right border-secondary"><asp:Label ID="lblSurveyReason" runat="server" Text='<%# Bind("strSurveyReason") %>'></asp:Label></td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditSRV" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table class="mx-auto table-sm w-100">
							            <tr>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Form Completed By</small></td>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Date (mm/dd/yyyy)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Time (hh:mm:ss)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>STORET #</small></td>
							            </tr>
                                        <tr>
                                            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:Label ID="lblCompletedByEdit" runat="server" Text='<%# Bind("strCompletedBy") %>'></asp:Label><br /><br />
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtCompleteDate" runat="server" Text='<%# Eval("dtmSurveyInfoDT", "{0:MM/dd/yyyy}") %>' required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtCompleteDate" 
                                                    Type="Date"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be date"
                                                    ValidationGroup="SurvInfo" />
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtCompleteTime" runat="server" Text='<%# Bind("dtmSurveyInfoTM") %>' required></asp:TextBox><br />
                                                <asp:RegularExpressionValidator runat="server" 
                                                    ErrorMessage="Value must be in the hh:mm:ss format" 
                                                    ForeColor="Red"
                                                    ControlToValidate="txtCompleteTime" 
                                                    ValidationExpression="^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$" 
                                                    ValidationGroup="SurvInfo" />
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtStoretNum" runat="server" Text='<%# Bind("strSTORET") %>' required></asp:TextBox><br /><br />
                                            </td>
                                        </tr>
                                     </table>
                                    <br />
                                    <table class="mx-auto w-100">
						                <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Investigators</small></td>
							            </tr>
                                        <tr>
								            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtInvestigators" runat="server" Text='<%# Bind("strInvestigators") %>' Columns="100" Rows="5" TextMode="MultiLine" required></asp:TextBox>
                                             </td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Survey Reason</small></td>
							            </tr>
							            <tr>
								            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtSurveyReason" runat="server" Text='<%# Bind("strSurveyReason") %>' Columns="100" Rows="5" TextMode="MultiLine" required></asp:TextBox>
                                            </td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateSRV" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="SurvInfo" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelSRV" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto table-sm w-100">
							            <tr>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Form Completed By</small></td>
								            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Date (mm/dd/yyyy)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>Time (hh:mm:ss)</small></td>
                                            <td class="bg-dark text-white border-bottom border-left border-right border-secondary"><small>STORET #</small></td>
							            </tr>
                                        <tr>
                                            <td class="border-bottom border-left border-right border-secondary align-top">
                                                <asp:TextBox ID="txtCompletedBy" runat="server" Text='<%# Bind("strCompletedBy") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtCompletedBy" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo"/>
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary align-top">
                                                <asp:TextBox ID="txtCompleteDate" runat="server" Text='<%# Bind("dtmSurveyInfoDT") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtCompleteDate" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtCompleteDate" 
                                                    Type="Date"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be date"
                                                    ValidationGroup="SurvInfo" />
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary align-top">
                                                <asp:TextBox ID="txtCompleteTime" runat="server" Text='<%# Bind("dtmSurveyInfoTM") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtCompleteTime" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo"/>
                                                <asp:RegularExpressionValidator runat="server" 
                                                    ErrorMessage="Value must be in the hh:mm:ss format" 
                                                    ForeColor="Red"
                                                    ControlToValidate="txtCompleteTime" 
                                                    ValidationExpression="^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$" 
                                                    ValidationGroup="SurvInfo" />
                                            </td>
                                            <td class="border-bottom border-left border-right border-secondary align-top">
                                                <asp:TextBox ID="txtStoretNum" runat="server" Text='<%# Bind("strSTORET") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtStoretNum" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo"/>
                                            </td>
                                        </tr>
                                     </table>
                                    <br />
                                    <table class="mx-auto">
						                <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Investigators</small></td>
							            </tr>
                                        <tr>
								            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtInvestigators" runat="server" Text='<%# Bind("strInvestigators") %>' Columns="115" Rows="5" TextMode="MultiLine"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtInvestigators" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo"/>
                                             </td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto">
							            <tr>
								            <td class="bg-dark text-white border-top border-left border-right border-secondary"><small>Survey Reason</small></td>
							            </tr>
							            <tr>
								            <td class="border-bottom border-left border-right border-secondary">
                                                <asp:TextBox ID="txtSurveyReason" runat="server" Text='<%# Bind("strSurveyReason") %>' Columns="115" Rows="5" TextMode="MultiLine"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    ControlToValidate="txtInvestigators" 
                                                    ForeColor="Red" 
                                                    runat="server" 
                                                    ErrorMessage="Required"
                                                    ValidationGroup="SurvInfo"/>
                                            </td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto">
                                    <tr>
                                        <td >
                                            <asp:Button ID="btnInsertNewSRV" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="SurvInfo" class="btn btn-secondary bg-dark btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Survey Information: End -->
                    <!-- Weather Conditions: Start -->
                    <!--########################################################-->
                    <div id="colWQWeatherCond" class="collapse">
                        <div class="alert alert-dark" role="alert">
                            Weather Conditions
                        </div>
                        <div class="">
                              <asp:FormView ID="fvWQWeatherCond" 
                                runat="server" 
                                OnModeChanging="fvWQWeatherCond_ModeChanging" 
                                OnItemUpdating="fvWQWeatherCond_ItemUpdating" 
                                OnItemInserting="fvWQWeatherCond_ItemInserting" 
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table class="table table-sm table-bordered table-striped w-100">
                                            <thead class="thead-dark text-white">
                                                <tr>
                                                    <th>&nbsp;</th>
                                                    <th>Now</th>
                                                    <th>Past 24 Hours</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Weather Conditions</td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCondNow" 
                                                            runat="server" 
                                                            Enabled="false" 
                                                            SelectedValue='<%# Bind("intWeatherCondNow") %>' 
                                                            Width="100%">
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCond24" 
                                                            runat="server" 
                                                            Enabled="false" 
                                                            SelectedValue='<%# Bind("intWeatherCond24") %>' 
                                                            Width="100%">
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Cloud Cover &#40;&#37;&#41;</td>
                                                    <td><asp:Label ID="lblWQCloudCoverNow" runat="server" Text='<%# Bind("decPctCloudCoverNow") %>' /></td>
                                                    <td><asp:Label ID="lblWQCloudCover24" runat="server" Text='<%# Bind("decPctCloudCover24") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Has there been a heavy rain event in the last 7 days?</td>
                                                    <td colspan="2">
                                                        <asp:RadioButtonList ID="rblWQHeavyRainEvt" 
                                                            runat="server" 
                                                            Enabled="false" 
                                                            RepeatDirection="Horizontal" 
                                                            SelectedValue='<%# Bind("intRainEventLst7") %>' 
                                                            Width="100%">
                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <table class="mx-auto w-100">
							                <tr>
                                                <td align="center"><asp:LinkButton ID="lbEditWQ" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table class="table table-sm table-bordered table-striped w-100">
                                            <thead class="thead-dark text-white">
                                                <tr>
                                                    <th>&nbsp;</th>
                                                    <th>Now</th>
                                                    <th>Past 24 Hours</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Weather Conditions</td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCondNow" 
                                                            runat="server" 
                                                            SelectedValue='<%# Bind("intWeatherCondNow") %>' 
                                                            Width="100%" 
                                                            required>
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCond24" 
                                                            runat="server" 
                                                            SelectedValue='<%# Bind("intWeatherCond24") %>' 
                                                            Width="100%" 
                                                            required>
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Cloud Cover &#40;&#37;&#41;</strong></td>
                                                    <td>
                                                        <asp:TextBox ID="txtWQCloudCoverNow" runat="server" Text='<%# Bind("decPctCloudCoverNow") %>' required /><br />
                                                        <asp:CompareValidator runat="server" 
                                                            ControlToValidate="txtWQCloudCoverNow" 
                                                            Type="Double"
                                                            ForeColor="Red" 
                                                            Operator="DataTypeCheck" 
                                                            ErrorMessage="Value must be numeric"
                                                            ValidationGroup="WeatherCond" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtWQCloudCover24" runat="server" Text='<%# Bind("decPctCloudCover24") %>' required /><br />
                                                        <asp:CompareValidator runat="server" 
                                                            ControlToValidate="txtWQCloudCover24" 
                                                            Type="Double"
                                                            ForeColor="Red" 
                                                            Operator="DataTypeCheck" 
                                                            ErrorMessage="Value must be numeric"
                                                            ValidationGroup="WeatherCond" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Has there been a heavy rain event in the last 7 days?</strong></td>
                                                    <td colspan="2">
                                                        <asp:RadioButtonList ID="rblWQHeavyRainEvt" 
                                                            runat="server" 
                                                            RepeatDirection="Horizontal" 
                                                            SelectedValue='<%# Bind("intRainEventLst7") %>' 
                                                            Width="100%" required>
                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <table class="w-100">
                                        <tr>
                                            <td align="center" colspan="3">
                                                <asp:Button ID="btnUpdateWQ" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="WeatherCond" class="btn btn-secondary btn-sm" />
                                                <asp:Button ID="btnCancelWQ" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                            </td>
                                        </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table class="table table-sm table-bordered table-striped w-100">
                                            <thead class="thead-dark text-white">
                                                <tr>
                                                    <th>&nbsp;</th>
                                                    <th>Now</th>
                                                    <th>Past 24 Hours</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Weather Conditions</td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCondNow" 
                                                            runat="server" 
                                                            SelectedValue='<%# Bind("intWeatherCondNow") %>' 
                                                            Width="100%" >
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ControlToValidate="rblWQWeatherCondNow" 
                                                            ValidationGroup="WQWeatherCondNow"
                                                            ForeColor="Red"
                                                            ErrorMessage="Required" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblWQWeatherCond24" 
                                                            runat="server" 
                                                            SelectedValue='<%# Bind("intWeatherCond24") %>' 
                                                            Width="100%" >
                                                            <asp:ListItem Text="Storm (Heavy Rain)" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Rain (Steady Rain)" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Showers (Intermittent)" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Clear/Sunny" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ControlToValidate="rblWQWeatherCond24" 
                                                            ValidationGroup="WQWeatherCondNow"
                                                            ForeColor="Red"
                                                            ErrorMessage="Required" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Cloud Cover &#40;&#37;&#41;</strong></td>
                                                    <td>
                                                        <asp:TextBox ID="txtWQCloudCoverNow" runat="server" Text='<%# Bind("decPctCloudCoverNow") %>' /><br />
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ControlToValidate="txtWQCloudCoverNow" 
                                                            ValidationGroup="WQWeatherCondNow"
                                                            ForeColor="Red"
                                                            ErrorMessage="Required" />
                                                        <asp:CompareValidator runat="server" 
                                                            ControlToValidate="txtWQCloudCoverNow" 
                                                            Type="Double"
                                                            ForeColor="Red" 
                                                            Operator="DataTypeCheck" 
                                                            ErrorMessage="Value must be numeric"
                                                            ValidationGroup="WeatherCond" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtWQCloudCover24" runat="server" Text='<%# Bind("decPctCloudCover24") %>' /><br />
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ControlToValidate="txtWQCloudCover24" 
                                                            ValidationGroup="WQWeatherCondNow"
                                                            ForeColor="Red"
                                                            ErrorMessage="Required" />
                                                        <asp:CompareValidator runat="server" 
                                                            ControlToValidate="txtWQCloudCover24" 
                                                            Type="Double"
                                                            ForeColor="Red" 
                                                            Operator="DataTypeCheck" 
                                                            ErrorMessage="Value must be numeric"
                                                            ValidationGroup="WeatherCond" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Has there been a heavy rain event in the last 7 days?</strong></td>
                                                    <td colspan="2">
                                                        <asp:RadioButtonList ID="rblWQHeavyRainEvt" 
                                                            runat="server" 
                                                            RepeatDirection="Horizontal" 
                                                            SelectedValue='<%# Bind("intRainEventLst7") %>' 
                                                            Width="100%" >
                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ControlToValidate="rblWQHeavyRainEvt" 
                                                            ValidationGroup="WQWeatherCondNow"
                                                            ForeColor="Red"
                                                            ErrorMessage="Required" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <table class="w-100">
                                        <tr>
                                            <td align="center" colspan="3">
                                                <asp:Button ID="btnInsertNewWQ" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="WQWeatherCondNow" class="btn btn-secondary btn-sm" />
                                            </td>
                                        </tr>
                                        </table>
                                    </InsertItemTemplate>
                              </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Weather Conditions: End -->
                    <!--Stream Characterization: Start -->
                    <!--########################################################-->
                    <div id="colWQStreamChar" class="collapse">
                        <div class="alert alert-dark" role="alert">
                            Stream Characterization
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQStreamChar" 
                                runat="server" 
                                OnModeChanging="fvWQStreamChar_ModeChanging" 
                                OnItemUpdating="fvWQStreamChar_ItemUpdating" 
                                OnItemInserting="fvWQStreamChar_ItemInserting" 
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Stream Subsystem</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamSubsystem" 
                                                        runat="server" 
                                                        Enabled="false" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamSubSys") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Perennial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Intermittent" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Tidal" Value="3"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Origin</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamOrigin" 
                                                        runat="server" 
                                                        Enabled="false" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamOrigin") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Glacial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Non-glacial montane" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Swamp and Bog" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Spring Fed" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Mixture of Origins" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width: 150px;"><strong>Other Stream Origin</strong></td>
                                                            <td><asp:Label ID="lblWQOtherStreamOrig" runat="server" Text='<%# Bind("strStreamOriginOther") %>'></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Type</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblStreamType" 
                                                        runat="server" 
                                                        Enabled="false" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamType") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Cold Water" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Warm Water" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td class="bg-light" style="width: 170px;"><strong>Catchment Area (km<sup>3</sup>)</strong></td>
                                                            <td><asp:Label ID="lblWQCatchmentArea" runat="server" Text='<%# Bind("decCatchmentArea") %>'></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table class="mx-auto w-100">
							                <tr>
                                                <td align="center"><asp:LinkButton ID="lbEditSC" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Stream Subsystem</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamSubsystem" 
                                                        runat="server" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamSubSys") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Perennial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Intermittent" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Tidal" Value="3"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Origin</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamOrigin" 
                                                        runat="server" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamOrigin") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Glacial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Non-glacial montane" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Swamp and Bog" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Spring Fed" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Mixture of Origins" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width: 150px;"><strong>Other Stream Origin</strong></td>
                                                            <td><asp:TextBox ID="txtWQOtherStreamOrig" runat="server" Text='<%# Bind("strStreamOriginOther") %>'></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Type</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblStreamType" 
                                                        runat="server"
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intStreamType") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Cold Water" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Warm Water" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td class="bg-light" style="width: 170px;"><strong>Catchment Area (km<sup>3</sup>)</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtWQCatchmentArea" runat="server" Text='<%# Bind("decCatchmentArea") %>' required></asp:TextBox> <br />
                                                                <asp:CompareValidator runat="server" 
                                                                    ControlToValidate="txtWQCatchmentArea" 
                                                                    Type="Double"
                                                                    ForeColor="Red" 
                                                                    Operator="DataTypeCheck" 
                                                                    ErrorMessage="Value must be numeric"
                                                                    ValidationGroup="WeatherCond" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table class="w-100">
                                        <tr>
                                            <td align="center" colspan="3">
                                                <asp:Button ID="btnUpdateSC" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                                                <asp:Button ID="btnCancelSC" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                            </td>
                                        </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Stream Subsystem</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamSubsystem" 
                                                        runat="server" 
                                                        RepeatDirection="Horizontal" 
                                                        Width="100%">
                                                        <asp:ListItem Text="Perennial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Intermittent" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Tidal" Value="3"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator 
                                                        runat="server" 
                                                        ControlToValidate="rblWQStreamSubsystem" 
                                                        ValidationGroup="StreamChar"
                                                        ForeColor="Red"
                                                        ErrorMessage="Required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Origin</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQStreamOrigin" 
                                                        runat="server" 
                                                        RepeatDirection="Horizontal" 
                                                        Width="100%">
                                                        <asp:ListItem Text="Glacial" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Non-glacial montane" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Swamp and Bog" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Spring Fed" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Mixture of Origins" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator 
                                                        runat="server" 
                                                        ControlToValidate="rblWQStreamOrigin" 
                                                        ValidationGroup="StreamChar"
                                                        ForeColor="Red"
                                                        ErrorMessage="Required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width: 150px;"><strong>Other Stream Origin</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtWQOtherStreamOrig" runat="server"></asp:TextBox><br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Stream Type</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblStreamType" 
                                                        runat="server"
                                                        RepeatDirection="Horizontal"
                                                        Width="100%">
                                                        <asp:ListItem Text="Cold Water" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Warm Water" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator 
                                                        runat="server" 
                                                        ControlToValidate="rblStreamType" 
                                                        ValidationGroup="StreamChar"
                                                        ForeColor="Red"
                                                        ErrorMessage="Required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td class="bg-light" style="width: 170px;"><strong>Catchment Area (km<sup>3</sup>)</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtWQCatchmentArea" runat="server" Text='<%# Bind("decCatchmentArea") %>'></asp:TextBox> <br />
                                                                <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ControlToValidate="txtWQCatchmentArea" 
                                                                    ValidationGroup="StreamChar"
                                                                    ForeColor="Red"
                                                                    ErrorMessage="Required" />
                                                                <asp:CompareValidator runat="server" 
                                                                    ControlToValidate="txtWQCatchmentArea" 
                                                                    Type="Double"
                                                                    ForeColor="Red" 
                                                                    Operator="DataTypeCheck" 
                                                                    ErrorMessage="Value must be numeric"
                                                                    ValidationGroup="StreamChar" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table class="w-100">
                                        <tr>
                                            <td align="center" colspan="3">
                                                <asp:Button ID="btnInsertNewSV" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="StreamChar" class="btn btn-secondary btn-sm" />
                                            </td>
                                        </tr>
                                        </table>
                                    </InsertItemTemplate>
                              </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Stream Characterization: End -->
                    <!-- Watershed Features: Start -->
                    <!--########################################################-->
                    <div id="colWQWatershedFeat" class="collapse">
                        <div class="alert alert-dark" role="alert">
                            Watershed Features
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQWatershedFeat" 
                            runat="server" 
                            OnModeChanging="fvWQWatershedFeat_ModeChanging" 
                            OnItemUpdating="fvWQWatershedFeat_ItemUpdating" 
                            OnItemInserting="fvWQWatershedFeat_ItemInserting"
                            BackColor="White" 
                            BorderColor="#999999" 
                            BorderStyle="Solid" 
                            BorderWidth="1px" 
                            CellPadding="3" 
                            ForeColor="Black" 
                            GridLines="Vertical" 
                            Width="700px">
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="table table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Predominant Surrounding Landuse</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQLandUse" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intPredomLandUse") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Forest" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Field/Pasture" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Agriculture" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Residential" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Commercial" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Industrial" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="w-100">
                                                    <tr>
                                                        <td style="width: 150px;"><strong>Other Predominant Surrounding Landuse</strong></td>
                                                        <td><asp:Label ID="lblWQOtherLandUse" runat="server" Text='<%# Bind("strPredomLandUseOther") %>'></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed NPS Pollution</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQNPSPoll" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalNPSPol") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="No Evidence" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Some Potential Sources" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Obvious Sources" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed Erosion</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblErosion" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalWSErosion") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Moderate" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Heavy" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
						                <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditWF" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table class="table table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Predominant Surrounding Landuse</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQLandUse" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intPredomLandUse") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Forest" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Field/Pasture" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Agriculture" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Residential" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Commercial" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Industrial" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="w-100">
                                                    <tr>
                                                        <td style="width: 150px;"><strong>Other Predominant Surrounding Landuse</strong></td>
                                                        <td><asp:TextBox ID="txtWQOtherLandUse" runat="server" Text='<%# Bind("strPredomLandUseOther") %>' size="80" required></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed NPS Pollution</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQNPSPoll" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalNPSPol") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="No Evidence" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Some Potential Sources" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Obvious Sources" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed Erosion</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblErosion" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalWSErosion") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Moderate" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Heavy" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
					                <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateWF" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelWF" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="table table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Predominant Surrounding Landuse</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQLandUse" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intPredomLandUse") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Forest" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Field/Pasture" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Agriculture" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Residential" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Commercial" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Industrial" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="rblWQLandUse" 
                                                    ValidationGroup="WatershedFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="w-100">
                                                    <tr>
                                                        <td style="width: 150px;"><strong>Other Predominant Surrounding Landuse</strong></td>
                                                        <td>
                                                            <asp:TextBox ID="txtWQOtherLandUse" runat="server" Text='<%# Bind("strPredomLandUseOther") %>' size="130"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="txtWQOtherLandUse" 
                                                                ValidationGroup="WatershedFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed NPS Pollution</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQNPSPoll" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalNPSPol") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="No Evidence" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Some Potential Sources" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Obvious Sources" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="rblWQNPSPoll" 
                                                    ValidationGroup="WatershedFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Local Watershed Erosion</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblErosion" 
                                                    runat="server"
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intLocalWSErosion") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Moderate" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Heavy" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="rblErosion" 
                                                    ValidationGroup="WatershedFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                    </table>
					                <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewWF" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="WatershedFeat" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Watershed Features: End -->
                    <!-- Riparian Vegetation: Start -->
                    <!--########################################################-->
                    <div id="colWQRipVeg" class="collapse">
                        <div class="alert alert-dark" role="alert">
                            Riparian Vegetation <small class="text-muted">(18 Meter Buffer)</small>
                        </div>
                        <div class="">
                            <asp:FormView ID="fvRipVeg" 
                                runat="server" 
                                OnModeChanging="fvRipVeg_ModeChanging" 
                                OnItemUpdating="fvRipVeg_ItemUpdating" 
                                OnItemInserting="fvRipVeg_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQDomVeg" 
                                                        runat="server" 
                                                        Enabled="false" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intDomSpeciesPresent") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Trees" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Shrubs" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Grasses" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Herbaceous" Value="4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width: 150px;"><strong>Dominant Species Present</strong></td>
                                                            <td><asp:Label ID="lblDomSpeciesRipVeg" runat="server" Text='<%# Bind("strDomSpeciesPresentLst") %>'></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table class="mx-auto w-100">
							                <tr>
                                                <td align="center"><asp:LinkButton ID="lbEditRV" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
						            <EditItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQDomVeg" 
                                                        runat="server"
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intDomSpeciesPresent") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Trees" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Shrubs" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Grasses" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Herbaceous" Value="4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width:80;"><strong>Dominant Species Present</strong></td>
                                                            <td><asp:TextBox ID="txtDomSpeciesRipVeg" runat="server" Text='<%# Bind("strDomSpeciesPresentLst") %>' size="80" required></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
						                <br />
                                        <table class="w-100">
                                        <tr>
                                            <td align="center" colspan="3">
                                                <asp:Button ID="btnUpdateRV" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                                                <asp:Button ID="btnCancelRV" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                            </td>
                                        </tr>
                                        </table>
						            </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table class="table table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQDomVeg" 
                                                        runat="server"
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intDomSpeciesPresent") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Trees" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Shrubs" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Grasses" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Herbaceous" Value="4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator 
                                                        runat="server" 
                                                        ControlToValidate="rblWQDomVeg" 
                                                        ValidationGroup="RipVeg"
                                                        ForeColor="Red"
                                                        ErrorMessage="Required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="w-100">
                                                        <tr>
                                                            <td style="width: 150px;"><strong>Dominant Species Present</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtDomSpeciesRipVeg" runat="server" Text='<%# Bind("strDomSpeciesPresentLst") %>' size="130"></asp:TextBox><br />
                                                                <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ControlToValidate="txtDomSpeciesRipVeg" 
                                                                    ValidationGroup="RipVeg"
                                                                    ForeColor="Red"
                                                                    ErrorMessage="Required" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
						                <br />
					                    <table class="w-100">
					                    <tr>
						                    <td align="center" colspan="3">
							                    <asp:Button ID="btnInsertNewSRV" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="RipVeg" class="btn btn-secondary btn-sm" />
						                    </td>
					                    </tr>
					                    </table>
                                    </InsertItemTemplate>
                                </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Riparian Vegetation: End -->
                    <!-- Instream Features: Start -->
                    <!--########################################################-->
                    <div id="colWQInStreamFeat" class="collapse">
                        <div class="alert alert-dark" role="alert">
                            Instream Features
                        </div>
                        <div class="">
                            <asp:FormView ID="fvInstreamFeat" 
                                runat="server" 
                                OnModeChanging="fvInstreamFeat_ModeChanging" 
                                OnItemUpdating="fvInstreamFeat_ItemUpdating" 
                                OnItemInserting="fvInstreamFeat_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table class="mx-auto w-100 table-sm">
                                            <tr>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblEstReachLen" runat="server" Text='<%# Bind("decEstReachLength") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblEstStreamWdth" runat="server" Text='<%# Bind("decEstReachWidth") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblEstStreamArea" runat="server" Text='<%# Bind("decEstReachArea") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblAreaInKM" runat="server" Text='<%# Bind("decAreaKM") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lbllEstStreamDepth" runat="server" Text='<%# Bind("decEstReachDepth") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblSurfVelThalwag" runat="server" Text='<%# Bind("decSurfVelThalwag") %>'></asp:Label></td>
                                                <td class="border-top border-left border-right border-secondary"><asp:Label ID="lblHighWaterMrk" runat="server" Text='<%# Bind("decHighWaterMark") %>'></asp:Label></td>
                                            </tr>
							                <tr>
								                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Length (m)</small></td>
								                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Width (m)</small></td>
                                                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Area (m<sup>2</sup>)</small></td>
                                                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Area In km<sup>2</sup> (m<sup>2</sup>x1000)</small></td>
                                                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Depth (m)</small></td>
                                                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Surface Velocity at Thalwag (m/sec)</small></td>
                                                <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>High Water Mark (m)</small></td>
							                </tr>
                                        </table>
                                        <br />
                                        <table class="mx-auto w-100 table-sm table-bordered">
                                            <tr>
                                                <td class="bg-light"><strong>Canopy Cover</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rblWQCanopyCover" 
                                                        runat="server" 
                                                        Enabled="false" 
                                                        RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("intCanopyCover") %>' 
                                                        Width="100%">
                                                        <asp:ListItem Text="Partly Open" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Partly Shaded" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Shaded" Value="3"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong>Proportions of Reach Represented by Stream Morphology Types</strong></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="mx-auto w-100 table-sm">
                                                        <tr>
                                                            <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label1" runat="server" Text='<%# Bind("decPMTRiffle") %>'></asp:Label></td>
                                                            <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label2" runat="server" Text='<%# Bind("decPMTRun") %>'></asp:Label></td>
                                                            <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label3" runat="server" Text='<%# Bind("decPMTPool") %>'></asp:Label></td>
                                                        </tr>
							                            <tr>
								                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Riffle &#37;</small></td>
								                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Run &#37;</small></td>
                                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Pool &#37;</small></td>
							                            </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table class="mx-auto w-100 table-sm">
                                                        <tr>
                                                            <td class="bg-light"><strong>Channelized</strong></td>
                                                            <td class="bg-light"><strong>Dam Present</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:RadioButtonList ID="rblWQChannelized" 
                                                                    runat="server" 
                                                                    Enabled="false" 
                                                                    RepeatDirection="Horizontal" 
                                                                    SelectedValue='<%# Bind("intChannelized") %>' 
                                                                    Width="100%">
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                            <td>
                                                                <asp:RadioButtonList ID="rblWQDamPresent" 
                                                                    runat="server" 
                                                                    Enabled="false" 
                                                                    RepeatDirection="Horizontal" 
                                                                    SelectedValue='<%# Bind("intDamPresent") %>' 
                                                                    Width="100%">
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <table class="mx-auto w-100">
							                <tr>
                                                <td align="center"><asp:LinkButton ID="lbEditISF" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
						        <EditItemTemplate>
                                    <table class="mx-auto w-100 table-sm">
                                        <tr>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstReachLen" runat="server" Text='<%# Bind("decEstReachLength") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstReachLen" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstStreamWdth" runat="server" Text='<%# Bind("decEstReachWidth") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstStreamWdth" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstStreamArea" runat="server" Text='<%# Bind("decEstReachArea") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstStreamArea" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtAreaInKM" runat="server" Text='<%# Bind("decAreaKM") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtAreaInKM" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtlEstStreamDepth" runat="server" Text='<%# Bind("decEstReachDepth") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtlEstStreamDepth" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtSurfVelThalwag" runat="server" Text='<%# Bind("decSurfVelThalwag") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtSurfVelThalwag" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtHighWaterMrk" runat="server" Text='<%# Bind("decHighWaterMark") %>' size="10" required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtHighWaterMrk" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                        </tr>
							            <tr>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Length (m)</small></td>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Width (m)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Area (m<sup>2</sup>)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Area In km<sup>2</sup> (m<sup>2</sup>x1000)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Depth (m)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Surface Velocity at Thalwag (m/sec)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>High Water Mark (m)</small></td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Canopy Cover</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQCanopyCover" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intCanopyCover") %>' 
                                                    Width="100%"  
                                                    required>
                                                    <asp:ListItem Text="Partly Open" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Partly Shaded" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Shaded" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Proportions of Reach Represented by Stream Morphology Types</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtRiffleISF" runat="server" Text='<%# Bind("decPMTRiffle") %>' required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtRiffleISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtRunISF" runat="server" Text='<%# Bind("decPMTRun") %>' required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtRunISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtPoolISF" runat="server" Text='<%# Bind("decPMTPool") %>' required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtPoolISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                    </tr>
							                        <tr>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Riffle &#37;</small></td>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Run &#37;</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Pool &#37;</small></td>
							                        </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="bg-light"><strong>Channelized</strong></td>
                                                        <td class="bg-light"><strong>Dam Present</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButtonList ID="rblWQChannelized" 
                                                                runat="server" 
                                                                RepeatDirection="Horizontal" 
                                                                SelectedValue='<%# Bind("intChannelized") %>' 
                                                                Width="100%" 
                                                                required>
                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <asp:RadioButtonList ID="rblWQDamPresent" 
                                                                runat="server" 
                                                                RepeatDirection="Horizontal" 
                                                                SelectedValue='<%# Bind("intDamPresent") %>' 
                                                                Width="100%" 
                                                                required>
                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateISF" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="InstreamFeat" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelISF" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
						        </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto w-100 table-sm">
                                        <tr>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstReachLen" runat="server" Text='<%# Bind("decEstReachLength") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtEstReachLen" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstReachLen" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstStreamWdth" runat="server" Text='<%# Bind("decEstReachWidth") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtEstStreamWdth" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstStreamWdth" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtEstStreamArea" runat="server" Text='<%# Bind("decEstReachArea") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtEstStreamArea" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtEstStreamArea" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtAreaInKM" runat="server" Text='<%# Bind("decAreaKM") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtAreaInKM" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtAreaInKM" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtlEstStreamDepth" runat="server" Text='<%# Bind("decEstReachDepth") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtlEstStreamDepth" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtlEstStreamDepth" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtSurfVelThalwag" runat="server" Text='<%# Bind("decSurfVelThalwag") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtSurfVelThalwag" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtSurfVelThalwag" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtHighWaterMrk" runat="server" Text='<%# Bind("decHighWaterMark") %>' size="10"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtHighWaterMrk" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtHighWaterMrk" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="InstreamFeat" />
                                            </td>
                                        </tr>
							            <tr>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Length (m)</small></td>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Width (m)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Reach Area (m<sup>2</sup>)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Area In km<sup>2</sup> (m<sup>2</sup>x1000)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Estimated Stream Depth (m)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Surface Velocity at Thalwag (m/sec)</small></td>
                                            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>High Water Mark (m)</small></td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Canopy Cover</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQCanopyCover" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intCanopyCover") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Partly Open" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Partly Shaded" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Shaded" Value="3"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="rblWQCanopyCover" 
                                                    ValidationGroup="InstreamFeat"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Proportions of Reach Represented by Stream Morphology Types</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtRiffleISF" runat="server" Text='<%# Bind("decPMTRiffle") %>'></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="txtRiffleISF" 
                                                                ValidationGroup="InstreamFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtRiffleISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtRunISF" runat="server" Text='<%# Bind("decPMTRun") %>'></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="txtRunISF" 
                                                                ValidationGroup="InstreamFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtRunISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtPoolISF" runat="server" Text='<%# Bind("decPMTPool") %>'></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="txtPoolISF" 
                                                                ValidationGroup="InstreamFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtPoolISF" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="InstreamFeat" />
                                                        </td>
                                                    </tr>
							                        <tr>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Riffle &#37;</small></td>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Run &#37;</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Pool &#37;</small></td>
							                        </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="bg-light"><strong>Channelized</strong></td>
                                                        <td class="bg-light"><strong>Dam Present</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButtonList ID="rblWQChannelized" 
                                                                runat="server" 
                                                                RepeatDirection="Horizontal" 
                                                                SelectedValue='<%# Bind("intChannelized") %>' 
                                                                Width="100%" d>
                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="rblWQChannelized" 
                                                                ValidationGroup="InstreamFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                        </td>
                                                        <td>
                                                            <asp:RadioButtonList ID="rblWQDamPresent" 
                                                                runat="server" 
                                                                RepeatDirection="Horizontal" 
                                                                SelectedValue='<%# Bind("intDamPresent") %>' 
                                                                Width="100%" >
                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ControlToValidate="rblWQDamPresent" 
                                                                ValidationGroup="InstreamFeat"
                                                                ForeColor="Red"
                                                                ErrorMessage="Required" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewISF" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="InstreamFeat" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Instream Features: End -->
                    <!-- Large Woody Debris: Start -->
                    <!--########################################################-->
                    <div id="colWQLargeWoodyDebris" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Large Woody Debris
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQLargeWoodyDebris" 
                                runat="server" 
                                OnModeChanging="fvWQLargeWoodyDebris_ModeChanging" 
                                OnItemUpdating="fvWQLargeWoodyDebris_ItemUpdating" 
                                OnItemInserting="fvWQLargeWoodyDebris_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="mx-auto w-100 table-sm">
                                        <tr>
                                            <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label1" runat="server" Text='<%# Bind("decLWD") %>'></asp:Label></td>
                                            <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label2" runat="server" Text='<%# Bind("decLWDDensity") %>'></asp:Label></td>
                                        </tr>
							            <tr>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>LWD (m<sup>3</sup>)</small></td>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Density of LWD (m<sup>2</sup>&#47;km<sup>2</sup>) (LWD/reach area)</small></td>
							            </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditLWD" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
						        <EditItemTemplate>
                                    <table class="mx-auto w-100 table-sm">
                                        <tr>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtLWD" runat="server" Text='<%# Bind("decLWD") %>' required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtLWD" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="LargeWoodyDebris" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtLWDDensity" runat="server" Text='<%# Bind("decLWDDensity") %>' required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtLWDDensity" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="LargeWoodyDebris" />
                                            </td>
                                        </tr>
							            <tr>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>LWD (m<sup>3</sup>)</small></td>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Density of LWD (m<sup>2</sup>&#47;km<sup>2</sup>) (LWD/reach area)</small></td>
							            </tr>
                                    </table>
						        <br />
                                <table class="w-100">
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:Button ID="btnUpdateLWD" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="LargeWoodyDebris" class="btn btn-secondary btn-sm" />
                                        <asp:Button ID="btnCancelLWD" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                    </td>
                                </tr>
                                </table>
						        </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto w-100 table-sm">
                                        <tr>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtLWD" runat="server" Text='<%# Bind("decLWD") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtLWD" 
                                                    ValidationGroup="LargeWoodyDebris"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtLWD" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="LargeWoodyDebris" />
                                            </td>
                                            <td class="border-top border-left border-right border-secondary">
                                                <asp:TextBox ID="txtLWDDensity" runat="server" Text='<%# Bind("decLWDDensity") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtLWDDensity" 
                                                    ValidationGroup="LargeWoodyDebris"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtLWDDensity" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="LargeWoodyDebris" />
                                            </td>
                                        </tr>
							            <tr>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>LWD (m<sup>3</sup>)</small></td>
								            <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Density of LWD (m<sup>2</sup>&#47;km<sup>2</sup>) (LWD/reach area)</small></td>
							            </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewLWD" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="LargeWoodyDebris" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Large Woody Debris: End -->
                    <!-- Aquatic Vegetation: Start -->
                    <!--########################################################-->
                    <div id="colWQAquaticVeg" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Aquatic Vegetation
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQAquaticVeg" 
                                runat="server" 
                                OnModeChanging="fvWQAquaticVeg_ModeChanging" 
                                OnItemUpdating="fvWQAquaticVeg_ItemUpdating" 
                                OnItemInserting="fvWQAquaticVeg_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQAquaticVeg" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intDomTypeSpecPres") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Rooted Emergent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Submergent" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Flooding" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Free Floating" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Flooding Algae" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Attached Algae" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Portion of the Reach With Aquatic Vegetation (&#37;)</strong></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblReachAqVeg" runat="server" Text='<%# Bind("decPctReachAqVeg") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Dominant Species Present</strong></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblAVDomSpecPres" runat="server" Text='<%# Bind("strAVDomSpecPres") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditAV" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
						        <EditItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQAquaticVeg" 
                                                    runat="server"  
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intDomTypeSpecPres") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Rooted Emergent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Submergent" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Flooding" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Free Floating" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Flooding Algae" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Attached Algae" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Portion of the Reach With Aquatic Vegetation (&#37;)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtReachAqVeg" runat="server" Text='<%# Bind("decPctReachAqVeg") %>' required></asp:TextBox><br />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtReachAqVeg" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="AquaticVeg" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Dominant Species Present</strong></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtAVDomSpecPres" runat="server" Text='<%# Bind("strAVDomSpecPres") %>' size="150" required></asp:TextBox></td>
                                        </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateAV" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="AquaticVeg" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelAV" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
						        </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto table-sm table-bordered" style="width: 700px;">
                                        <tr>
                                            <td class="bg-light"><strong>Indicate the dominant type and record the dominant species present</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQAquaticVeg" 
                                                    runat="server"  
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intDomTypeSpecPres") %>' 
                                                    Width="720px" >
                                                    <asp:ListItem Text="Rooted Emergent" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Submergent" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Rooted Flooding" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Free Floating" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Flooding Algae" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Attached Algae" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="rblWQAquaticVeg" 
                                                    ValidationGroup="AquaticVeg"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Portion of the Reach With Aquatic Vegetation (&#37;)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtReachAqVeg" runat="server" Text='<%# Bind("decPctReachAqVeg") %>'></asp:TextBox><br />
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtReachAqVeg" 
                                                    ValidationGroup="AquaticVeg"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                                <asp:CompareValidator runat="server" 
                                                    ControlToValidate="txtReachAqVeg" 
                                                    Type="Double"
                                                    ForeColor="Red" 
                                                    Operator="DataTypeCheck" 
                                                    ErrorMessage="Value must be numeric"
                                                    ValidationGroup="AquaticVeg" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Dominant Species Present</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtAVDomSpecPres" runat="server" Text='<%# Bind("strAVDomSpecPres") %>' size="110"></asp:TextBox>
                                                <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ControlToValidate="txtAVDomSpecPres" 
                                                    ValidationGroup="AquaticVeg"
                                                    ForeColor="Red"
                                                    ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewAV" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="AquaticVeg" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Aquatic Vegetation: End -->
                    <!-- Water Quality: Start -->
                    <!--########################################################-->
                    <div id="colWQWaterQuality" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Water Quality
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQWaterQuality" 
                                runat="server" 
                                OnModeChanging="fvWQWaterQuality_ModeChanging" 
                                OnItemUpdating="fvWQWaterQuality_ItemUpdating" 
                                OnItemInserting="fvWQWaterQuality_ItemInserting"
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
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label1" runat="server" Text='<%# Bind("decWQTempC") %>'></asp:Label></td>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label2" runat="server" Text='<%# Bind("decWQSpecCond") %>'></asp:Label></td>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label3" runat="server" Text='<%# Bind("decWQDO") %>'></asp:Label></td>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label4" runat="server" Text='<%# Bind("decWQpH") %>'></asp:Label></td>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label5" runat="server" Text='<%# Bind("decWQTurbid") %>'></asp:Label></td>
                                                        <td class="border-top border-left border-right border-secondary"><asp:Label ID="Label6" runat="server" Text='<%# Bind("strWQInstrUsed") %>'></asp:Label></td>
                                                    </tr>
							                        <tr>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Temperature (&#176;C)</small></td>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Specific Conductance</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Dissolved Oxygen</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>pH</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Trubidity</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>WQ Instrument Used</small></td>
							                        </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQWaterOdors" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterOdor") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Normal&#47;None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Fish" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblOtherWaterOdor" runat="server" Text='<%# Bind("strWaterOdorOther") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Surface Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWaterSurfaceOils" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterSurfOils") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Slick" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sheen" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Globs" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Flecks" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Surface Oils</td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblWaterSurfOilsOther" runat="server" Text='<%# Bind("strWaterSurfOilsOther") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Turbidity <small>(If Not Measured)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQTurbidity" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intTurbNotMeas") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other (Turbidity)</td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblTurbNotMeasOther" runat="server" Text='<%# Bind("strTurbNotMeasOther") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditWQS" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
						        <EditItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQTempC" runat="server" Text='<%# Bind("decWQTempC") %>' size="10" required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQTempC" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQSpecCond" runat="server" Text='<%# Bind("decWQSpecCond") %>' size="10" required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQSpecCond" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQDO" runat="server" Text='<%# Bind("decWQDO") %>' size="10" required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQDO" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQpH" runat="server" Text='<%# Bind("decWQpH") %>' size="10" required></asp:TextBox><br />
                                                            <asp:RangeValidator runat="server" 
                                                                ControlToValidate="txtWQpH"
                                                                ValidationGroup="WaterQualitySec" 
                                                                ForeColor="Red"
                                                                ErrorMessage="Must be a number between 0 and 14" 
                                                                Type="Integer"
                                                                MaximumValue="14" 
                                                                MinimumValue="0" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQTurbid" runat="server" Text='<%# Bind("decWQTurbid") %>' size="10" required></asp:TextBox><br />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQTurbid" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQInstrUsed" runat="server" Text='<%# Bind("strWQInstrUsed") %>' size="10" required></asp:TextBox><br />
                                                        </td>
                                                    </tr>
							                        <tr>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Temperature (&#176;C)</small></td>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Specific Conductance</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Dissolved Oxygen</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>pH</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Trubidity</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>WQ Instrument Used</small></td>
							                        </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQWaterOdors" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterOdor") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Normal&#47;None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Fish" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtOtherWaterOdor" runat="server" Text='<%# Bind("strWaterOdorOther") %>' size="80"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Surface Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWaterSurfaceOils" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterSurfOils") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Slick" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sheen" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Globs" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Flecks" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Surface Oils</td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtWaterSurfOilsOther" runat="server" Text='<%# Bind("strWaterSurfOilsOther") %>' size="80"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Turbidity <small>(If Not Measured)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQTurbidity" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intTurbNotMeas") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other (Turbidity)</td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtTurbNotMeasOther" runat="server" Text='<%# Bind("strTurbNotMeasOther") %>' Columns="110" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                                        </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateWQS" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="WaterQualitySec" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelWQS" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
						        </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td>
                                                <table class="mx-auto w-100 table-sm">
                                                    <tr>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQTempC" runat="server" Text='<%# Bind("decWQTempC") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQTempC" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQTempC" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQSpecCond" runat="server" Text='<%# Bind("decWQSpecCond") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQSpecCond" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQSpecCond" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQDO" runat="server" Text='<%# Bind("decWQDO") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQDO" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQDO" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQpH" runat="server" Text='<%# Bind("decWQpH") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQpH" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQpH" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary">
                                                            <asp:TextBox ID="txtWQTurbid" runat="server" Text='<%# Bind("decWQTurbid") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQTurbid" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                            <asp:CompareValidator runat="server" 
                                                                ControlToValidate="txtWQTurbid" 
                                                                Type="Double"
                                                                ForeColor="Red" 
                                                                Operator="DataTypeCheck" 
                                                                ErrorMessage="Value must be numeric"
                                                                ValidationGroup="WaterQualitySec" />
                                                        </td>
                                                        <td class="border-top border-left border-right border-secondary align-top">
                                                            <asp:TextBox ID="txtWQInstrUsed" runat="server" Text='<%# Bind("strWQInstrUsed") %>' size="10"></asp:TextBox><br />
						                                    <asp:RequiredFieldValidator 
							                                    runat="server" 
							                                    ControlToValidate="txtWQInstrUsed" 
							                                    ValidationGroup="WaterQualitySec"
							                                    ForeColor="Red"
							                                    ErrorMessage="Required" />
                                                        </td>
                                                    </tr>
							                        <tr>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Temperature (&#176;C)</small></td>
								                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Specific Conductance</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Dissolved Oxygen</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>pH</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>Trubidity</small></td>
                                                        <td class="bg-light text-muted border-bottom border-left border-right border-secondary"><small>WQ Instrument Used</small></td>
							                        </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQWaterOdors" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterOdor") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Normal&#47;None" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Fish" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWQWaterOdors" 
							                        ValidationGroup="WaterQualitySec"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtOtherWaterOdor" runat="server" Text='<%# Bind("strWaterOdorOther") %>' size="80"></asp:TextBox><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Water Surface Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWaterSurfaceOils" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intWaterSurfOils") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Slick" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sheen" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Globs" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Flecks" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWaterSurfaceOils" 
							                        ValidationGroup="WaterQualitySec"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Surface Oils</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtWaterSurfOilsOther" runat="server" Text='<%# Bind("strWaterSurfOilsOther") %>' size="80"></asp:TextBox><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Turbidity <small>(If Not Measured)</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQTurbidity" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intTurbNotMeas") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWQTurbidity" 
							                        ValidationGroup="WaterQualitySec"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other (Turbidity)</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtTurbNotMeasOther" runat="server" Text='<%# Bind("strTurbNotMeasOther") %>' Columns="110" Rows="5" TextMode="MultiLine"></asp:TextBox><br />
                                            </td>
                                        </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewWQ2" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="WaterQualitySec" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Water Quality: End -->
                    <!-- Sediment/Substrate: Start -->
                    <!--########################################################-->
                    <div id="colWQSedSub" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Sediment&#47;Substrate
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQSedSub" 
                                runat="server" 
                                OnModeChanging="fvWQSedSub_ModeChanging" 
                                OnItemUpdating="fvWQSedSub_ItemUpdating" 
                                OnItemInserting="fvWQSedSub_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubOdors" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOdors") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Anaerobic" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblSedSubOdorsOther" runat="server" Text='<%# Bind("strSedSubOdorsOther") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Deposits</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubDeposits" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubDeposits") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Sludge" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sawdust" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Paper Fiber" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Sand" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Relict Shells" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Deposits</td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblSedSubDeposits" runat="server" Text='<%# Bind("strSedSubDepositsOther") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQOils" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOils") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Looking at stones which are not deeply embedded, are the undersides black in color?</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblSedSubStones" 
                                                    runat="server" 
                                                    Enabled="false" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubStones") %>' 
                                                    Width="100%">
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditSSub" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
						        <EditItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubOdors" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOdors") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Anaerobic" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtSedSubOdorsOther" runat="server" Text='<%# Bind("strSedSubOdorsOther") %>' Size="110" required></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Deposits</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubDeposits" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubDeposits") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Sludge" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sawdust" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Paper Fiber" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Sand" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Relict Shells" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Deposits</td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="txtSedSubDeposits" runat="server" Text='<%# Bind("strSedSubDepositsOther") %>' Size="110" required></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQOils" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOils") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Looking at stones which are not deeply embedded, are the undersides black in color?</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblSedSubStones" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubStones") %>' 
                                                    Width="100%" 
                                                    required>
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateSSub" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelSSub" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
						        </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="mx-auto w-100 table-sm table-bordered">
                                        <tr>
                                            <td class="bg-light"><strong>Odors</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubOdors" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOdors") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sewage" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Petroleum" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Chemical" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Anaerobic" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="None" Value="6"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWQSedSubOdors" 
							                        ValidationGroup="SedSub"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Water Odors</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSedSubOdorsOther" runat="server" Text='<%# Bind("strSedSubOdorsOther") %>' Size="110"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Deposits</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQSedSubDeposits" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubDeposits") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Sludge" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Sawdust" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Paper Fiber" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Sand" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Relict Shells" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWQSedSubDeposits" 
							                        ValidationGroup="SedSub"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Other Deposits</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSedSubDeposits" runat="server" Text='<%# Bind("strSedSubDepositsOther") %>' Size="110"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>Oils</strong></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblWQOils" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubOils") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Clear" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Slightly Turbid" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Turbid" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Opaque" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Stained" Value="5"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblWQOils" 
							                        ValidationGroup="SedSub"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">Looking at stones which are not deeply embedded, are the undersides black in color?</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="rblSedSubStones" 
                                                    runat="server" 
                                                    RepeatDirection="Horizontal" 
                                                    SelectedValue='<%# Bind("intSedSubStones") %>' 
                                                    Width="100%" >
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator 
							                        runat="server" 
							                        ControlToValidate="rblSedSubStones" 
							                        ValidationGroup="SedSub"
							                        ForeColor="Red"
							                        ErrorMessage="Required" />
                                            </td>
                                        </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewSED" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="SedSub" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Sediment/Substrate: End -->
                    <!-- Inorganic Substrate Components: Start -->
                    <!--########################################################-->
                    <div id="colWQInorgSub" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Inorganic Substrate Components
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQInorgSubCom" 
                                runat="server" 
                                OnModeChanging="fvWQInorgSubCom_ModeChanging" 
                                OnItemUpdating="fvWQInorgSubCom_ItemUpdating" 
                                OnItemInserting="fvWQInorgSubCom_ItemInserting" 
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="w-100">
                                    <tr>
                                        <td class="bg-light"><strong>Substrate Type</strong></td>
                                        <td class="bg-light"><strong>Diameter</strong></td>
                                        <td class="bg-light"><strong>&#37; Composition in Sampling Reach</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Bedrock</td>
                                        <td>&nbsp;</td>
                                        <td align="right"><asp:Label ID="lblISCBedrock" runat="server" Text='<%# Bind("decISCBedrock") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Boulder</td>
                                        <td>&gt;256mm (10&#34;)</td>
                                        <td align="right"><asp:Label ID="lblISCBoulder" runat="server" Text='<%# Bind("decISCBoulder") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Cobble</td>
                                        <td>64-256mm (2.5&#34;-10&#34;)</td>
                                        <td align="right"><asp:Label ID="lblISCCobble" runat="server" Text='<%# Bind("decISCCobble") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Gravel</td>
                                        <td>2-64mm (0.1&#34; - 2.5&#34;)</td>
                                        <td align="right"><asp:Label ID="lblGravel" runat="server" Text='<%# Bind("decISCGravel") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Sand</td>
                                        <td>0.06-2mm (gritty)</td>
                                        <td align="right"><asp:Label ID="lblISCSand" runat="server" Text='<%# Bind("decISCSand") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Silt</td>
                                        <td>0.004-.06mm</td>
                                        <td align="right"><asp:Label ID="lblISCSilt" runat="server" Text='<%# Bind("decISCSilt") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Clay</td>
                                        <td>&lt; 0.004mm (slick)</td>
                                        <td align="right"><asp:Label ID="lblISCClay" runat="server" Text='<%# Bind("decISCClay") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light" align="right"><asp:Label ID="lblISCIonrgSubCalComp" runat="server" Text='<%# Bind("decISCInorgSubCalComp")%>'></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                                <table class="mx-auto">
							        <tr>
                                        <td align="center"><asp:LinkButton ID="lbEditISC" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                    <table class="w-100">
                                    <tr>
                                        <td class="bg-light"><strong>Substrate Type</strong></td>
                                        <td class="bg-light"><strong>Diameter</strong></td>
                                        <td class="bg-light"><strong>&#37; Composition in Sampling Reach</strong></td>
                                    </tr>
                                    <tr>
                                        <td>Bedrock</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:TextBox ID="txtISCBedrock" runat="server" Text='<%# Bind("decISCBedrock") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCBedrock" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Boulder</td>
                                        <td>&gt;256mm (10&#34;)</td>
                                        <td>
                                            <asp:TextBox ID="txtISCBoulder" runat="server" Text='<%# Bind("decISCBoulder") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCBoulder" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cobble</td>
                                        <td>64-256mm (2.5&#34;-10&#34;)</td>
                                        <td>
                                            <asp:TextBox ID="txtISCCobble" runat="server" Text='<%# Bind("decISCCobble") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCCobble" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Gravel</td>
                                        <td>2-64mm (0.1&#34; - 2.5&#34;)</td>
                                        <td>
                                            <asp:TextBox ID="txtGravel" runat="server" Text='<%# Bind("decISCGravel") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtGravel" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Sand</td>
                                        <td>0.06-2mm (gritty)</td>
                                        <td>
                                            <asp:TextBox ID="txtISCSand" runat="server" Text='<%# Bind("decISCSand") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCSand" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Silt</td>
                                        <td>0.004-.06mm</td>
                                        <td>
                                            <asp:TextBox ID="txtISCSilt" runat="server" Text='<%# Bind("decISCSilt") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCSilt" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Clay</td>
                                        <td>&lt; 0.004mm (slick)</td>
                                        <td>
                                            <asp:TextBox ID="txtISCClay" runat="server" Text='<%# Bind("decISCClay") %>' OnBlur="CalcWQInorgSub()"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCClay" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">
                                            <asp:TextBox ID="txtISCInorgSubCalComp" runat="server" Text='<%# Bind("decISCInorgSubCalComp") %>' Enabled="false" ReadOnly="true"></asp:TextBox>
									        <asp:RequiredFieldValidator 
										        runat="server" 
										        ControlToValidate="txtISCInorgSubCalComp" 
										        ValidationGroup="InorgSubCom"
										        ForeColor="Red"
										        ErrorMessage="Required" />
                                            <br />
                                            <asp:RangeValidator runat="server" 
                                                ControlToValidate="txtISCInorgSubCalComp"
                                                ValidationGroup="InorgSubCom" 
                                                ForeColor="Red"
                                                ErrorMessage="Must add up to 100%" 
                                                MaximumValue="100.0000" 
                                                MinimumValue="100.0000" />
                                        </td>
                                    </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateISC" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="InorgSubCom" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelISC" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <table class="w-100">
                                <tr>
                                    <td class="bg-light"><strong>Substrate Type</strong></td>
                                    <td class="bg-light"><strong>Diameter</strong></td>
                                    <td class="bg-light"><strong>&#37; Composition in Sampling Reach</strong></td>
                                </tr>
                                <tr>
                                    <td>Bedrock</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="txtISCBedrock" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCBedrock" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Boulder</td>
                                    <td>&gt;256mm (10&#34;)</td>
                                    <td>
                                        <asp:TextBox ID="txtISCBoulder" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCBoulder" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cobble</td>
                                    <td>64-256mm (2.5&#34;-10&#34;)</td>
                                    <td>
                                        <asp:TextBox ID="txtISCCobble" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCCobble" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gravel</td>
                                    <td>2-64mm (0.1&#34; - 2.5&#34;)</td>
                                    <td>
                                        <asp:TextBox ID="txtGravel" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtGravel" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Sand</td>
                                    <td>0.06-2mm (gritty)</td>
                                    <td>
                                        <asp:TextBox ID="txtISCSand" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCSand" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Silt</td>
                                    <td>0.004-.06mm</td>
                                    <td>
                                        <asp:TextBox ID="txtISCSilt" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCSilt" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Clay</td>
                                    <td>&lt; 0.004mm (slick)</td>
                                    <td>
                                        <asp:TextBox ID="txtISCClay" runat="server" Text="0" OnBlur="CalcWQInorgSub()"></asp:TextBox>
								        <asp:RequiredFieldValidator 
									        runat="server" 
									        ControlToValidate="txtISCClay" 
									        ValidationGroup="InorgSubCom"
									        ForeColor="Red"
									        ErrorMessage="Required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">&nbsp;</td>
                                    <td class="bg-light">&nbsp;</td>
                                    <td class="bg-light">
                                        <asp:Label ID="lblISCInorgSubCalComp" runat="server"></asp:Label>
                                        <asp:CustomValidator 
                                            runat="server" 
                                            ErrorMessage="Must add up to 100%"
                                            ForeColor="Red"
                                            ClientValidationFunction="ValWQInorgSub" 
                                            ValidationGroup="InorgSubCom" />
                                    </td>
                                </tr>
                                </table>
						        <br />
					            <table class="w-100">
					            <tr>
						            <td align="center" colspan="3">
						            </td>
					            </tr>
					            </table>
                            </InsertItemTemplate>
                        </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Inorganic Substrate Components: End -->
                    <!-- Organic Substrate Components: Start -->
                    <!--########################################################-->
                    <div id="colWQOrgSub" class="collapse">
                        <div class="alert alert-dark" role="alert">
                           Organic Substrate Components
                        </div>
                        <div class="">
                            <asp:FormView ID="fvWQOrgSubCom" 
                                runat="server" 
                                OnModeChanging="fvWQOrgSubCom_ModeChanging" 
                                OnItemUpdating="fvWQOrgSubCom_ItemUpdating" 
                                OnItemInserting="fvWQOrgSubCom_ItemInserting"
                                BackColor="White" 
                                BorderColor="#999999" 
                                BorderStyle="Solid" 
                                BorderWidth="1px" 
                                CellPadding="3" 
                                ForeColor="Black" 
                                GridLines="Vertical" 
                                Width="700px">
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <table class="w-100">
                                    <tr>
                                        <td class="bg-light"><strong>Substrate Type</strong></td>
                                        <td class="bg-light"><strong>Characteristic</strong></td>
                                        <td class="bg-light" align="right"><strong>&#37; Composition in Sampling Reach</strong></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Detritus</td>
                                        <td valign="top">Sticks, wood, coarse plant materials (CPOM)</td>
                                        <td valign="top" align="right"><asp:Label ID="lblOSCDetritus" runat="server" Text='<%# Bind("decOCSPctDetritus") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Muck-Mud</td>
                                        <td valign="top">Black, very fine organic (FPOM)</td>
                                        <td valign="top" align="right"><asp:Label ID="lblOSCMuckMud" runat="server" Text='<%# Bind("decOCSPctMuckMud") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Marl</td>
                                        <td valign="top">Grey, shell fragments</td>
                                        <td valign="top" align="right"><asp:Label ID="lblOSCMarl" runat="server" Text='<%# Bind("decOCSPctMarl") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light" align="right">
                                            <asp:Label ID="lblOSCOrgSubCalComp" runat="server" Text='<%# Bind("decOCSOrgSubCalComp") %>' Font-Bold="true"></asp:Label><br />
                                            <small class="text-muted">Does not necessarily add up to 100&#37;</small>
                                        </td>
                                    </tr>
                                    </table>
                                    <br />
                                    <table class="mx-auto w-100">
							            <tr>
                                            <td align="center"><asp:LinkButton ID="lbEditOSC" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-secondary btn-sm"></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table class="w-100">
                                    <tr>
                                        <td class="bg-light"><strong>Substrate Type</strong></td>
                                        <td class="bg-light"><strong>Characteristic</strong></td>
                                        <td class="bg-light"><strong>&#37; Composition in Sampling Reach</strong></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Detritus</td>
                                        <td valign="top">Sticks, wood, coarse plant materials (CPOM)</td>
                                        <td valign="top"><asp:TextBox ID="txtOSCDetritus" runat="server" Text='<%# Bind("decOCSPctDetritus") %>' OnBlur="CalcWQOrgSub()"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Muck-Mud</td>
                                        <td valign="top">Black, very fine organic (FPOM)</td>
                                        <td valign="top"><asp:TextBox ID="txtOSCMuckMud" runat="server" Text='<%# Bind("decOCSPctMuckMud") %>' OnBlur="CalcWQOrgSub()"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Marl</td>
                                        <td valign="top">Grey, shell fragments</td>
                                        <td valign="top"><asp:TextBox ID="txtOSCMarl" runat="server" Text='<%# Bind("decOCSPctMarl") %>' OnBlur="CalcWQOrgSub()"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">
                                            <asp:TextBox ID="txtOSCOrgSubCalCompEdit" runat="server" Text='<%# Bind("decOCSOrgSubCalComp") %>' ReadOnly="true"></asp:TextBox>
                                            <br />
                                            <small class="text-muted">Does not necessarily add up to 100&#37;</small>
                                        </td>
                                    </tr>
                                    </table>
						            <br />
                                    <table class="w-100">
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnUpdateOSC" runat="server" Text="Update" CommandName="Update" CausesValidation="true" class="btn btn-secondary btn-sm" />
                                            <asp:Button ID="btnCancelOSC" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" class="btn btn-secondary btn-sm" />
                                        </td>
                                    </tr>
                                    </table>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table class="w-100">
                                    <tr>
                                        <td class="bg-light"><strong>Substrate Type</strong></td>
                                        <td class="bg-light"><strong>Characteristic</strong></td>
                                        <td class="bg-light"><strong>&#37; Composition in Sampling Reach</strong></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Detritus</td>
                                        <td valign="top">Sticks, wood, coarse plant materials (CPOM)</td>
                                        <td valign="top">
                                            <asp:TextBox ID="txtOSCDetritus" runat="server" OnBlur="CalcWQOrgSub()"></asp:TextBox>
								            <asp:RequiredFieldValidator 
									            runat="server" 
									            ControlToValidate="txtOSCDetritus" 
									            ValidationGroup="OrgSubCom"
									            ForeColor="Red"
									            ErrorMessage="Required" />
                                            <asp:RangeValidator runat="server" 
                                                ControlToValidate="txtOSCDetritus"
                                                ValidationGroup="OrgSubCom" 
                                                ForeColor="Red"
                                                ErrorMessage="Must be a number between 0 and 100" 
                                                MaximumValue="100" 
                                                MinimumValue="0" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Muck-Mud</td>
                                        <td valign="top">Black, very fine organic (FPOM)</td>
                                        <td valign="top">
                                            <asp:TextBox ID="txtOSCMuckMud" runat="server" OnBlur="CalcWQOrgSub()"></asp:TextBox>
								            <asp:RequiredFieldValidator 
									            runat="server" 
									            ControlToValidate="txtOSCMuckMud" 
									            ValidationGroup="OrgSubCom"
									            ForeColor="Red"
									            ErrorMessage="Required" />
                                            <asp:RangeValidator runat="server" 
                                                ControlToValidate="txtOSCMuckMud"
                                                ValidationGroup="OrgSubCom" 
                                                ForeColor="Red"
                                                ErrorMessage="Must be a number between 0 and 100" 
                                                MaximumValue="100" 
                                                MinimumValue="0" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">Marl</td>
                                        <td valign="top">Grey, shell fragments</td>
                                        <td valign="top">
                                            <asp:TextBox ID="txtOSCMarl" runat="server" OnBlur="CalcWQOrgSub()"></asp:TextBox>
								            <asp:RequiredFieldValidator 
									            runat="server" 
									            ControlToValidate="txtOSCMarl" 
									            ValidationGroup="OrgSubCom"
									            ForeColor="Red"
									            ErrorMessage="Required" />
                                            <asp:RangeValidator runat="server" 
                                                ControlToValidate="txtOSCMarl"
                                                ValidationGroup="OrgSubCom" 
                                                ForeColor="Red"
                                                ErrorMessage="Must be a number between 0 and 100" 
                                                MaximumValue="100" 
                                                MinimumValue="0" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">&nbsp;</td>
                                        <td class="bg-light">
                                            <asp:Label ID="lblOSCOrgSubCalCompEdit" runat="server" Text='<%# Bind("decOSCOrgSubCal") %>' Font-Bold="true"></asp:Label><br />
                                            <small class="text-muted">Does not necessarily add up to 100&#37;</small>
                                        </td>
                                    </tr>
                                    </table>
						            <br />
					                <table class="w-100">
					                <tr>
						                <td align="center" colspan="3">
							                <asp:Button ID="btnInsertNewOSC" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="OrgSubCom" class="btn btn-secondary btn-sm" />
						                </td>
					                </tr>
					                </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                    <!--########################################################-->
                    <!-- Organic Substrate Components: End -->
                    <!--########################################################-->
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfAccordionIndex" runat="server" />
    <asp:HiddenField ID="hfActiveDiv" runat="server" />
    <script type="text/javascript">
        $(".btn-group-vertical > .btn").click(function () {
            $(".btn-group-vertical > .btn").removeClass("active");
            $(this).addClass("active");
        });
        function SetActive(divCurrent)
        {
            var divPrevious = $("#<%=hfAccordionIndex.ClientID%>").val();

            if (divPrevious == null || divPrevious == "") {
                divPrevious = "colWQSurveyInfo";
            }

            if (divPrevious != divCurrent) {
                $("#" + divPrevious).collapse('hide');
            }

            $("#" + divCurrent).collapse('show');

            $("#<%=hfAccordionIndex.ClientID%>").val(divCurrent);
        }

        function OpenActive(){
            var activeDiv = $("#<%=hfAccordionIndex.ClientID%>").val();

            if (activeDiv == "") {
                activeDiv = "colWQSurveyInfo";
            }

            $("#" + activeDiv).collapse('show'); 

            $(".btn-group-vertical .btn").removeClass("active");
            $("#btn" + activeDiv.substring(3)).addClass("active");

            if (activeDiv != "colWQSurveyInfo") {
                $("#colWQSurveyInfo").collapse('hide');
            }
        }
        OpenActive();

        function CalcWQInorgSub() {
            var valBedrock = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCBedrock").val());
            var valBoulder = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCBoulder").val());
            var valCobble = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCCobble").val());
            var valGravel = parseFloat($("#cphContent_fvWQInorgSubCom_txtGravel").val());
            var valSand = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCSand").val());
            var valSilt = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCSilt").val());
            var valClay = parseFloat($("#cphContent_fvWQInorgSubCom_txtISCClay").val());

            var intInogSubPct = valBedrock + valBoulder + valCobble + valGravel + valSand + valSilt + valClay;
            var pos = String(intInogSubPct).indexOf(".");

            if (pos === -1) {
                intInogSubPct += ".0000";
            }
            $("#cphContent_fvWQInorgSubCom_txtISCInorgSubCalComp").val(intInogSubPct);
        }

        function ValWQInorgSub(oSrc, args) {
            var strISCInorgSubCalComp = $("#cphContent_fvWQInorgSubCom_txtISCInorgSubCalComp").val();
            strISCInorgSubCalComp = strISCInorgSubCalComp.substring(0, strISCInorgSubCalComp.length - 1);

            if (strISCInorgSubCalComp != 100) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

        function CalcWQOrgSub() {
            var valDetritus = parseFloat($("#cphContent_fvWQOrgSubCom_txtOSCDetritus").val());
            var valMuckMud = parseFloat($("#cphContent_fvWQOrgSubCom_txtOSCMuckMud").val());
            var valMarl = parseFloat($("#cphContent_fvWQOrgSubCom_txtOSCMarl").val());

            var intOgSubPct = valDetritus + valMuckMud + valMarl;
            var pos = String(intOgSubPct).indexOf(".");

            if (pos === -1) {
                intOgSubPct += ".0000";
            }

            $("#cphContent_fvWQOrgSubCom_txtOSCOrgSubCalCompEdit").val(intOgSubPct);
        }

        function ValidationOff() {
            alert("ValidationOff()");
        }
    </script>
</asp:Content>
