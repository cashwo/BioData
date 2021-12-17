#region namespaces
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
    public partial class stationadd : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
            //##############################################################
            // security check
            //##############################################################
            int intUserID = Convert.ToInt32(Session["userID"]);
            int intUserRole = Convert.ToInt32(Session["roleID"]);

            if (intUserRole != 1)
            {
                Response.Redirect("main.aspx");
            }
            //##############################################################
        }
        #endregion

        #region btnCancel_Click()
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }
        #endregion

        #region btnAddStation_Click()
        protected void btnAddStation_Click(object sender, EventArgs e)
        {
            var insertStation = new tblStation()
            {
                intUserId = Int32.Parse(Session["userID"].ToString()),
                strStreamName = txtStreamName.Text,
                strStationNum = txtStationNum.Text,
                strLocation = txtLocation.Text,
                intRiverMile = Int32.Parse(txtRiverMile.Text),
                strStreamClass = txtStreamClass.Text,
                fltLatitude = float.Parse(txtLatitude.Text),
                fltLongitude = float.Parse(txtLongitude.Text),
                strRiverBasin = txtRiverBasin.Text,
                strAgency = txtAgency.Text
            };

            var db = new BioDataCore();
            db.tblStations.Add(insertStation);
            db.SaveChanges();

            Response.Redirect("main.aspx");
        }
        #endregion
    }
}