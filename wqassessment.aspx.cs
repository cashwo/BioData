#region namespaces
using System;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Core.Data.BioData.Models;
using Core.Data.BioData.Models.WaterQuality;
#endregion

namespace BioData
{
    public partial class wqassessment : System.Web.UI.Page
    {
        #region Class Variables
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BioData"].ConnectionString);
        private BioDataCore db = new BioDataCore();
        private clsAppFunc objAppFunc = new clsAppFunc();
        #endregion

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                int intWaterQualityID = 0;

                if (Session["wqid"] != null)
                {
                    intWaterQualityID = Int32.Parse(Session["wqid"].ToString());
                }
                else if(String.IsNullOrEmpty(Request.QueryString["wqid"]) == false)
                {
                    intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);
                }

                int intStationID = Int32.Parse(Request.QueryString["sid"]);
                clsAppFunc objAppFunc = new clsAppFunc();
                int intInitInsert;

                intInitInsert = WQSurveyInfoBind(intWaterQualityID);

                if (intInitInsert == 0)
                {
                    lblStationNameNum.Text = "<a href='stationinfo.aspx?sid=" + intStationID.ToString() + "'>Water Quality Assessment &#40;" + objAppFunc.GetStationNameNum(intStationID) + "&#41;</a> (Update Assessment)";

                    fvWQWeatherCond.Visible = true;
                    fvWQStreamChar.Visible = true;
                    fvWQWatershedFeat.Visible = true;
                    fvRipVeg.Visible = true;
                    fvInstreamFeat.Visible = true;
                    fvWQLargeWoodyDebris.Visible = true;
                    fvWQAquaticVeg.Visible = true;
                    fvWQWaterQuality.Visible = true;
                    fvWQSedSub.Visible = true;
                    fvWQInorgSubCom.Visible = true;
                    fvWQOrgSubCom.Visible = true;

                    lblInsertAlert.Visible = false;
                }
                else if (intInitInsert == 1)
                {
                    lblStationNameNum.Text = "<a href='stationinfo.aspx?sid=" + intStationID.ToString() + "'>Water Quality Assessment &#40;" + objAppFunc.GetStationNameNum(intStationID) + "&#41;</a> (Add New Assessment)";

                    fvWQWeatherCond.Visible = false;
                    fvWQStreamChar.Visible = false;
                    fvWQWatershedFeat.Visible = false;
                    fvRipVeg.Visible = false;
                    fvInstreamFeat.Visible = false;
                    fvWQLargeWoodyDebris.Visible = false;
                    fvWQAquaticVeg.Visible = false;
                    fvWQWaterQuality.Visible = false;
                    fvWQSedSub.Visible = false;
                    fvWQInorgSubCom.Visible = false;
                    fvWQOrgSubCom.Visible = false;

                    lblInsertAlert.Visible = true;
                }

