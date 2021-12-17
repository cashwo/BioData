#region namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
#endregion

namespace BioData
{
    public partial class _default : System.Web.UI.MasterPage
    {
        #region Page_Load()
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["roleID"] != null)
            {
                int intUserID = Convert.ToInt32(Session["userID"]);
                int intUserRole = Convert.ToInt32(Session["roleID"]);

                if (intUserRole == 1)
                {
                    hlSetting.Visible = true;
                    hlAdmin.Visible = true;
                }
                else
                {
                    hlSetting.Visible = false;
                    hlAdmin.Visible = false;
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
            
        }
        #endregion
    }
}