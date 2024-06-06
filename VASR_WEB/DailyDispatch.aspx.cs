using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace VASR_WEB
{
    public partial class DailyDispatch : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();

        string CS = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {



           // dispatchDateFilter.Text = DateTime.Today.ToString("yyyy-MM-dd");



        }


        public class Dispatch
        {

            public string VehicleName { get; set; }
            public string OperatorName { get; set; }


        }

        protected string GetStatusColor(object val)
        {
            string output = "text-success";
            if (Convert.ToInt16(val) > 1)
            {
                output = "text-danger";
            }
            return output;


        }

        protected void dispatchDateFilter_Load(object sender, EventArgs e)
        {
            
        }

        protected void dispatchDateFilter_TextChanged(object sender, EventArgs e)
        {
            txtDateFiltered.InnerText = DateTime.Parse(dispatchDateFilter.Text.ToString()).ToLongDateString();

        }


        protected string FormatDate(object inputDate)
        {
            string outputDate = "IN USE";
            if (!String.IsNullOrEmpty(inputDate.ToString()))
            {
                outputDate = DateTime.Parse(inputDate.ToString()).ToShortDateString();
            }
            return outputDate;




        }

        protected string FormatTime(object inputTime)
        {
            string ouputTime = "IN USE";
            if (!String.IsNullOrEmpty(inputTime.ToString()))
            {
                ouputTime = DateTime.Parse(inputTime.ToString()).ToShortTimeString();
            }


            return ouputTime;
        }

        protected void exportExelDispatch_ServerClick(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "DailyDispatch"+dispatchDateFilter.Text + ".xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = GetDatafromDatabase();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }



        protected DataTable GetDatafromDatabase()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("spFilterDailyDispatch", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;

                    DateTime datefilter = Convert.ToDateTime(dispatchDateFilter.Text);


                    cmd.Parameters.Add("@DateFilter", SqlDbType.Date).Value = datefilter ;
                  //  cmd.Parameters.Add("@DateFilter2", SqlDbType.Date).Value = datefilter.AddDays(1);



                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();

                    return dt;
                }
         


            }
          
        }

    }
}