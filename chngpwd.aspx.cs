#region namspaces
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
    public partial class chngpwd : System.Web.UI.Page
    {
        private BioDataCore db = new BioDataCore();

        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region btnChangePWD_Click()
        protected void btnChangePWD_Click(object sender, EventArgs e)
        {
            Boolean blnSuccessOldPWD = false;
            Boolean blnSuccessNewPWD = false;
            lblErrMsg.Text = "";
            clsSecFunc objSecFunc = new clsSecFunc();
            clsDataFunc objDataFunc = new clsDataFunc();
            string strOldPWD = objSecFunc.CalculateMD5Hash(Request.Form["txtOldPWD"]);
            string strNewPWD1 = objSecFunc.CalculateMD5Hash(Request.Form["txtNewPWD1"]);
            string strNewPWD2 = objSecFunc.CalculateMD5Hash(Request.Form["txtNewPWD2"]);
            int intUserID = Int32.Parse(Session["userID"].ToString());

            var qryUsers = db.tblUsers
                .Where(s => s.intUserID == intUserID).ToList();

            if (qryUsers[0].strUserPWD == strOldPWD)
            {
                blnSuccessOldPWD = true;
            }
            else
            {
                blnSuccessOldPWD = false;
                lblErrMsg.Text = "The old password is not valid";
            }

            //check if new passwords match
            if (strNewPWD1 != strNewPWD2)
            {
                lblErrMsg.Text = "The new password do not match";
                blnSuccessNewPWD = false;
            }
            else if (strNewPWD1 == "8223B5C5A783DCA446F1105B34DB28A7" || strNewPWD2 == "8223B5C5A783DCA446F1105B34DB28A7")
            {
                lblErrMsg.Text = "Your password can not be the default password";
                blnSuccessNewPWD = false;
            }
            else
            {
                blnSuccessNewPWD = true;
            }
            
            if(blnSuccessOldPWD == true && blnSuccessNewPWD == true)
            {
                using (var db = new BioDataCore())
                {
                    var updatePassword = db.tblUsers.SingleOrDefault(b => b.intUserID == intUserID);
                    if (updatePassword != null)
                    {
                        updatePassword.strUserPWD = strNewPWD1;

                        db.SaveChanges();
                    }
                }

                Response.Redirect("main.aspx");
            }
        }
        #endregion
    }
}