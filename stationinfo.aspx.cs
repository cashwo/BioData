#region namespace
using System;
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
#endregion

namespace BioData
{
    public partial class stationinfo : System.Web.UI.Page
    {
        #region Class Variables
        //private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BioData"].ConnectionString);
        private BioDataCore db = new BioDataCore();
        private clsAppFunc objAppFunc = new clsAppFunc();
        #endregion

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
            Int32 intStationID = Int32.Parse(Request.QueryString["sid"]);

            lblStationNameNum.Text = objAppFunc.GetStationNameNum(intStationID);

            if (!this.IsPostBack)
            {
                fvStationBind(intStationID);
                fgvWQAssessmentBind(intStationID.ToString());
            }
        }
        #endregion

        #region fvStationBind()
        protected void fvStationBind(int intSID)
        {
            var qryStationInformation = db.tblStations
                .Where(s => s.intStationID == intSID);

            fvStationInfo.DataSource = qryStationInformation.ToList();
            fvStationInfo.DataBind();

            Label objViewOnMap = fvStationInfo.FindControl("lblViewOnMap") as Label;

            objViewOnMap.Text = "<a href=\"mapview.aspx?sid=" + intSID.ToString() + "\" target=\"new_window\">View On Map</a>";

            //##############################################################
            //security check
            //##############################################################
            int intUserID = Convert.ToInt32(Session["userID"]);
            int intUserRole = Convert.ToInt32(Session["roleID"]);

            if (intUserRole == 2)
            {
                ((Button)this.fvStationInfo.FindControl("btnEdit")).Visible = false;
                ((Button)this.fvStationInfo.FindControl("btnDelete")).Visible = false;
            }
            //##############################################################
        }
        #endregion

        #region fgvWQAssessmentBind()
        protected void fgvWQAssessmentBind(string strSID)
        {
            int intStationID = Int32.Parse(Request.QueryString["sid"]);
            string strStationID = Request.QueryString["sid"];

            var qryWQSurveyInfo = db.tblWQSurveyInfo
                .Where(s => s.intStationID == intStationID)
                .OrderBy(o => o.dtmSurveyInfoDT);

            gvWQAssessments.DataSource = qryWQSurveyInfo.ToList();
            gvWQAssessments.DataBind();
        }
        #endregion

        #region fvStationInfo_ItemUpdating()
        protected void fvStationInfo_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Int32 intStationID = Int32.Parse(Request.QueryString["sid"]);

            using (var db = new BioDataCore())
            {
                var updateStations = db.tblStations.SingleOrDefault(b => b.intStationID == intStationID);
                if (updateStations != null)
                {
                    TextBox objTxtLocation = fvStationInfo.FindControl("txtLocation") as TextBox;
                    TextBox objTxtRiverMile = fvStationInfo.FindControl("txtRiverMile") as TextBox;
                    TextBox objTxtStreamClass = fvStationInfo.FindControl("txtStreamClass") as TextBox;
                    TextBox objTxtLatitude = fvStationInfo.FindControl("txtLatitude") as TextBox;
                    TextBox objTxtLongitude = fvStationInfo.FindControl("txtLongitude") as TextBox;
                    TextBox objTxtRiverBasin = fvStationInfo.FindControl("txtRiverBasin") as TextBox;
                    TextBox objTxtAgency = fvStationInfo.FindControl("txtAgency") as TextBox;

                    updateStations.strLocation = objTxtLocation.Text;
                    updateStations.intRiverMile = Decimal.Parse(objTxtRiverMile.Text);
                    updateStations.strStreamClass = objTxtStreamClass.Text;
                    updateStations.fltLatitude = Double.Parse(objTxtLatitude.Text);
                    updateStations.fltLongitude = Double.Parse(objTxtLongitude.Text);
                    updateStations.strRiverBasin = objTxtRiverBasin.Text;
                    updateStations.strAgency = objTxtAgency.Text;

                    db.SaveChanges();
                }
            }

            fvStationInfo.ChangeMode(FormViewMode.ReadOnly);
            fvStationBind(intStationID);
        }
        #endregion

        #region fvStationInfo_OnItemDeleting()
        protected void fvStationInfo_OnItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            Int32 intStationID = Int32.Parse(Request.QueryString["sid"]);

            //delete station data
            //var delStation = db.tblStations.Where(d => d.intStationID == intStationID).First();
            //db.tblStations.Remove(delStation);
            //db.SaveChanges();

            //get the WQ Assessment IDs to delete
            //List<int> delWQIDList = db
            //  .tblWQSurveyInfo
            //  .Where(u => u.intStationID == intStationID)
            //  .Select(u => u.intWQID)
            //  .ToList();

            //delete Survey Information
            //var delSurveyInfo = db.tblWQSurveyInfo.Where(s => s.intStationID == intStationID).First();
            //db.tblWQSurveyInfo.Remove(delSurveyInfo);
            //db.SaveChanges();

            //delete WQ Assessment Data
            //foreach (int intWQID in delWQIDList)
            //{
            //    var delWQWaterQuality = db.tblWQWaterQualities.Where(s => s.intWQID == intWQID).First();
            //    db.tblWQWaterQualities.Remove(delWQWaterQuality);
            //    db.SaveChanges();
            //}

            Response.Redirect("main.aspx");
        }
        #endregion

        #region fvStationInfo_ModeChanging()
        protected void fvStationInfo_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            string strStationID = Request.QueryString["sid"];

            fvStationInfo.ChangeMode(e.NewMode);
            fvStationBind(Int32.Parse(strStationID));
        }
        #endregion

        #region gvWQAssessments_PageIndexChanging()
        protected void gvWQAssessments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string strStationID = Request.QueryString["sid"];

            gvWQAssessments.PageIndex = e.NewPageIndex;
            fgvWQAssessmentBind(strStationID);
        }
        #endregion

        #region btnAddWQ_Click()
        protected void btnAddWQ_Click(object sender, EventArgs e)
        {
            string strStationID = Request.QueryString["sid"];
            string strRedirectURL = "wqassessment.aspx?sid=" + strStationID;

            Response.Redirect(strRedirectURL.ToString());
        }
        #endregion
    }
}