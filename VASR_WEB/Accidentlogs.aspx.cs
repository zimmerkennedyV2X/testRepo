using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class Accidentlogs : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            lvAccidentLogs.DataSource = ctx.viewVehicleInspectionRecords
                                              .Where(x => x.InspectionDateCompleted != null && x.IsMVA == true)
                                              .OrderByDescending(x => x.EndDate)
                                              .ToList();
            lvAccidentLogs.DataBind();

        }

        protected void txtfilterAccidentRecord_TextChanged(object sender, EventArgs e)
        {

        }
    }
}