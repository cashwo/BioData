#region namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Core.Data.BioData.Models;
#endregion

namespace BioData
{
    public class clsAppFunc
    {
        #region GetStationNameNum()
        public string GetStationNameNum(int intStationID)
        {
            string strStationNameNum = "";

            BioDataCore db = new BioDataCore();
            var qryStationName = db.tblStations
                .Where(s => s.intStationID == intStationID).SingleOrDefault();

            if(qryStationName is null)
            {
                strStationNameNum = "Station Not Found";
            }
            else
            {
                strStationNameNum = qryStationName.strStreamName + " (" + qryStationName.strStationNum + ")";
            }
            

            return strStationNameNum;
        }
        #endregion
    }
}