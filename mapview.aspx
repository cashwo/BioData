<%@ Page Language="C#" %>
<%@ Import namespace="System.Text"%>
<%@ Import namespace="System.Configuration"%>
<%@ Import namespace="System.Data"%>
<%@ Import namespace="System.Data.SqlClient"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>Map View</title>
    
    <script type="text/javascript" src="jquery-3.3.1/jquery-3.3.1.js"></script>
    <script src="bootstrap-4.0.0-dist/js/bootstrap.js"></script>

    <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://js.arcgis.com/3.25/esri/css/esri.css">
    <link rel="stylesheet" href="open-iconic/font/css/open-iconic-bootstrap.css" />

    <style>
    html, form
	{
		height: 100%;
        font-size: 12px;
	}
	body
	{
		height: 100%;
		margin: 0;
		padding: 0;
		font-size: 12px;
		font-family: Verdana, Geneva, sans-serif;
	}
    #mapHeader{
        border-bottom: solid 2px #ffffff;
        padding: 5px;
        background-color: #52565b; 
        color: #fdb903;
        width: 100%;
    }
    #mapMenu{
        float: right;
    }
    #map {
        height: 100%;
    }
    #DataOptions{
        border-right: solid 2px #ffffff;
        float:left; 
        width: 230px;
        background-color: #52565b;
        padding: 5px;
        color: #fdb903;
        height: 100%;
    }
    #DataOptions{
        color: #000000;
    }
    </style>
    <script>
      var dojoConfig = { 
        paths: {
          extras: location.pathname.replace(/\/[^/]+$/, "") + "/extras"
        }
      };
    </script>
    <script src="https://js.arcgis.com/3.25/"></script>
    <script>
        var map;
        dojo.require("esri.map");
        require([
            "dojo/parser", 
            "dojo/ready",
            "dojo/_base/array",
            "esri/Color",
            "dojo/dom-style",
            "dojo/query",
            
            "esri/map", 
            "esri/request",
            "esri/graphic",
            "esri/geometry/Extent",

            "esri/symbols/SimpleMarkerSymbol",
            "esri/symbols/SimpleFillSymbol",
            "esri/symbols/PictureMarkerSymbol",
            "esri/renderers/ClassBreaksRenderer",

            "esri/layers/GraphicsLayer",
            "esri/SpatialReference",
            "esri/dijit/PopupTemplate",
            "esri/geometry/Point",
            "esri/geometry/webMercatorUtils",

            "extras/ClusterLayer",
            "dojo/on",
            "dojo/dom",
            "dijit/layout/BorderContainer", 
            "dijit/layout/ContentPane", 
            "dojo/domReady!"
        ], function (parser, ready, arrayUtils, Color, domStyle, query, Map, esriRequest, Graphic, Extent,
                        SimpleMarkerSymbol, SimpleFillSymbol, PictureMarkerSymbol, ClassBreaksRenderer,
                        GraphicsLayer, SpatialReference, PopupTemplate, Point, webMercatorUtils, ClusterLayer, on, dom) {

            <%
            string strBaseMap = "";
        
            if (Request.Form["cmbMapType"] == null || string.IsNullOrWhiteSpace(Request.Form["cmbMapType"]))
            {
                strBaseMap = "hybrid";
            }
            else
            {
                strBaseMap = Request.Form["cmbMapType"];
            }
            %>

            $('#cmbMapType option[value="<%Response.Write(strBaseMap);%>"]').prop("selected", "selected");

            map = new Map("map",{
                basemap: "<%Response.Write(strBaseMap);%>",
                center: [-80.710278, 38.664444],
                zoom: 8
            });

            <%
            //##############################################################
            // NEED TO FIX/ADD Remembering the previous extent
            //##############################################################
            //string strPrevExtent = "";
            //string strExtent = "";
            //if(Request.Form["hidXMIN"] != null)
            //{
                //strExtent = "new Extent(" + Request.Form["hidXMIN"] + "," + Request.Form["hidYMIN"] + "," + Request.Form["hidXMAX"] + "," + Request.Form["hidYMAX"] + ",new SpatialReference({wkid:4326}))";
                //strPrevExtent = "extent: new Extent({\"xmin\":" + Request.Form["hidXMIN"] + ",\"ymin\":" + Request.Form["hidYMIN"] + ",\"xmax\":" + Request.Form["hidXMAX"] + ",\"ymax\":" + Request.Form["hidYMAX"] + ",\"spatialReference\":{\"wkid\":4326}}),";

                //strPrevExtent = "var extPrevExtent = " + strExtent + ";\n";

                //Response.Write(strPrevExtent);
                //Response.Write("alert(extPrevExtent);");
                //Response.Write("console.log(extPrevExtent);");
                //Response.Write("map.setExtent(extPrevExtent);\n");
                //Response.Write("map.extent = extPrevExtent;\n");
            //}
            //##############################################################
            %>

            map.on("load", function () {
                //##############################################################
                // STATIONS: start loop
                //##############################################################
                <%
                string strSID = "";
                string jsonStations = "";
                string connString = ConfigurationManager.ConnectionStrings["BioData"].ConnectionString;
                string strSelectStations = "select * from tblStations";

                if(Request.QueryString["sid"] != null)
                {
                    strSID = Request.QueryString["sid"];
                    strSelectStations += " where intStationID = " + strSID;
                    Response.Write("document.getElementById(\"hidSID\").value = " + strSID + ";");
                }
                else if(Request.Form["hidSID"] != null && Request.Form["hidSID"] != "")
                {
                    strSID = Request.Form["hidSID"];
                    strSelectStations += " where intStationID = " + strSID;
                    Response.Write("document.getElementById(\"hidSID\").value = " + strSID + ";");
                }

                DataSet dsStations = new DataSet();
                SqlConnection conn = new SqlConnection(connString.ToString());
                conn.Open();
                SqlCommand cmd = new SqlCommand(strSelectStations.ToString(), conn);
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(strSelectStations, conn);
                adapter.Fill(dsStations);
                conn.Close();

                if (dsStations != null)
                {
                    if (dsStations.Tables[0].Rows.Count != 0)
                    {
                        jsonStations = "[";
                        foreach (DataRow row in dsStations.Tables[0].Rows)
                        {
                            jsonStations += "{\"vsStationNum\": \"" + row["strStationNum"] + "\", ";
                            jsonStations += "\"vsLocation\": \"" + row["strLocation"] + "\", ";
                            jsonStations += "\"vsRiverMile\": \"" + row["intRiverMile"] + "\", ";
                            jsonStations += "\"vsStreamClass\": \"" + row["strStreamClass"] + "\", ";
                            jsonStations += "\"vsLat\": \"" + row["fltLatitude"] + "\", ";
                            jsonStations += "\"vsLong\": \"" + row["fltLongitude"] + "\", ";
                            jsonStations += "\"vsRiverBasin\": \"" + row["strRiverBasin"] + "\", ";
                            jsonStations += "\"vsAgency\": \"" + row["strAgency"] + "\"";
                            jsonStations += "},";
                        }
                        jsonStations = jsonStations.TrimEnd(',');
                        jsonStations += "]";
                    }
                }

                Response.Write("var jsJSONData = " + jsonStations + ";");
                %>
				var stationInfo = {};
				var wgs = new SpatialReference({
					"wkid": 4326
                });

				stationInfo.data = arrayUtils.map(jsJSONData, function(s) {
					var latlng = new  Point(parseFloat(s.vsLong), parseFloat(s.vsLat), wgs);
                    var webMercator = webMercatorUtils.geographicToWebMercator(latlng);
                    
					var attributes = {
						"Stream Name": s.vsStreamName,
                        "Station Number": s.vsStationNum,
                        "Mile Point": s.vsRiverMile,
                        "Location": s.vsLocation,
                        "Stream Class": s.vsStreamClass,
						"Coordinates": s.vsLat + "," + s.vsLong,
						"River Basin": s.vsRiverBasin,
						"Agency": s.vsAgency
					};

					return {
						"x": webMercator.x,
						"y": webMercator.y,
						"attributes": attributes
					};
                });

				// popupTemplate to work with attributes specific to this dataset
				var popupTemplate = PopupTemplate({
					"title": "{Stream Name}",
					"fieldInfos": [
						{"fieldName": "Station Number",visible: true},
                        {"fieldName": "Mile Point",visible: true},
						{"fieldName": "Location",visible: true},
						{"fieldName": "Stream Class",visible: true},
						{"fieldName": "Coordinates",visible: true},
						{"fieldName": "River Basin",visible: true},
						{"fieldName": "Agency",visible: true}
					]});
				// cluster layer that uses OpenLayers style clustering
				clusterLayer = new ClusterLayer({
					"data": stationInfo.data,
					"distance": 100,
					"id": "clusters",
					"labelColor": "#fff",
					"labelOffset": 10,
					"resolution": map.extent.getWidth() / map.width,
					"singleColor": "#888",
					"singleTemplate": popupTemplate
				});
				var defaultSym = new SimpleMarkerSymbol().setSize(4);
				var renderer = new ClassBreaksRenderer(defaultSym, "clusterCount");

				var picBaseUrl = "http://static.arcgis.com/images/Symbols/Shapes/";
				var blue = new PictureMarkerSymbol(picBaseUrl + "BluePin1LargeB.png", 32, 32).setOffset(0, 15);
				var green = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 64, 64).setOffset(0, 15);
				var red = new PictureMarkerSymbol(picBaseUrl + "RedPin1LargeB.png", 72, 72).setOffset(0, 15);
				renderer.addBreak(0, 2, blue);
				renderer.addBreak(2, 200, green);
				renderer.addBreak(200, 1001, red);

				clusterLayer.setRenderer(renderer);
                map.addLayer(clusterLayer);

                //#############################################################################
                // creating tile layers
                //#############################################################################
                <%
                string strSelectLayerList = "select intGMS, strGMSURL, strGMSName from tblGISMapServices order by strGMSName ASC";
                string strJSCreateTileLayer = "";

                DataSet dsLayerList = new DataSet();
                SqlConnection connTL = new SqlConnection(connString.ToString());
                connTL.Open();
                SqlCommand cmdTL = new SqlCommand(strSelectLayerList.ToString(), connTL);
                SqlDataAdapter adapterTL = new SqlDataAdapter();
                adapterTL.SelectCommand = new SqlCommand(strSelectLayerList, connTL);
                adapterTL.Fill(dsLayerList);
                connTL.Close();

                if (dsLayerList != null)
                {
                    if (dsLayerList.Tables[0].Rows.Count != 0)
                    {
                        foreach (DataRow row in dsLayerList.Tables[0].Rows)
                        {
                            strJSCreateTileLayer = "var " + row["strGMSName"].ToString().Replace(" ", "");
                            strJSCreateTileLayer += " = esri.layers.ArcGISDynamicMapServiceLayer(\"";
                            strJSCreateTileLayer += row["strGMSURL"]  + "\");\n\n";
                            //strJSCreateTileLayer += "map.addLayer(" + row["strGMSName"].ToString().Replace(" ", "") + ");\n\n";

                            strJSCreateTileLayer += "on(dom.byId(\"chk" + row["intGMS"] + "\"), \"change\", vis" + row["intGMS"] + ");\n";

                            strJSCreateTileLayer += "function vis" + row["intGMS"] + "() {\n";
                            strJSCreateTileLayer += "if(dom.byId(\"chk" + row["intGMS"] + "\").checked == true) {\n";
                            strJSCreateTileLayer += "map.addLayer(" + row["strGMSName"].ToString().Replace(" ", "") + ");\n";
                            strJSCreateTileLayer += "}\n";
                            strJSCreateTileLayer += "else if(dom.byId(\"chk" + row["intGMS"] + "\").checked == false) {\n";
                            strJSCreateTileLayer += "map.removeLayer(" + row["strGMSName"].ToString().Replace(" ", "") + ")\n";
                            strJSCreateTileLayer += "}\n";
                            strJSCreateTileLayer += "}\n\n";

                            Response.Write(strJSCreateTileLayer);


                            if(Request.Form["chk" + row["intGMS"]] != null){
                                Response.Write("$(\"#chk" + row["intGMS"] + "\").prop(\"checked\", true );\n");
                                Response.Write("vis" + row["intGMS"] + "();\n");
                            }
                        }
                    }
                }
                %>
                //#############################################################################

				// close the info window when the map is clicked
				map.on("click", cleanUp);
				// close the info window when esc is pressed
				map.on("key-down", function(e) {
					if (e.keyCode === 27) {
						cleanUp();
					}
				});
            });

            //#################################################################################
            // extent
            //#################################################################################
            /*
            dojo.connect(map, "onExtentChange", setExtent);

            function setExtent(extent) {
                var s = "";
                s = "XMin: "+ extent.xmin.toFixed(2) + "&nbsp;"
                    +"YMin: " + extent.ymin.toFixed(2) + "&nbsp;"
                    +"XMax: " + extent.xmax.toFixed(2) + "&nbsp;"
                    +"YMax: " + extent.ymax.toFixed(2);
                dojo.byId("ExtentInfo").innerHTML = s;

                document.getElementById("hidXMIN").value = extent.xmin.toFixed(2);
                document.getElementById("hidYMIN").value = extent.ymin.toFixed(2);
                document.getElementById("hidXMAX").value = extent.xmax.toFixed(2);
                document.getElementById("hidYMAX").value = extent.ymax.toFixed(2);
            }
            */
            //#################################################################################

			function cleanUp() {
				map.infoWindow.hide();
				clusterLayer.clearSingles();
				clFish.clearSingles();
				clMay.clearSingles();
			}

			function error(err) {
				console.log("something failed: ", err);
			}
        });
  </script>
