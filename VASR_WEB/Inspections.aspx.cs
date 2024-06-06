using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class Inspections : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void inspectionDateFilter_TextChanged(object sender, EventArgs e)
        {

        }

        protected void exportExelInspections_ServerClick(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            e.Command.Parameters["@DateFilter"].Value= DateTime.Now;

        }

        protected string FormatInspectionDate(object inputDate)
        {
            string outputDate = "Not Inspected";
            if (!String.IsNullOrEmpty(inputDate.ToString()))
            {
                outputDate = DateTime.Parse(inputDate.ToString()).ToShortDateString();
            }
            return outputDate;




        }

        protected string GetColor(object val)
        {
            string outputDate = "text-danger";
            if (!String.IsNullOrEmpty(val.ToString()))
            {
                outputDate = "text-default";
            }
            return outputDate;


        }

        protected void redirectToInspectionLogs_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionLogs.aspx");
        }
    }
}