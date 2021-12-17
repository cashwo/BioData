#region namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Core.Data.BioData.Models;
#endregion

namespace BioData
{
    public partial class _default2 : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        #endregion

        #region btnLogin_Click()
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string strDefaultPWD = "!Passw0rd"; //8223B5C5A783DCA446F1105B34DB28A7
            clsSecFunc objSecFunc = new clsSecFunc();
            clsDataFunc objDataFunc = new clsDataFunc();
            string strUserName = txtUID.Text;
            string strPassword = txtPWD.Text;
            string hashPassword = objSecFunc.CalculateMD5Hash(strPassword);

            var qryUsers = db.tblUsers
                    .Where(s => s.strUserName == strUserName && s.strUserPWD == hashPassword.ToString()).ToList();

            if(qryUsers.Count > 0)
            {
                //valid user
                lblErrMsg.Text = "";

                //set session variables
                Session["userID"] = qryUsers[0].intUserID;
                Session["roleID"] = qryUsers[0].intRoleID;

                if (qryUsers[0].strUserPWD == "8223B5C5A783DCA446F1105B34DB28A7")
                {
                    //user needs to change their password
                    Response.Redirect("chngpwd.aspx");
                }
                else
                {
                    Response.Redirect("main.aspx");
                }
            }
            else
            {
                //invalid user
                lblErrMsg.Text = "Invalid User";
            }
        }
        #endregion
    }
}