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
    public partial class admin : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BioData"].ConnectionString);

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

            if (!IsPostBack)
            {
                gvUsersBind();
            }
        }
        #endregion

        #region gvUsersBind()
        protected void gvUsersBind()
        {
            var qryUsers = from vwUserList in db.vwUserList
                              select vwUserList;

            gvUsers.DataSource = qryUsers.ToList();
            gvUsers.DataBind();
        }
        #endregion

        #region gvUsers_PageIndexChanging()
        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            gvUsersBind();
        }
        #endregion

        #region gvUsers_RowEditing()
        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            gvUsersBind();
        }
        #endregion

        #region gvUsers_RowCancelingEdit()
        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            gvUsersBind();
        }
        #endregion

        #region gvUsers_RowUpdating()
        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = gvUsers.EditIndex;
            GridViewRow row = gvUsers.Rows[index];
            int intUpdateID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value.ToString());

            using (var db = new BioDataCore())
            {
                var updateUser = db.tblUsers.SingleOrDefault(b => b.intUserID == intUpdateID);
                if (updateUser != null)
                {
                    TextBox objTxtUserLName = row.FindControl("txtUserLName") as TextBox;
                    TextBox objTxtUserMName = row.FindControl("txtUserMName") as TextBox;
                    TextBox objTxtUserFName = row.FindControl("txtUserFName") as TextBox;
                    TextBox objTxtUserName = row.FindControl("txtUserName") as TextBox;
                    DropDownList objCmbUserRole = row.FindControl("cmbUserRole") as DropDownList;
                    DropDownList objCmbAcctType = row.FindControl("cmbAcctType") as DropDownList;

                    updateUser.strUserLName = objTxtUserLName.Text;
                    updateUser.strUserMName = objTxtUserMName.Text;
                    updateUser.strUserFName = objTxtUserFName.Text;
                    updateUser.strUserName = objTxtUserName.Text;
                    updateUser.intRoleID = Int32.Parse(objCmbUserRole.SelectedValue);
                    updateUser.intAcctTypeID = Int32.Parse(objCmbAcctType.SelectedValue);

                    db.SaveChanges();
                }
            }

            gvUsers.EditIndex = -1;
            gvUsersBind();
        }
        #endregion

        #region gvUsers_RowDataBound()
        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkbtnDelete = (LinkButton)e.Row.FindControl("lbDelete");
                lnkbtnDelete.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this record?')");

                LinkButton lnkbtnResetPWD = (LinkButton)e.Row.FindControl("lbResetPWD");
                lnkbtnResetPWD.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to reset this users password?')");
            }
        }
        #endregion

        #region gvUsers_RowDeleting()
        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int intDeleteID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value.ToString());

            var delUser = db.tblUsers.Where(d => d.intUserID == intDeleteID).First();
            db.tblUsers.Remove(delUser);
            db.SaveChanges();

            gvUsers.EditIndex = -1;
            gvUsersBind();
        }
        #endregion

        #region gvUsers_OnRowCommand()
        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "ResetPWD")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int intUpdateID = Convert.ToInt32(gvUsers.DataKeys[rowIndex].Value.ToString());

                using (var db = new BioDataCore())
                {
                    var updateUsers = db.tblUsers.SingleOrDefault(b => b.intUserID == intUpdateID);
                    if (updateUsers != null)
                    {
                        updateUsers.strUserPWD = "8223B5C5A783DCA446F1105B34DB28A7";

                        db.SaveChanges();
                    }
                }

                gvUsers.EditIndex = -1;
                gvUsersBind();

                Response.Write("<script>alert('The password has been reset');</script>");
            }
        }
        #endregion

        #region btnAddUser_Click()
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("useradd.aspx");
        }
        #endregion

        #region btnRestAsmnts_Click()
        protected void btnRestAsmnts_Click(object sender, EventArgs e)
        {
            StringBuilder sbResetAsmts = new StringBuilder();
            sbResetAsmts.Append("delete from tblStations;");
            sbResetAsmts.Append("delete from tblWQAquaticVeg;");
            sbResetAsmts.Append("delete from tblWQInorgSubComp;");
            sbResetAsmts.Append("delete from tblWQInstreamFeat;");
            sbResetAsmts.Append("delete from tblWQLargeWoodyDebris;");
            sbResetAsmts.Append("delete from tblWQOrgSubComp;");
            sbResetAsmts.Append("delete from tblWQRipVeg;");
            sbResetAsmts.Append("delete from tblWQSedimentSub;");
            sbResetAsmts.Append("delete from tblWQStreamChar;");
            sbResetAsmts.Append("delete from tblWQSurveyInfo;");
            sbResetAsmts.Append("delete from tblWQWaterQuality;");
            sbResetAsmts.Append("delete from tblWQWatershedFeat;");
            sbResetAsmts.Append("delete from tblWQWeatherCond;");

            conn.Open();
            SqlCommand cmd = new SqlCommand(sbResetAsmts.ToString(), conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("main.aspx");
        }
        #endregion
    }
}