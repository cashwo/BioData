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
    public partial class _default1 : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            #region security check
            int intUserID = Convert.ToInt32(Session["userID"]);
            int intUserRole = Convert.ToInt32(Session["roleID"]);

            if (intUserRole == 2)
            {
                btnAddStation.Visible = false;
            }
            else
            {
                btnAddStation.Visible = true;
            }
            #endregion

            gvStationListBind();
        }
        #endregion

        #region gvStationListBind()
        protected void gvStationListBind()
        {
            var qryStationList = from tblStationList in db.vwStationLists
                                 select tblStationList;

            gvStationList.DataSource = qryStationList.ToList();
            gvStationList.DataBind();

            //if (txtSearch.Text != "")
            //{
            //    if (cmbSearchCriteria.SelectedValue == "1")
            //    {
            //        sbSelectStations.Append(" and st.strStreamName like '%" + txtSearch.Text + "%'");
            //    }
            //    else if (cmbSearchCriteria.SelectedValue == "2")
            //    {
            //        sbSelectStations.Append(" and st.strStationNum like '%" + txtSearch.Text + "%'");
            //    }
            //}
        }
        #endregion

        #region gvStationList_PageIndexChanging()
        protected void gvStationList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStationList.PageIndex = e.NewPageIndex;
            gvStationListBind();
        }
        #endregion

        #region AddStation()
        protected void AddStation(object sender, EventArgs e)
        {
            Response.Redirect("stationadd.aspx");
        }
        #endregion
    }
}