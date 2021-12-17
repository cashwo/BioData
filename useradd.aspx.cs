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
    public partial class useradd : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clsDataFunc objDataFunc = new clsDataFunc();

                DataSet dsUserRoleCMB = objDataFunc.GetDataset("SELECT intUserRoleID, strUserRoleDesc FROM tblUserRoles");
                cmbUserRoleAdd.DataSource = dsUserRoleCMB;
                cmbUserRoleAdd.DataTextField = "strUserRoleDesc";
                cmbUserRoleAdd.DataValueField = "intUserRoleID";
                cmbUserRoleAdd.DataBind();
                cmbUserRoleAdd.Items.Insert(0, new ListItem(String.Empty, "0"));

                DataSet dsAcctTypeCMB = objDataFunc.GetDataset("SELECT intAcctTypeID, strAcctType FROM tblAccountType");
                cmbAcctTypeAdd.DataSource = dsAcctTypeCMB;
                cmbAcctTypeAdd.DataTextField = "strAcctType";
                cmbAcctTypeAdd.DataValueField = "intAcctTypeID";
                cmbAcctTypeAdd.DataBind();
                cmbAcctTypeAdd.Items.Insert(0, new ListItem(String.Empty, "0"));
            }
        }
        #endregion

        #region btnAddUser_Click
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            var insertUser = new tblUser()
            {
                intRoleID = Int32.Parse(cmbUserRoleAdd.SelectedItem.Value),
                intAcctTypeID = Int32.Parse(cmbAcctTypeAdd.SelectedItem.Value),
                strUserName = txtUserNameAdd.Text,
                strUserPWD = "8223B5C5A783DCA446F1105B34DB28A7",
                strUserFName = txtUserFNameAdd.Text,
                strUserMName = txtUserMNameAdd.Text,
                strUserLName = txtUserLNameAdd.Text,
                intUserActive = 1
            };

            var db = new BioDataCore();
            db.tblUsers.Add(insertUser);
            db.SaveChanges();

            Response.Redirect("admin.aspx");
        }
        #endregion
    }
}