</head>
<body>
    <form id="frmMap" name="frmMap" method="post" action="mapview.aspx">
        <input type="hidden" id="hidSID" name="hidSID" />
        <input type="hidden" id="hidXMIN" name="hidXMIN" />
        <input type="hidden" id="hidYMIN" name="hidYMIN" />
        <input type="hidden" id="hidXMAX" name="hidXMAX" />
        <input type="hidden" id="hidYMAX" name="hidYMAX" />
        <div id="mapHeader">
            <span style="font-weight: bolder; font-size: 20px;">EDS&#58; BioData Map Viewer</span>
            <!--<span id="ExtentInfo"></span>-->
        </div>
        <div id="DataOptions">
            <div id="MapOptions" class="card">
                <div class="card-header">
                    <strong>Map Options</strong>
                </div>
                <div class="card-body">
                    ESRI Base Map
        	        <select id="cmbMapType" name="cmbMapType" onchange="ChangeBaseMap()">
				        <option value="hybrid">Hybrid</option>
				        <option value="streets">Streets</option>
				        <option value="topo">Topo</option>
			        </select>
                </div>
            </div>
            <br />
            <div id="LayerList" class="card">
                <div class="card-header">
                    <strong>Layer List</strong>
                </div>
                <div class="card-body">
                    <span id="spLayerList" runat="server">
                        <%
                            string strJSONLayerList = "";
                            string strJSCreateTileLayer = "<script>\n";
                            StringBuilder sbLayerListHTML = new StringBuilder();
                            String connString = ConfigurationManager.ConnectionStrings["BioData"].ConnectionString;
                            string strSelectLayerList = "select intGMS, strGMSURL, strGMSName from tblGISMapServices order by strGMSName ASC";
                            DataSet dsLayerList = new DataSet();
                            SqlConnection conn = new SqlConnection(connString.ToString());
                            conn.Open();
                            SqlCommand cmd = new SqlCommand(strSelectLayerList.ToString(), conn);
                            SqlDataAdapter adapter = new SqlDataAdapter();
                            adapter.SelectCommand = new SqlCommand(strSelectLayerList, conn);
                            adapter.Fill(dsLayerList);
                            conn.Close();

                            if (dsLayerList != null)
                            {
                                if (dsLayerList.Tables[0].Rows.Count != 0)
                                {
                                    strJSONLayerList = "{";
                                    sbLayerListHTML.Append("<table width='100%'>");
                                    foreach (DataRow row in dsLayerList.Tables[0].Rows)
                                    {
                                        // HTML Table
                                        sbLayerListHTML.Append("<tr>");
                                        //sbLayerListHTML.Append("<td><input type='checkbox'  id='chk" + row["intGMS"] + "' name='chk" + row["intGMS"] + "' value='" + row["intGMS"] + "' onchange='DisplayLayer($(this).get(0).value)' /></td>");
                                        sbLayerListHTML.Append("<td><input type='checkbox'  id='chk" + row["intGMS"] + "' name='chk" + row["intGMS"] + "' value='" + row["intGMS"] + "' /></td>");
                                        sbLayerListHTML.Append("<td>" + row["strGMSName"] + "</td>");
                                        sbLayerListHTML.Append("</tr>");

                                        // JSON Data
                                        strJSONLayerList += "\"" + row["intGMS"] + "\":\"" + row["strGMSURL"] + "\",";

                                        strJSCreateTileLayer += "var " + row["strGMSName"].ToString().Replace(" ","");
                                        strJSCreateTileLayer += " = new TileLayer({";
                                        strJSCreateTileLayer += "url: \"" + row["strGMSURL"]  + "\"";
                                        strJSCreateTileLayer += "});\n";

                                    }
                                    sbLayerListHTML.Append("</table>");
                                    strJSONLayerList = strJSONLayerList.TrimEnd(',');
                                    strJSONLayerList += "}";
                                    Response.Write(sbLayerListHTML.ToString());

                                    Response.Write("<input type='hidden' id='jsonLayerList' value='" + strJSONLayerList + "'>");
                                }

                            }
                        %>
                    </span>
                </div>
            </div>
        </div>
        <div id="map" data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'center'"></div>
    </form>
</body>
</html>
<script>
    function ChangeBaseMap() {
        document.getElementById("frmMap").submit();
    }
</script>