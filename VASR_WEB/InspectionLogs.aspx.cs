using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class InspectionLogs : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            lvDailyInspections.DataSource = ctx.viewVehicleInspectionRecords
                                            .Where(x=>x.InspectionDateCompleted != null)
                                            .OrderByDescending(x => x.EndDate)
                                            .ToList();
            lvDailyInspections.DataBind();

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

        protected void txtfilterInspectionRecord_TextChanged(object sender, EventArgs e)
        {

        }
    }
}