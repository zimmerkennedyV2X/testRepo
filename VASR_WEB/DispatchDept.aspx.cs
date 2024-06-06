using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
   
    public partial class DispatchDept : System.Web.UI.Page
    {

        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var userID = User.Identity.GetUserId();

            var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

            title.InnerText = "Vehicles Currently Dispatched for " + sectionAssigned.Section.ToString();

            Section.Value = sectionAssigned.Section.ToString().Trim();

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
    }
}