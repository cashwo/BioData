#region namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
#endregion

namespace BioData
{
    public class clsDataFunc
    {
        #region GetDataset()
        public DataSet GetDataset(string query)
        {
            DataSet dsReturn = new DataSet();
            String connString = ConfigurationManager.ConnectionStrings["BioData"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString.ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query.ToString(), conn);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);
            adapter.Fill(dsReturn);
            conn.Close();

            return dsReturn;
        }
        #endregion
    }
}