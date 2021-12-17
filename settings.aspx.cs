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
    public partial class settings : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load
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
            if (!IsPostBack)
            {
                gvGISMapServicesBind();
            }
        }
        #endregion

        #region gvGISMapServicesBind()
        protected void gvGISMapServicesBind()
        {
            var qrySettings = from tblGISMapService in db.tblGISMapServices
                                 select tblGISMapService;

            gvGISMapServices.DataSource = qrySettings.ToList();
            gvGISMapServices.DataBind();
        }
        #endregion

        #region gvGISMapServices_PageIndexChanging()
        protected void gvGISMapServices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGISMapServices.PageIndex = e.NewPageIndex;
            gvGISMapServicesBind();
        }
        #endregion

        #region gvGISMapServices_RowDataBound()
        protected void gvGISMapServices_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton l = (LinkButton)e.Row.FindControl("lbDelete");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this record?')");
            }
        }
        #endregion

        #region gvGISMapServices_RowEditing()
        protected void gvGISMapServices_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvGISMapServices.EditIndex = e.NewEditIndex;
            gvGISMapServicesBind();
        }
        #endregion

        #region gvGISMapServices_RowCancelingEdit()
        protected void gvGISMapServices_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvGISMapServices.EditIndex = -1;
            gvGISMapServicesBind();
        }
        #endregion

        #region gvGISMapServices_RowUpdating()
        protected void gvGISMapServices_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = gvGISMapServices.EditIndex;
            GridViewRow row = gvGISMapServices.Rows[index];

            int intUpdateID = Convert.ToInt32(gvGISMapServices.DataKeys[e.RowIndex].Value.ToString());

            using (var db = new BioDataCore())
            {
                var updateGISMapServices = db.tblGISMapServices.SingleOrDefault(b => b.intGMS == intUpdateID);
                if (updateGISMapServices != null)
                {
                    TextBox objTxtGMSName = row.FindControl("txtGMSName") as TextBox;
                    TextBox objTxtGMSURL = row.FindControl("txtGMSURL") as TextBox;

                    updateGISMapServices.strGMSName = objTxtGMSName.Text;
                    updateGISMapServices.strGMSURL = objTxtGMSURL.Text;

                    db.SaveChanges();
                }
            }

            gvGISMapServices.EditIndex = -1;
            gvGISMapServicesBind();
        }
        #endregion

        #region gvGISMapServices_RowDeleting()
        protected void gvGISMapServices_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int intDeleteID = Convert.ToInt32(gvGISMapServices.DataKeys[e.RowIndex].Value.ToString());

            var delGISMapService = db.tblGISMapServices.Where(d => d.intGMS == intDeleteID).First();
            db.tblGISMapServices.Remove(delGISMapService);
            db.SaveChanges();

            gvGISMapServices.EditIndex = -1;
            gvGISMapServicesBind();
        }
        #endregion

        #region btnAddGMS_Click()
        protected void btnAddGMS_Click(object sender, EventArgs e)
        {
            var insertGISMapServices = new tblGISMapService()
            {
                strGMSName = txtGMSNameAdd.Text,
                strGMSURL = txtGMSURLAdd.Text
            };

            var db = new BioDataCore();
            db.tblGISMapServices.Add(insertGISMapServices);
            db.SaveChanges();

            gvGISMapServices.EditIndex = -1;
            gvGISMapServicesBind();

            txtGMSNameAdd.Text = "";
            txtGMSURLAdd.Text = "";
        }
        #endregion
    }
}

