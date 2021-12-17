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
    public partial class adminmob : System.Web.UI.Page
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

            clsDataFunc objDataFunc = new clsDataFunc();
            DataSet dsWebServLocRemoteCMB = objDataFunc.GetDataset("SELECT DISTINCT intWSLID, strWSLName FROM tblWebServicesLocation WHERE strWSLName <> 'Home'");
            cmbWebServLocRemoteAdd.DataSource = dsWebServLocRemoteCMB;
            cmbWebServLocRemoteAdd.DataTextField = "strWSLName";
            cmbWebServLocRemoteAdd.DataValueField = "intWSLID";
            cmbWebServLocRemoteAdd.DataBind();
            cmbWebServLocRemoteAdd.Items.Insert(0, new ListItem(String.Empty, String.Empty));

            //##############################################################
            if (!IsPostBack)
            {
                gvWebServicesBind();
                gvWebServicesRemoteBind();

                cmbWebServLocRemoteAdd.SelectedIndex = 0;
            }
        }
        #endregion

        #region gvWebServicesBind()
        protected void gvWebServicesBind()
        {
            var qryWebServices = from vwWebServices in db.vwWebServices
                                 select vwWebServices;

            gvWebServices.DataSource = qryWebServices.ToList();
            gvWebServices.DataBind();
        }
        #endregion

        #region gvWebServicesRemoteBind()
        protected void gvWebServicesRemoteBind()
        {
            var qryWebServiceLocations = from vwWebServiceLocations in db.vwWebServiceLocations
                                 select vwWebServiceLocations;

            gvWebServicesRemote.DataSource = qryWebServiceLocations.ToList();
            gvWebServicesRemote.DataBind();
        }
        #endregion

        #region gvWebServicesRemote_RowDataBound()
        protected void gvWebServicesRemote_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkbtnDeleteRemote = (LinkButton)e.Row.FindControl("lbDeleteRemote");
                lnkbtnDeleteRemote.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this record?')");
            }
        }
        #endregion

        #region gvWebServices_PageIndexChanging()
        protected void gvWebServices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvWebServices.PageIndex = e.NewPageIndex;
            gvWebServicesBind();
        }
        #endregion

        #region gvWebServicesRemote_PageIndexChanging()
        protected void gvWebServicesRemote_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvWebServicesRemote.PageIndex = e.NewPageIndex;
            gvWebServicesRemoteBind();
        }
        #endregion

        #region gvWebServices_RowEditing()
        protected void gvWebServices_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvWebServices.EditIndex = e.NewEditIndex;
            gvWebServicesBind();
        }
        #endregion

        #region gvWebServicesRemote_RowEditing()
        protected void gvWebServicesRemote_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvWebServicesRemote.EditIndex = e.NewEditIndex;
            gvWebServicesRemoteBind();
        }
        #endregion

        #region gvWebServices_RowCancelingEdit()
        protected void gvWebServices_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvWebServices.EditIndex = -1;
            gvWebServicesBind();
        }
        #endregion

        #region gvWebServicesRemote_RowCancelingEdit()
        protected void gvWebServicesRemote_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvWebServicesRemote.EditIndex = -1;
            gvWebServicesRemoteBind();
        }
        #endregion

        #region gvWebServices_RowUpdating()
        protected void gvWebServices_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = gvWebServices.EditIndex;
            GridViewRow row = gvWebServices.Rows[index];
            int intUpdateID = Convert.ToInt32(gvWebServices.DataKeys[e.RowIndex].Value.ToString());

            using (var db = new BioDataCore())
            {
                var updateWebServices = db.tblWebServices.SingleOrDefault(b => b.intWSID == intUpdateID);
                if (updateWebServices != null)
                {
                    TextBox objTxtWSURL = row.FindControl("txtWSURL") as TextBox;
                    DropDownList objCmbWebServLoc = row.FindControl("cmbWebServLoc") as DropDownList;

                    updateWebServices.intWSLID = Int32.Parse(objCmbWebServLoc.SelectedValue);
                    updateWebServices.strWSURL = objTxtWSURL.Text;

                    db.SaveChanges();
                }
            }

            gvWebServices.EditIndex = -1;
            gvWebServicesBind();
        }
        #endregion

        #region gvWebServicesRemote_RowUpdating()
        protected void gvWebServicesRemote_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = gvWebServicesRemote.EditIndex;
            GridViewRow row = gvWebServicesRemote.Rows[index];
            int intUpdateID = Convert.ToInt32(gvWebServicesRemote.DataKeys[e.RowIndex].Value.ToString());

            using (var db = new BioDataCore())
            {
                var updateWebServices = db.tblWebServices.SingleOrDefault(b => b.intWSID == intUpdateID);
                if (updateWebServices != null)
                {
                    DropDownList objCmbWebServRemoteLoc = row.FindControl("cmbWebServLocRemote") as DropDownList;
                    TextBox objTxtWSNameRemote = row.FindControl("txtWSURLRemote") as TextBox;
                    TextBox objTxtWSURLRemote = row.FindControl("txtWSURLRemote") as TextBox;

                    updateWebServices.intWSLID = Int32.Parse(objCmbWebServRemoteLoc.SelectedValue);
                    updateWebServices.strWSURL = objTxtWSURLRemote.Text;

                    db.SaveChanges();
                }
            }

            gvWebServicesRemote.EditIndex = -1;
            gvWebServicesRemoteBind();
        }
        #endregion

        #region gvWebServicesRemote_RowDeleting()
        protected void gvWebServicesRemote_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int intDeleteID = Convert.ToInt32(gvWebServicesRemote.DataKeys[e.RowIndex].Value.ToString());

            var delWebServices = db.tblWebServices.Where(d => d.intWSID == intDeleteID).First();
            db.tblWebServices.Remove(delWebServices);
            db.SaveChanges();

            gvWebServicesRemote.EditIndex = -1;
            gvWebServicesRemoteBind();
        }
        #endregion

        #region btnAddWebServRemote_Click()
        protected void btnAddWebServRemote_Click(object sender, EventArgs e)
        {
            var insertWebService = new tblWebService()
            {
                intWSLID = Int32.Parse(cmbWebServLocRemoteAdd.SelectedValue),
                strWSKey = txtWebNameAdd.Text,
                strWSURL = txtWebURLAdd.Text
            };

            var db = new BioDataCore();
            db.tblWebServices.Add(insertWebService);
            db.SaveChanges();

            gvWebServicesRemote.EditIndex = -1;
            gvWebServicesRemoteBind();

            txtWebNameAdd.Text = "";
            txtWebURLAdd.Text = "";
        }
        #endregion
    }
}