using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class SuperAdminDashboard : System.Web.UI.Page
    {
        ApplicationUserManager userMgr;
        ApplicationRoleManager roleMgr;

        VASRDatabaseEntities ctx = new VASRDatabaseEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            userMgr = Context.GetOwinContext().Get<ApplicationUserManager>();
            roleMgr = Context.GetOwinContext().Get<ApplicationRoleManager>();
       

        }

        protected void btnAddtoIMDAdmin_Click(object sender, EventArgs e)
        {
            var getASPnetUserID = ctx.AspNetUsers
                      .Where(x => x.Email == txtIMDAdminEmail.Text).First();

            userMgr.AddToRole(getASPnetUserID.Id, "IMD Admin");


        }

        protected void btnAddtoMasterDriver_Click(object sender, EventArgs e)
        {
            var getASPnetUserID = ctx.AspNetUsers
                      .Where(x => x.Email == txtMasterDriverEmail.Text).First();

            userMgr.AddToRole(getASPnetUserID.Id, "Master Driver");


        }

        protected void btnAddtoManager_Click(object sender, EventArgs e)
        {
            var getASPnetUserID = ctx.AspNetUsers
                                  .Where(x => x.Email == txtManagerEmail.Text).First();

            userMgr.AddToRole(getASPnetUserID.Id, "Managers");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            IdentityRole role = new IdentityRole();
            role.Name = txtRole.Text;
            IdentityResult result = roleMgr.Create(role);
            if (result.Succeeded)
            {
                admin_name.InnerText = "New Role Created! ";


            }
        }
    }
}