                WQWeatherCondBind(intWaterQualityID);
                WQStreamChar(intWaterQualityID);
                WQWatershedFeat(intWaterQualityID);
                WQRipVeg(intWaterQualityID);
                WQInstreamFeat(intWaterQualityID);
                WQLargeWoodyDebris(intWaterQualityID);
                WQAquaticVeg(intWaterQualityID);
                WQWaterQuality(intWaterQualityID);
                WQSedSub(intWaterQualityID);
                WQInorgSubCom(intWaterQualityID);
                WQOrgSubCom(intWaterQualityID);
            }
        }
        #endregion

        #region WQSurveyInfoBind()
        protected int WQSurveyInfoBind(int intWQID)
        {
            int intRetVal = 0;

            if (intWQID > 0)
            {
                int intStationID = Int32.Parse(Request.QueryString["sid"]);
                string strStationID = Request.QueryString["sid"];

                var qryWQSurveyInfo = db.tblWQSurveyInfo
                    .Where(s => s.intWQID == intWQID)
                    .OrderBy(o => o.dtmSurveyInfoDT);

                fvWQSurveyInfo.DataSource = qryWQSurveyInfo.ToList();
                fvWQSurveyInfo.DataBind();

                if (qryWQSurveyInfo.Any())
                {
                    intRetVal = 0;
                }
                else
                {
                    intRetVal = 1;
                }

                LinkButton objEditSRV = fvWQSurveyInfo.FindControl("lbEditSRV") as LinkButton;

                int intUserRole = Convert.ToInt32(Session["roleID"]);
                if (objEditSRV != null)
                {
                    if (intUserRole != 1)
                    {
                        objEditSRV.Visible = false;
                    }
                    else
                    {
                        objEditSRV.Visible = true;
                    }
                }
            }
            else
            {
                fvWQSurveyInfo.DefaultMode = FormViewMode.Insert;
                intRetVal = 1;
            }
            return intRetVal;
        }
        #endregion

        #region WQWeatherCondBind()
        protected void WQWeatherCondBind(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQWeatherConds = db.tblWQWeatherConds
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQWeatherConds.Any())
                {
                    fvWQWeatherCond.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQWeatherCond.DataSource = qryWQWeatherConds;
                    fvWQWeatherCond.DataBind();

                    LinkButton objEditWQ = fvWQWeatherCond.FindControl("lbEditWQ") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);
                    if (objEditWQ != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditWQ.Visible = false;
                        }
                        else
                        {
                            objEditWQ.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQWeatherCond.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQStreamChar()
        protected void WQStreamChar(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQStreamChars = db.tblWQStreamChars
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQStreamChars.Any())
                {
                    fvWQStreamChar.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQStreamChar.DataSource = qryWQStreamChars;
                    fvWQStreamChar.DataBind();

                    LinkButton objEditSC = fvWQStreamChar.FindControl("lbEditSC") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);
                    if (objEditSC != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditSC.Visible = false;
                        }
                        else
                        {
                            objEditSC.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQStreamChar.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQWatershedFeat()
        protected void WQWatershedFeat(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQWatershedFeats = db.tblWQWatershedFeats
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQWatershedFeats.Any())
                {
                    fvWQWatershedFeat.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQWatershedFeat.DataSource = qryWQWatershedFeats;
                    fvWQWatershedFeat.DataBind();

                    LinkButton objEditWF = fvWQWatershedFeat.FindControl("lbEditWF") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditWF != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditWF.Visible = false;
                        }
                        else
                        {
                            objEditWF.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQWatershedFeat.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQRipVeg()
        protected void WQRipVeg(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQWQRipVegs = db.tblWQRipVegs
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQWQRipVegs.Any())
                {
                    fvRipVeg.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvRipVeg.DataSource = qryWQWQRipVegs;
                    fvRipVeg.DataBind();

                    LinkButton objEditRV = fvRipVeg.FindControl("lbEditRV") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditRV != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditRV.Visible = false;
                        }
                        else
                        {
                            objEditRV.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvRipVeg.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQInstreamFeat()
        protected void WQInstreamFeat(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQInstreamFeats = db.tblWQInstreamFeats
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQInstreamFeats.Any())
                {
                    fvInstreamFeat.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvInstreamFeat.DataSource = qryWQInstreamFeats;
                    fvInstreamFeat.DataBind();

                    LinkButton objEditISF = fvInstreamFeat.FindControl("lbEditISF") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditISF != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditISF.Visible = false;
                        }
                        else
                        {
                            objEditISF.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvInstreamFeat.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQLargeWoodyDebris()
        protected void WQLargeWoodyDebris(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQLargeWoodyDebris = db.tblWQLargeWoodyDebris
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQLargeWoodyDebris.Any())
                {
                    fvWQLargeWoodyDebris.DefaultMode = FormViewMode.Insert;
                }
                else
                {

                    fvWQLargeWoodyDebris.DataSource = qryWQLargeWoodyDebris;
                    fvWQLargeWoodyDebris.DataBind();

                    LinkButton objEditWD = fvWQLargeWoodyDebris.FindControl("lbEditLWD") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditWD != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditWD.Visible = false;
                        }
                        else
                        {
                            objEditWD.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQLargeWoodyDebris.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQAquaticVeg()
        protected void WQAquaticVeg(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQAquaticVegs = db.tblWQAquaticVegs
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQAquaticVegs.Any())
                {
                    fvWQAquaticVeg.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQAquaticVeg.DataSource = qryWQAquaticVegs;
                    fvWQAquaticVeg.DataBind();

                    LinkButton objEditAV = fvWQAquaticVeg.FindControl("lbEditAV") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditAV != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditAV.Visible = false;
                        }
                        else
                        {
                            objEditAV.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQAquaticVeg.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQWaterQuality()
        protected void WQWaterQuality(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQWaterQualities = db.tblWQWaterQualities
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQWaterQualities.Any())
                {
                    fvWQWaterQuality.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQWaterQuality.DataSource = qryWQWaterQualities;
                    fvWQWaterQuality.DataBind();

                    LinkButton objEditWQS = fvWQWaterQuality.FindControl("lbEditWQS") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditWQS != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditWQS.Visible = false;
                        }
                        else
                        {
                            objEditWQS.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQWaterQuality.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQSedSub()
        protected void WQSedSub(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQSedimentSubs = db.tblWQSedimentSubs
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQSedimentSubs.Any())
                {
                    fvWQSedSub.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQSedSub.DataSource = qryWQSedimentSubs;
                    fvWQSedSub.DataBind();

                    LinkButton objEditSSub = fvWQSedSub.FindControl("lbEditSSub") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditSSub != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditSSub.Visible = false;
                        }
                        else
                        {
                            objEditSSub.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQSedSub.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQInorgSubCom()
        protected void WQInorgSubCom(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQInorgSubComps = db.tblWQInorgSubComps
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQInorgSubComps.Any())
                {
                    fvWQInorgSubCom.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQInorgSubCom.DataSource = qryWQInorgSubComps;
                    fvWQInorgSubCom.DataBind();

                    LinkButton objEditISC = fvWQInorgSubCom.FindControl("lbEditISC") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditISC != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditISC.Visible = false;
                        }
                        else
                        {
                            objEditISC.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQInorgSubCom.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        #region WQOrgSubCom()
        protected void WQOrgSubCom(int intWQID)
        {
            if (intWQID > 0)
            {
                var qryWQOrgSubComps = db.tblWQOrgSubComps
                    .Where(s => s.intWQID == intWQID).ToList();

                if (!qryWQOrgSubComps.Any())
                {
                    fvWQOrgSubCom.DefaultMode = FormViewMode.Insert;
                }
                else
                {
                    fvWQOrgSubCom.DataSource = qryWQOrgSubComps;
                    fvWQOrgSubCom.DataBind();

                    LinkButton objEditOSC = fvWQOrgSubCom.FindControl("lbEditOSC") as LinkButton;

                    int intUserRole = Convert.ToInt32(Session["roleID"]);

                    if (objEditOSC != null)
                    {
                        if (intUserRole != 1)
                        {
                            objEditOSC.Visible = false;
                        }
                        else
                        {
                            objEditOSC.Visible = true;
                        }
                    }
                }
            }
            else
            {
                fvWQOrgSubCom.DefaultMode = FormViewMode.Insert;
            }
        }
        #endregion

        //#############################################################
        //ModeChanging
        //#############################################################

        #region fvWQSurveyInfo_ModeChanging()
        protected void fvWQSurveyInfo_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQSurveyInfo.ChangeMode(e.NewMode);
            WQSurveyInfoBind(intWaterQualityID);
        }
        #endregion

        #region fvWQWeatherCond_ModeChanging()
            protected void fvWQWeatherCond_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQWeatherCond.ChangeMode(e.NewMode);
            WQWeatherCondBind(intWaterQualityID);
        }
        #endregion

        #region fvWQStreamChar_ModeChanging()
        protected void fvWQStreamChar_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQStreamChar.ChangeMode(e.NewMode);
            WQStreamChar(intWaterQualityID);
        }
        #endregion

        #region fvWQWatershedFeat_ModeChanging()
        protected void fvWQWatershedFeat_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQWatershedFeat.ChangeMode(e.NewMode);
            WQWatershedFeat(intWaterQualityID);
        }
        #endregion

        #region fvRipVeg_ModeChanging()
        protected void fvRipVeg_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvRipVeg.ChangeMode(e.NewMode);
            WQRipVeg(intWaterQualityID);
        }
        #endregion

        #region fvInstreamFeat_ModeChanging()
        protected void fvInstreamFeat_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvInstreamFeat.ChangeMode(e.NewMode);
            WQInstreamFeat(intWaterQualityID);
        }
        #endregion

        #region fvWQLargeWoodyDebris_ModeChanging()
        protected void fvWQLargeWoodyDebris_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQLargeWoodyDebris.ChangeMode(e.NewMode);
            WQLargeWoodyDebris(intWaterQualityID);
        }
        #endregion

        #region fvWQAquaticVeg_ModeChanging()
        protected void fvWQAquaticVeg_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQAquaticVeg.ChangeMode(e.NewMode);
            WQAquaticVeg(intWaterQualityID);
        }
        #endregion

        #region fvWQWaterQuality_ModeChanging()
        protected void fvWQWaterQuality_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQWaterQuality.ChangeMode(e.NewMode);
            WQWaterQuality(intWaterQualityID);
        }
        #endregion

        #region fvWQSedSub_ModeChanging()
        protected void fvWQSedSub_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQSedSub.ChangeMode(e.NewMode);
            WQSedSub(intWaterQualityID);
        }
        #endregion

        #region fvWQInorgSubCom_ModeChanging()
        protected void fvWQInorgSubCom_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQInorgSubCom.ChangeMode(e.NewMode);
            WQInorgSubCom(intWaterQualityID);
        }
        #endregion

        #region fvWQOrgSubCom_ModeChanging()
        protected void fvWQOrgSubCom_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            fvWQOrgSubCom.ChangeMode(e.NewMode);
            WQOrgSubCom(intWaterQualityID);
        }
        #endregion

        //#############################################################
        //ItemUpdating
        //#############################################################

        #region fvWQSurveyInfo_ItemUpdating()
        protected void fvWQSurveyInfo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateSurveyInfo = db.tblWQSurveyInfo.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateSurveyInfo != null)
                {
                    TextBox objCompleteDate = fvWQSurveyInfo.FindControl("txtCompleteDate") as TextBox;
                    TextBox objCompleteTime = fvWQSurveyInfo.FindControl("txtCompleteTime") as TextBox;
                    TextBox objStoretNum = fvWQSurveyInfo.FindControl("txtStoretNum") as TextBox;
                    TextBox objInvestigators = fvWQSurveyInfo.FindControl("txtInvestigators") as TextBox;
                    TextBox objSurveyReason = fvWQSurveyInfo.FindControl("txtSurveyReason") as TextBox;

                    DateTime dtCompleteDate = DateTime.Parse(objCompleteDate.Text.ToString());
                    dtCompleteDate = Convert.ToDateTime(dtCompleteDate.ToString("MM/dd/yyyy"));
                    updateSurveyInfo.dtmSurveyInfoDT = dtCompleteDate;

                    TimeSpan dtCompleteTime = TimeSpan.Parse(objCompleteTime.Text.ToString());
                    updateSurveyInfo.dtmSurveyInfoTM = dtCompleteTime;

                    updateSurveyInfo.strSTORET = objStoretNum.Text;
                    updateSurveyInfo.strInvestigators = objInvestigators.Text;
                    updateSurveyInfo.strSurveyReason = objSurveyReason.Text;

                    db.SaveChanges();
                }
            }

            fvWQSurveyInfo.ChangeMode(FormViewMode.ReadOnly);
            WQSurveyInfoBind(intWaterQualityID);
        }
        #endregion

        #region fvWQWeatherCond_ItemUpdating()
        protected void fvWQWeatherCond_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQWeatherConds = db.tblWQWeatherConds.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQWeatherConds != null)
                {
                    RadioButtonList objWQWeatherCondNowRDO = fvWQWeatherCond.FindControl("rblWQWeatherCondNow") as RadioButtonList;
                    RadioButtonList objWQWeatherCond24RDO = fvWQWeatherCond.FindControl("rblWQWeatherCond24") as RadioButtonList;
                    TextBox objWQCloudCoverNowTXT = fvWQWeatherCond.FindControl("txtWQCloudCoverNow") as TextBox;
                    TextBox objWQCloudCover24TXT = fvWQWeatherCond.FindControl("txtWQCloudCover24") as TextBox;
                    RadioButtonList objWQHeavyRainEvt = fvWQWeatherCond.FindControl("rblWQHeavyRainEvt") as RadioButtonList;

                    updateWQWeatherConds.intWeatherCondNow = Int32.Parse(objWQWeatherCondNowRDO.SelectedValue);
                    updateWQWeatherConds.intWeatherCond24 = Int32.Parse(objWQWeatherCond24RDO.SelectedValue);
                    updateWQWeatherConds.decPctCloudCoverNow = Decimal.Parse(objWQCloudCoverNowTXT.Text);
                    updateWQWeatherConds.decPctCloudCover24 = Decimal.Parse(objWQCloudCover24TXT.Text);
                    updateWQWeatherConds.intRainEventLst7 = Int32.Parse(objWQHeavyRainEvt.SelectedValue);

                    db.SaveChanges();
                }
            }

            fvWQWeatherCond.ChangeMode(FormViewMode.ReadOnly);
            WQWeatherCondBind(intWaterQualityID);
        }
        #endregion

        #region fvWQStreamChar_ItemUpdating()
        protected void fvWQStreamChar_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQStreamChars = db.tblWQStreamChars.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQStreamChars != null)
                {
                    RadioButtonList objWQStreamSubsystemRDO = fvWQStreamChar.FindControl("rblWQStreamSubsystem") as RadioButtonList;
                    RadioButtonList objWQStreamOriginRDO = fvWQStreamChar.FindControl("rblWQStreamOrigin") as RadioButtonList;
                    TextBox objWQOtherStreamOrigTXT = fvWQStreamChar.FindControl("txtWQOtherStreamOrig") as TextBox;
                    RadioButtonList objStreamTypeRDO = fvWQStreamChar.FindControl("rblStreamType") as RadioButtonList;
                    TextBox objWQCatchmentAreaTXT = fvWQStreamChar.FindControl("txtWQCatchmentArea") as TextBox;

                    updateWQStreamChars.intStreamSubSys = Int32.Parse(objWQStreamSubsystemRDO.SelectedValue);
                    updateWQStreamChars.intStreamOrigin = Int32.Parse(objWQStreamOriginRDO.SelectedValue);
                    updateWQStreamChars.strStreamOriginOther = objWQOtherStreamOrigTXT.Text;
                    updateWQStreamChars.intStreamType = Int32.Parse(objStreamTypeRDO.SelectedValue);
                    updateWQStreamChars.decCatchmentArea = Decimal.Parse(objWQCatchmentAreaTXT.Text);

                    db.SaveChanges();
                }
            }
             
            fvWQStreamChar.ChangeMode(FormViewMode.ReadOnly);
            WQStreamChar(intWaterQualityID);
        }
        #endregion

        #region fvWQWatershedFeat_ItemUpdating()
        protected void fvWQWatershedFeat_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);
            using (var db = new BioDataCore())
            {
                var updateWQWatershedFeats = db.tblWQWatershedFeats.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQWatershedFeats != null)
                {
                    RadioButtonList objWQLandUseRDO = fvWQWatershedFeat.FindControl("rblWQLandUse") as RadioButtonList;
                    TextBox objWQOtherLandUseTXT = fvWQWatershedFeat.FindControl("txtWQOtherLandUse") as TextBox;
                    RadioButtonList WQNPSPoll = fvWQWatershedFeat.FindControl("rblWQNPSPoll") as RadioButtonList;
                    RadioButtonList objErosionRDO = fvWQWatershedFeat.FindControl("rblErosion") as RadioButtonList;

                    updateWQWatershedFeats.intPredomLandUse = Int32.Parse(objWQLandUseRDO.SelectedValue);
                    updateWQWatershedFeats.strPredomLandUseOther = objWQOtherLandUseTXT.Text;
                    updateWQWatershedFeats.intLocalNPSPol = Int32.Parse(WQNPSPoll.SelectedValue);
                    updateWQWatershedFeats.intLocalWSErosion = Int32.Parse(objErosionRDO.SelectedValue);

                    db.SaveChanges();
                }
            }

            fvWQWatershedFeat.ChangeMode(FormViewMode.ReadOnly);
            WQWatershedFeat(intWaterQualityID);
        }
        #endregion

        #region fvRipVeg_ItemUpdating()
        protected void fvRipVeg_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQRipVegs = db.tblWQRipVegs.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQRipVegs != null)
                {
                    RadioButtonList objWQDomVegRDO = fvRipVeg.FindControl("rblWQDomVeg") as RadioButtonList;
                    TextBox objDomSpeciesRipVegTXT = fvRipVeg.FindControl("txtDomSpeciesRipVeg") as TextBox;

                    updateWQRipVegs.intDomSpeciesPresent = Int32.Parse(objWQDomVegRDO.SelectedValue);
                    updateWQRipVegs.strDomSpeciesPresentLst = objDomSpeciesRipVegTXT.Text;

                    db.SaveChanges();
                }
            }

            fvRipVeg.ChangeMode(FormViewMode.ReadOnly);
            WQRipVeg(intWaterQualityID);
        }
        #endregion

        #region fvInstreamFeat_ItemUpdating()
        protected void fvInstreamFeat_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQInstreamFeats = db.tblWQInstreamFeats.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQInstreamFeats != null)
                {
                    TextBox objEstReachLenTXT = fvInstreamFeat.FindControl("txtEstReachLen") as TextBox;
                    TextBox objEstStreamWdthTXT = fvInstreamFeat.FindControl("txtEstStreamWdth") as TextBox;
                    TextBox objEstStreamAreaTXT = fvInstreamFeat.FindControl("txtEstStreamArea") as TextBox;
                    TextBox objAreaInKMTXT = fvInstreamFeat.FindControl("txtAreaInKM") as TextBox;
                    TextBox objEstStreamDepthTXT = fvInstreamFeat.FindControl("txtlEstStreamDepth") as TextBox;
                    TextBox objSurfVelThalwagTXT = fvInstreamFeat.FindControl("txtSurfVelThalwag") as TextBox;
                    TextBox objHighWaterMrkTXT = fvInstreamFeat.FindControl("txtHighWaterMrk") as TextBox;
                    RadioButtonList objWQCanopyCoverRDO = fvInstreamFeat.FindControl("rblWQCanopyCover") as RadioButtonList;
                    TextBox objRiffleISFTXT = fvInstreamFeat.FindControl("txtRiffleISF") as TextBox;
                    TextBox objRunISFTXT = fvInstreamFeat.FindControl("txtRunISF") as TextBox;
                    TextBox objPoolISFTXT = fvInstreamFeat.FindControl("txtPoolISF") as TextBox;
                    RadioButtonList objWQChannelizedRDO = fvInstreamFeat.FindControl("rblWQChannelized") as RadioButtonList;
                    RadioButtonList objWQDamPresentRDO = fvInstreamFeat.FindControl("rblWQDamPresent") as RadioButtonList;

                    updateWQInstreamFeats.decEstReachLength = Decimal.Parse(objEstReachLenTXT.Text);
                    updateWQInstreamFeats.decEstReachWidth = Decimal.Parse(objEstStreamWdthTXT.Text);
                    updateWQInstreamFeats.decEstReachArea = Decimal.Parse(objEstStreamAreaTXT.Text);
                    updateWQInstreamFeats.decAreaKM = Decimal.Parse(objAreaInKMTXT.Text);
                    updateWQInstreamFeats.decEstReachDepth = Decimal.Parse(objEstStreamDepthTXT.Text);
                    updateWQInstreamFeats.decSurfVelThalwag = Decimal.Parse(objSurfVelThalwagTXT.Text);
                    updateWQInstreamFeats.decHighWaterMark = Decimal.Parse(objHighWaterMrkTXT.Text);
                    updateWQInstreamFeats.intCanopyCover = Int32.Parse(objWQCanopyCoverRDO.SelectedValue);
                    updateWQInstreamFeats.decPMTRiffle = Decimal.Parse(objRiffleISFTXT.Text);
                    updateWQInstreamFeats.decPMTRun = Decimal.Parse(objRunISFTXT.Text);
                    updateWQInstreamFeats.decPMTPool = Decimal.Parse(objPoolISFTXT.Text);
                    updateWQInstreamFeats.intChannelized = Int32.Parse(objWQChannelizedRDO.SelectedValue);
                    updateWQInstreamFeats.intDamPresent = Int32.Parse(objWQDamPresentRDO.SelectedValue);

                    db.SaveChanges();
                }
            }

            fvInstreamFeat.ChangeMode(FormViewMode.ReadOnly);
            WQInstreamFeat(intWaterQualityID);
        }
        #endregion

        #region fvWQLargeWoodyDebris_ItemUpdating()
        protected void fvWQLargeWoodyDebris_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQLargeWoodyDebris = db.tblWQLargeWoodyDebris.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQLargeWoodyDebris != null)
                {
                    TextBox objLWDTXT = fvWQLargeWoodyDebris.FindControl("txtLWD") as TextBox;
                    TextBox objLWDDensityTXT = fvWQLargeWoodyDebris.FindControl("txtLWDDensity") as TextBox;

                    updateWQLargeWoodyDebris.decLWD = Decimal.Parse(objLWDTXT.Text);
                    updateWQLargeWoodyDebris.decLWDDensity = Decimal.Parse(objLWDDensityTXT.Text);

                    db.SaveChanges();
                }
            }

            fvWQLargeWoodyDebris.ChangeMode(FormViewMode.ReadOnly);
            WQLargeWoodyDebris(intWaterQualityID);
        }
        #endregion

        #region fvWQAquaticVeg_ItemUpdating()
        protected void fvWQAquaticVeg_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQAquaticVegs = db.tblWQAquaticVegs.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQAquaticVegs != null)
                {
                    RadioButtonList objWQAquaticVegRDO = fvWQAquaticVeg.FindControl("rblWQAquaticVeg") as RadioButtonList;
                    TextBox objReachAqVegTXT = fvWQAquaticVeg.FindControl("txtReachAqVeg") as TextBox;
                    TextBox objAVDomSpecPresTXT = fvWQAquaticVeg.FindControl("txtAVDomSpecPres") as TextBox;

                    updateWQAquaticVegs.intDomTypeSpecPres = Int32.Parse(objWQAquaticVegRDO.SelectedValue);
                    updateWQAquaticVegs.decPctReachAqVeg = Decimal.Parse(objReachAqVegTXT.Text);
                    updateWQAquaticVegs.strAVDomSpecPres = objAVDomSpecPresTXT.Text;

                    db.SaveChanges();
                }
            }

            fvWQAquaticVeg.ChangeMode(FormViewMode.ReadOnly);
            WQAquaticVeg(intWaterQualityID);
        }
        #endregion

        #region fvWQWaterQuality_ItemUpdating()
        protected void fvWQWaterQuality_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQWaterQualities = db.tblWQWaterQualities.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQWaterQualities != null)
                {
                    TextBox objWQTempC = fvWQWaterQuality.FindControl("txtWQTempC") as TextBox;
                    TextBox objWQSpecCond = fvWQWaterQuality.FindControl("txtWQSpecCond") as TextBox;
                    TextBox objWQDO = fvWQWaterQuality.FindControl("txtWQDO") as TextBox;
                    TextBox objWQpH = fvWQWaterQuality.FindControl("txtWQpH") as TextBox;
                    TextBox objWQTurbid = fvWQWaterQuality.FindControl("txtWQTurbid") as TextBox;
                    TextBox objWQInstrUsed = fvWQWaterQuality.FindControl("txtWQInstrUsed") as TextBox;
                    RadioButtonList objWQWaterOdors = fvWQWaterQuality.FindControl("rblWQWaterOdors") as RadioButtonList;
                    TextBox objOtherWaterOdor = fvWQWaterQuality.FindControl("txtOtherWaterOdor") as TextBox;
                    RadioButtonList objWaterSurfaceOils = fvWQWaterQuality.FindControl("rblWaterSurfaceOils") as RadioButtonList;
                    TextBox objWaterSurfOilsOther = fvWQWaterQuality.FindControl("txtWaterSurfOilsOther") as TextBox;
                    RadioButtonList objWQTurbidity = fvWQWaterQuality.FindControl("rblWQTurbidity") as RadioButtonList;
                    RadioButtonList objTurbNotMeas = fvWQWaterQuality.FindControl("rblWQTurbidity") as RadioButtonList;
                    TextBox objTurbNotMeasOther = fvWQWaterQuality.FindControl("txtTurbNotMeasOther") as TextBox;

                    updateWQWaterQualities.decWQTempC = Decimal.Parse(objWQTempC.Text);
                    updateWQWaterQualities.decWQSpecCond = Decimal.Parse(objWQSpecCond.Text);
                    updateWQWaterQualities.decWQDO = Decimal.Parse(objWQDO.Text);
                    updateWQWaterQualities.decWQpH = Decimal.Parse(objWQpH.Text);
                    updateWQWaterQualities.decWQTurbid = Decimal.Parse(objWQTurbid.Text);
                    updateWQWaterQualities.strWQInstrUsed = objWQInstrUsed.Text;
                    updateWQWaterQualities.intWaterOdor = Int32.Parse(objWQWaterOdors.SelectedValue);
                    updateWQWaterQualities.strWaterOdorOther = objOtherWaterOdor.Text;
                    updateWQWaterQualities.intWaterSurfOils = Int32.Parse(objWaterSurfaceOils.SelectedValue);
                    updateWQWaterQualities.strWaterSurfOilsOther = objWaterSurfOilsOther.Text;
                    updateWQWaterQualities.decWQTurbid = Decimal.Parse(objWQTurbidity.SelectedValue);
                    updateWQWaterQualities.intTurbNotMeas = Int32.Parse(objTurbNotMeas.SelectedValue);
                    updateWQWaterQualities.strTurbNotMeasOther = objTurbNotMeasOther.Text;

                    db.SaveChanges();
                }
            }

            fvWQWaterQuality.ChangeMode(FormViewMode.ReadOnly);
            WQWaterQuality(intWaterQualityID);
        }
        #endregion

        #region fvWQSedSub_ItemUpdating()
        protected void fvWQSedSub_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQSedimentSubs = db.tblWQSedimentSubs.SingleOrDefault(b => b.intWQID == intWaterQualityID);
                if (updateWQSedimentSubs != null)
                {
                    RadioButtonList objWQSedSubOdors = fvWQSedSub.FindControl("rblWQSedSubOdors") as RadioButtonList;
                    TextBox objSedSubOdorsOther = fvWQSedSub.FindControl("txtSedSubOdorsOther") as TextBox;
                    RadioButtonList objWQSedSubDeposits = fvWQSedSub.FindControl("rblWQSedSubDeposits") as RadioButtonList;
                    TextBox objSedSubDepositsOther = fvWQSedSub.FindControl("txtSedSubDeposits") as TextBox;
                    RadioButtonList objWQOils = fvWQSedSub.FindControl("rblWQOils") as RadioButtonList;
                    RadioButtonList objSedSubStones = fvWQSedSub.FindControl("rblSedSubStones") as RadioButtonList;

                    updateWQSedimentSubs.intSedSubOdors = Int32.Parse(objWQSedSubOdors.SelectedValue);
                    updateWQSedimentSubs.strSedSubOdorsOther = objSedSubOdorsOther.Text;
                    updateWQSedimentSubs.intSedSubDeposits = Int32.Parse(objWQSedSubDeposits.SelectedValue);
                    updateWQSedimentSubs.strSedSubDepositsOther = objSedSubDepositsOther.Text;
                    updateWQSedimentSubs.intSedSubOils = Int32.Parse(objWQOils.SelectedValue);
                    updateWQSedimentSubs.intSedSubStones = Int32.Parse(objSedSubStones.SelectedValue);

                    db.SaveChanges();
                }
            }

            fvWQSedSub.ChangeMode(FormViewMode.ReadOnly);
            WQSedSub(intWaterQualityID);
        }
        #endregion

        #region fvWQInorgSubCom_ItemUpdating()
        protected void fvWQInorgSubCom_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);
            using (var db = new BioDataCore())
            {
                var updateWQInorgSubComps = db.tblWQInorgSubComps.SingleOrDefault(b => b.intWQID == intWaterQualityID);

                if (updateWQInorgSubComps != null)
                {
                    TextBox objISCBedrock = fvWQInorgSubCom.FindControl("txtISCBedrock") as TextBox;
                    TextBox objISCBoulder = fvWQInorgSubCom.FindControl("txtISCBoulder") as TextBox;
                    TextBox objISCCobble = fvWQInorgSubCom.FindControl("txtISCCobble") as TextBox;
                    TextBox objGravel = fvWQInorgSubCom.FindControl("txtGravel") as TextBox;
                    TextBox objISCSand = fvWQInorgSubCom.FindControl("txtISCSand") as TextBox;
                    TextBox objISCSilt = fvWQInorgSubCom.FindControl("txtISCSilt") as TextBox;
                    TextBox objISCClay = fvWQInorgSubCom.FindControl("txtISCClay") as TextBox;

                    updateWQInorgSubComps.decISCBedrock = Decimal.Parse(objISCBedrock.Text);
                    updateWQInorgSubComps.decISCBoulder = Decimal.Parse(objISCBoulder.Text);
                    updateWQInorgSubComps.decISCCobble = Decimal.Parse(objISCCobble.Text);
                    updateWQInorgSubComps.decISCGravel = Decimal.Parse(objGravel.Text);
                    updateWQInorgSubComps.decISCSand = Decimal.Parse(objISCSand.Text);
                    updateWQInorgSubComps.decISCSilt = Decimal.Parse(objISCSilt.Text);
                    updateWQInorgSubComps.decISCClay = Decimal.Parse(objISCClay.Text);

                    Decimal decISCInorgSubCalComp = Decimal.Parse(objISCBedrock.Text) + Decimal.Parse(objISCBoulder.Text) + Decimal.Parse(objISCCobble.Text) + Decimal.Parse(objGravel.Text) + Decimal.Parse(objISCSand.Text) + Decimal.Parse(objISCSilt.Text) + Decimal.Parse(objISCClay.Text);
                    updateWQInorgSubComps.decISCInorgSubCalComp = decISCInorgSubCalComp;

                    db.SaveChanges();
                }
            }
  
            fvWQInorgSubCom.ChangeMode(FormViewMode.ReadOnly);
            WQInorgSubCom(intWaterQualityID);
        }
        #endregion

        #region fvWQOrgSubCom_ItemUpdating()
        protected void fvWQOrgSubCom_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            using (var db = new BioDataCore())
            {
                var updateWQOrgSubComps = db.tblWQOrgSubComps.SingleOrDefault(b => b.intWQID == intWaterQualityID);

                if (updateWQOrgSubComps != null)
                {
                    TextBox objOSCDetritus = fvWQOrgSubCom.FindControl("txtOSCDetritus") as TextBox;
                    TextBox objOSCMuckMud = fvWQOrgSubCom.FindControl("txtOSCMuckMud") as TextBox;
                    TextBox objOSCMarl = fvWQOrgSubCom.FindControl("txtOSCMarl") as TextBox;

                    updateWQOrgSubComps.decOCSPctDetritus = Decimal.Parse(objOSCDetritus.Text);
                    updateWQOrgSubComps.decOCSPctMuckMud = Decimal.Parse(objOSCMuckMud.Text);
                    updateWQOrgSubComps.decOCSPctMarl = Decimal.Parse(objOSCMarl.Text);

                    Decimal decOCSOrgSubCalComp = Decimal.Parse(objOSCDetritus.Text) + Decimal.Parse(objOSCMuckMud.Text) + Decimal.Parse(objOSCMarl.Text);
                    updateWQOrgSubComps.decOCSOrgSubCalComp = decOCSOrgSubCalComp;

                    db.SaveChanges();
                }
            }

            fvWQOrgSubCom.ChangeMode(FormViewMode.ReadOnly);
            WQOrgSubCom(intWaterQualityID);
        }
        #endregion

        //#############################################################
        //ItemInserting
        //#############################################################

        #region fvWQSurveyInfo_ItemInserting()
        protected void fvWQSurveyInfo_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox objCompletedBy = fvWQSurveyInfo.FindControl("txtCompletedBy") as TextBox;
            TextBox objCompleteDate = fvWQSurveyInfo.FindControl("txtCompleteDate") as TextBox;
            TextBox objCompleteTime = fvWQSurveyInfo.FindControl("txtCompleteTime") as TextBox;
            TextBox objStoretNum = fvWQSurveyInfo.FindControl("txtStoretNum") as TextBox;
            TextBox objInvestigators = fvWQSurveyInfo.FindControl("txtInvestigators") as TextBox;
            TextBox objSurveyReason = fvWQSurveyInfo.FindControl("txtSurveyReason") as TextBox;
            DateTime dtCompleteDate = DateTime.Parse(objCompleteDate.Text.ToString());
            TimeSpan dtCompleteTime = TimeSpan.Parse(objCompleteTime.Text.ToString());

            int intUserID = Convert.ToInt32(Session["userID"]);
            Int32 intStationID = Int32.Parse(Request.QueryString["sid"]);

            var insertWQSurveyInfo = new tblWQSurveyInfo()
            {
                intStationID = intStationID,
                intUserID = intUserID,
                strCompletedBy = objCompletedBy.Text,
                dtmSurveyInfoDT = Convert.ToDateTime(dtCompleteDate.ToString("MM/dd/yyyy")),
                dtmSurveyInfoTM = dtCompleteTime,
                strSTORET = objStoretNum.Text,
                strInvestigators = objInvestigators.Text,
                strSurveyReason = objSurveyReason.Text
            };

            var db = new BioDataCore();
            db.tblWQSurveyInfo.Add(insertWQSurveyInfo);
            db.SaveChanges();

            int intWaterQualityID = insertWQSurveyInfo.intWQID;

            Session["wqid"] = intWaterQualityID;

            fvWQSurveyInfo.ChangeMode(FormViewMode.ReadOnly);

            string strRedirectURL = "wqassessment.aspx?wqid=" + intWaterQualityID.ToString() + "&sid=" + intStationID.ToString();
            Response.Redirect(strRedirectURL);
        }
        #endregion

        #region fvWQWeatherCond_ItemInserting()
        protected void fvWQWeatherCond_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQWeatherCondNowRDO = fvWQWeatherCond.FindControl("rblWQWeatherCondNow") as RadioButtonList;
            RadioButtonList objWQWeatherCond24RDO = fvWQWeatherCond.FindControl("rblWQWeatherCond24") as RadioButtonList;
            TextBox objWQCloudCoverNowTXT = fvWQWeatherCond.FindControl("txtWQCloudCoverNow") as TextBox;
            TextBox objWQCloudCover24TXT = fvWQWeatherCond.FindControl("txtWQCloudCover24") as TextBox;
            RadioButtonList objWQHeavyRainEvt = fvWQWeatherCond.FindControl("rblWQHeavyRainEvt") as RadioButtonList;

            var insertWQWeatherCond = new tblWQWeatherCond()
            {
                intWQID = intWaterQualityID,
                intWeatherCondNow = Int32.Parse(objWQWeatherCondNowRDO.SelectedValue),
                intWeatherCond24 = Int32.Parse(objWQWeatherCond24RDO.SelectedValue),
                decPctCloudCoverNow = Decimal.Parse(objWQCloudCoverNowTXT.Text),
                decPctCloudCover24 = Decimal.Parse(objWQCloudCover24TXT.Text),
                intRainEventLst7 = Int32.Parse(objWQHeavyRainEvt.SelectedValue)
            };

            var db = new BioDataCore();
            db.tblWQWeatherConds.Add(insertWQWeatherCond);
            db.SaveChanges();

            fvWQWeatherCond.ChangeMode(FormViewMode.ReadOnly);
            WQWeatherCondBind(intWaterQualityID);
        }
        #endregion

        #region fvWQStreamChar_ItemInserting()
        protected void fvWQStreamChar_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQStreamSubsystemRDO = fvWQStreamChar.FindControl("rblWQStreamSubsystem") as RadioButtonList;
            RadioButtonList objWQStreamOriginRDO = fvWQStreamChar.FindControl("rblWQStreamOrigin") as RadioButtonList;
            TextBox objWQOtherStreamOrigTXT = fvWQStreamChar.FindControl("txtWQOtherStreamOrig") as TextBox;
            RadioButtonList objStreamTypeRDO = fvWQStreamChar.FindControl("rblStreamType") as RadioButtonList;
            TextBox objWQCatchmentAreaTXT = fvWQStreamChar.FindControl("txtWQCatchmentArea") as TextBox;

            var insertWQStreamChar = new tblWQStreamChar()
            {
                intWQID = intWaterQualityID,
                intStreamSubSys = Int32.Parse(objWQStreamOriginRDO.SelectedValue),
                intStreamOrigin = Int32.Parse(objWQStreamOriginRDO.SelectedValue),
                strStreamOriginOther = objWQOtherStreamOrigTXT.Text,
                intStreamType = Int32.Parse(objStreamTypeRDO.SelectedValue),
                decCatchmentArea = Decimal.Parse(objWQCatchmentAreaTXT.Text)
            };

            var db = new BioDataCore();
            db.tblWQStreamChars.Add(insertWQStreamChar);
            db.SaveChanges();

            fvWQStreamChar.ChangeMode(FormViewMode.ReadOnly);
            WQStreamChar(intWaterQualityID);
        }
        #endregion

        #region fvWQWatershedFeat_ItemInserting()
        protected void fvWQWatershedFeat_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQLandUseRDO = fvWQWatershedFeat.FindControl("rblWQLandUse") as RadioButtonList;
            TextBox objWQOtherLandUseTXT = fvWQWatershedFeat.FindControl("txtWQOtherLandUse") as TextBox;
            RadioButtonList WQNPSPoll = fvWQWatershedFeat.FindControl("rblWQNPSPoll") as RadioButtonList;
            RadioButtonList objErosionRDO = fvWQWatershedFeat.FindControl("rblErosion") as RadioButtonList;

            var insertWQWatershedFeat = new tblWQWatershedFeat()
            {
                intWQID = intWaterQualityID,
                intPredomLandUse = Int32.Parse(objWQLandUseRDO.SelectedValue),
                strPredomLandUseOther = objWQOtherLandUseTXT.Text,
                intLocalNPSPol = Int32.Parse(WQNPSPoll.SelectedValue),
                intLocalWSErosion = Int32.Parse(objErosionRDO.SelectedValue)
            };

            var db = new BioDataCore();
            db.tblWQWatershedFeats.Add(insertWQWatershedFeat);
            db.SaveChanges();

            fvWQWatershedFeat.ChangeMode(FormViewMode.ReadOnly);
            WQWatershedFeat(intWaterQualityID);
        }
        #endregion

        #region fvRipVeg_ItemInserting()
        protected void fvRipVeg_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQDomVegRDO = fvRipVeg.FindControl("rblWQDomVeg") as RadioButtonList;
            TextBox objDomSpeciesRipVegTXT = fvRipVeg.FindControl("txtDomSpeciesRipVeg") as TextBox;

            var insertWQRipVeg = new tblWQRipVeg()
            {
                intWQID = intWaterQualityID,
                intDomSpeciesPresent = Int32.Parse(objWQDomVegRDO.SelectedValue),
                strDomSpeciesPresentLst = objDomSpeciesRipVegTXT.Text
            };

            var db = new BioDataCore();
            db.tblWQRipVegs.Add(insertWQRipVeg);
            db.SaveChanges();

            fvRipVeg.ChangeMode(FormViewMode.ReadOnly);
            WQRipVeg(intWaterQualityID);
        }
        #endregion

        #region fvInstreamFeat_ItemInserting()
        protected void fvInstreamFeat_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            TextBox objEstReachLenTXT = fvInstreamFeat.FindControl("txtEstReachLen") as TextBox;
            TextBox objEstStreamWdthTXT = fvInstreamFeat.FindControl("txtEstStreamWdth") as TextBox;
            TextBox objEstStreamAreaTXT = fvInstreamFeat.FindControl("txtEstStreamArea") as TextBox;
            TextBox objAreaInKMTXT = fvInstreamFeat.FindControl("txtAreaInKM") as TextBox;
            TextBox objEstStreamDepthTXT = fvInstreamFeat.FindControl("txtlEstStreamDepth") as TextBox;
            TextBox objSurfVelThalwagTXT = fvInstreamFeat.FindControl("txtSurfVelThalwag") as TextBox;
            TextBox objHighWaterMrkTXT = fvInstreamFeat.FindControl("txtHighWaterMrk") as TextBox;
            RadioButtonList objWQCanopyCoverRDO = fvInstreamFeat.FindControl("rblWQCanopyCover") as RadioButtonList;
            TextBox objRiffleISFTXT = fvInstreamFeat.FindControl("txtRiffleISF") as TextBox;
            TextBox objRunISFTXT = fvInstreamFeat.FindControl("txtRunISF") as TextBox;
            TextBox objPoolISFTXT = fvInstreamFeat.FindControl("txtPoolISF") as TextBox;
            RadioButtonList objWQChannelizedRDO = fvInstreamFeat.FindControl("rblWQChannelized") as RadioButtonList;
            RadioButtonList objWQDamPresentRDO = fvInstreamFeat.FindControl("rblWQDamPresent") as RadioButtonList;

            var insertWQInstreamFeat = new tblWQInstreamFeat()
            {
                intWQID = intWaterQualityID,
                decEstReachLength = Decimal.Parse(objEstReachLenTXT.Text),
                decEstReachWidth = Decimal.Parse(objEstStreamWdthTXT.Text),
                decEstReachArea = Decimal.Parse(objEstStreamAreaTXT.Text),
                decAreaKM = Decimal.Parse(objAreaInKMTXT.Text),
                decEstReachDepth = Decimal.Parse(objEstStreamDepthTXT.Text),
                decSurfVelThalwag = Decimal.Parse(objSurfVelThalwagTXT.Text),
                decHighWaterMark = Decimal.Parse(objHighWaterMrkTXT.Text),
                intCanopyCover = Int32.Parse(objWQCanopyCoverRDO.SelectedValue),
                decPMTRiffle = Decimal.Parse(objRiffleISFTXT.Text),
                decPMTRun = Decimal.Parse(objRunISFTXT.Text),
                decPMTPool = Decimal.Parse(objPoolISFTXT.Text),
                intChannelized = Int32.Parse(objWQChannelizedRDO.SelectedValue),
                intDamPresent = Int32.Parse(objWQDamPresentRDO.SelectedValue)
            };

            var db = new BioDataCore();
            db.tblWQInstreamFeats.Add(insertWQInstreamFeat);
            db.SaveChanges();

            fvInstreamFeat.ChangeMode(FormViewMode.ReadOnly);
            WQInstreamFeat(intWaterQualityID);
        }
        #endregion

        #region fvWQLargeWoodyDebris_ItemInserting()
        protected void fvWQLargeWoodyDebris_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            TextBox objLWDTXT = fvWQLargeWoodyDebris.FindControl("txtLWD") as TextBox;
            TextBox objLWDDensityTXT = fvWQLargeWoodyDebris.FindControl("txtLWDDensity") as TextBox;

            var insertWQLargeWoodyDebris = new tblWQLargeWoodyDebri()
            {
                intWQID = intWaterQualityID,
                decLWD = Decimal.Parse(objLWDTXT.Text),
                decLWDDensity = Decimal.Parse(objLWDDensityTXT.Text)
            };

            var db = new BioDataCore();
            db.tblWQLargeWoodyDebris.Add(insertWQLargeWoodyDebris);
            db.SaveChanges();

            fvWQLargeWoodyDebris.ChangeMode(FormViewMode.ReadOnly);
            WQLargeWoodyDebris(intWaterQualityID);
        }
        #endregion

        #region fvWQAquaticVeg_ItemInserting()
        protected void fvWQAquaticVeg_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQAquaticVegRDO = fvWQAquaticVeg.FindControl("rblWQAquaticVeg") as RadioButtonList;
            TextBox objReachAqVegTXT = fvWQAquaticVeg.FindControl("txtReachAqVeg") as TextBox;
            TextBox objAVDomSpecPresTXT = fvWQAquaticVeg.FindControl("txtAVDomSpecPres") as TextBox;

            var insertWQAquaticVeg = new tblWQAquaticVeg()
            {
                intWQID = intWaterQualityID,
                intDomTypeSpecPres = Int32.Parse(objWQAquaticVegRDO.SelectedValue),
                decPctReachAqVeg = Decimal.Parse(objReachAqVegTXT.Text),
                strAVDomSpecPres = objAVDomSpecPresTXT.Text
            };

            var db = new BioDataCore();
            db.tblWQAquaticVegs.Add(insertWQAquaticVeg);
            db.SaveChanges();

            fvWQAquaticVeg.ChangeMode(FormViewMode.ReadOnly);
            WQAquaticVeg(intWaterQualityID);
        }
        #endregion

        #region fvWQWaterQuality_ItemInserting()
        protected void fvWQWaterQuality_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            TextBox objWQTempC = fvWQWaterQuality.FindControl("txtWQTempC") as TextBox;
            TextBox objWQSpecCond = fvWQWaterQuality.FindControl("txtWQSpecCond") as TextBox;
            TextBox objWQDO = fvWQWaterQuality.FindControl("txtWQDO") as TextBox;
            TextBox objWQpH = fvWQWaterQuality.FindControl("txtWQpH") as TextBox;
            TextBox objWQTurbid = fvWQWaterQuality.FindControl("txtWQTurbid") as TextBox;
            TextBox objWQInstrUsed = fvWQWaterQuality.FindControl("txtWQInstrUsed") as TextBox;
            RadioButtonList objWQWaterOdors = fvWQWaterQuality.FindControl("rblWQWaterOdors") as RadioButtonList;
            TextBox objOtherWaterOdor = fvWQWaterQuality.FindControl("txtOtherWaterOdor") as TextBox;
            RadioButtonList objWaterSurfaceOils = fvWQWaterQuality.FindControl("rblWaterSurfaceOils") as RadioButtonList;
            TextBox objWaterSurfOilsOther = fvWQWaterQuality.FindControl("txtWaterSurfOilsOther") as TextBox;
            RadioButtonList objWQTurbidity = fvWQWaterQuality.FindControl("rblWQTurbidity") as RadioButtonList;
            TextBox objTurbNotMeasOther = fvWQWaterQuality.FindControl("txtTurbNotMeasOther") as TextBox;

            var insretWQWaterQuality = new tblWQWaterQuality()
            {
                intWQID = intWaterQualityID,
                decWQTempC = Decimal.Parse(objWQTempC.Text),
                decWQSpecCond = Decimal.Parse(objWQSpecCond.Text),
                decWQDO = Decimal.Parse(objWQDO.Text),
                decWQpH = Decimal.Parse(objWQpH.Text),
                decWQTurbid = Decimal.Parse(objWQTurbid.Text),
                strWQInstrUsed = objWQInstrUsed.Text,
                intWaterOdor = Int32.Parse(objWQWaterOdors.SelectedValue),
                strWaterOdorOther = objOtherWaterOdor.Text,
                intWaterSurfOils = Int32.Parse(objWaterSurfaceOils.SelectedValue),
                strWaterSurfOilsOther = objWaterSurfOilsOther.Text,
                intTurbNotMeas = Int32.Parse(objWQTurbidity.SelectedValue),
                strTurbNotMeasOther = objTurbNotMeasOther.Text
            };

            var db = new BioDataCore();
            db.tblWQWaterQualities.Add(insretWQWaterQuality);
            db.SaveChanges();

            fvWQWaterQuality.ChangeMode(FormViewMode.ReadOnly);
            WQWaterQuality(intWaterQualityID);
        }
        #endregion

        #region fvWQSedSub_ItemInserting()
        protected void fvWQSedSub_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            RadioButtonList objWQSedSubOdors = fvWQSedSub.FindControl("rblWQSedSubOdors") as RadioButtonList;
            TextBox objSedSubOdorsOther = fvWQSedSub.FindControl("txtSedSubOdorsOther") as TextBox;
            RadioButtonList objWQSedSubDeposits = fvWQSedSub.FindControl("rblWQSedSubDeposits") as RadioButtonList;
            TextBox objSedSubDepositsOther = fvWQSedSub.FindControl("txtSedSubDeposits") as TextBox;
            RadioButtonList objWQOils = fvWQSedSub.FindControl("rblWQOils") as RadioButtonList;
            RadioButtonList objSedSubStones = fvWQSedSub.FindControl("rblSedSubStones") as RadioButtonList;

            var insertWQSedimentSub = new tblWQSedimentSub()
            {
                intWQID = intWaterQualityID,
                intSedSubOdors = Int32.Parse(objWQSedSubOdors.SelectedValue),
                strSedSubOdorsOther = objSedSubOdorsOther.Text,
                intSedSubDeposits = Int32.Parse(objWQSedSubDeposits.SelectedValue),
                strSedSubDepositsOther = objSedSubDepositsOther.Text,
                intSedSubOils = Int32.Parse(objWQOils.SelectedValue),
                intSedSubStones = Int32.Parse(objSedSubStones.SelectedValue)
            };

            var db = new BioDataCore();
            db.tblWQSedimentSubs.Add(insertWQSedimentSub);
            db.SaveChanges();

            fvWQSedSub.ChangeMode(FormViewMode.ReadOnly);
            WQSedSub(intWaterQualityID);
        }
        #endregion

        #region fvWQInorgSubCom_ItemInserting()
        protected void fvWQInorgSubCom_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            TextBox objISCBedrock = fvWQInorgSubCom.FindControl("txtISCBedrock") as TextBox;
            TextBox objISCBoulder = fvWQInorgSubCom.FindControl("txtISCBoulder") as TextBox;
            TextBox objISCCobble = fvWQInorgSubCom.FindControl("txtISCCobble") as TextBox;
            TextBox objGravel = fvWQInorgSubCom.FindControl("txtGravel") as TextBox;
            TextBox objISCSand = fvWQInorgSubCom.FindControl("txtISCSand") as TextBox;
            TextBox objISCSilt = fvWQInorgSubCom.FindControl("txtISCSilt") as TextBox;
            TextBox objISCClay = fvWQInorgSubCom.FindControl("txtISCClay") as TextBox;

            var insertWQInorgSubComp = new tblWQInorgSubComp()
            {
                intWQID = intWaterQualityID,
                decISCBedrock = Decimal.Parse(objISCBedrock.Text),
                decISCBoulder = Decimal.Parse(objISCBoulder.Text),
                decISCCobble = Decimal.Parse(objISCCobble.Text),
                decISCGravel = Decimal.Parse(objGravel.Text),
                decISCSand = Decimal.Parse(objISCSand.Text),
                decISCSilt = Decimal.Parse(objISCSilt.Text),
                decISCClay = Decimal.Parse(objISCClay.Text)
            };

            var db = new BioDataCore();
            db.tblWQInorgSubComps.Add(insertWQInorgSubComp);
            db.SaveChanges();

            fvWQInorgSubCom.ChangeMode(FormViewMode.ReadOnly);
            WQInorgSubCom(intWaterQualityID);
        }
        #endregion

        #region fvWQOrgSubCom_ItemInserting()
        protected void fvWQOrgSubCom_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int intWaterQualityID = Int32.Parse(Request.QueryString["wqid"]);

            TextBox objOSCDetritus = fvWQOrgSubCom.FindControl("txtOSCDetritus") as TextBox;
            TextBox objOSCMuckMud = fvWQOrgSubCom.FindControl("txtOSCMuckMud") as TextBox;
            TextBox objOSCMarl = fvWQOrgSubCom.FindControl("txtOSCMarl") as TextBox;

            var insertWQOrgSubComp = new tblWQOrgSubComp()
            {
                intWQID = intWaterQualityID,
                decOCSPctDetritus = Decimal.Parse(objOSCDetritus.Text),
                decOCSPctMuckMud = Decimal.Parse(objOSCMuckMud.Text),
                decOCSPctMarl = Decimal.Parse(objOSCMarl.Text)
            };

            var db = new BioDataCore();
            db.tblWQOrgSubComps.Add(insertWQOrgSubComp);
            db.SaveChanges();

            fvWQOrgSubCom.ChangeMode(FormViewMode.ReadOnly);
            WQOrgSubCom(intWaterQualityID);
        }
        #endregion
    }
}