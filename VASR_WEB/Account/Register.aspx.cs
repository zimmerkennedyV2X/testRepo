using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using VASR_WEB.Models;

namespace VASR_WEB.Account
{
    public partial class Register : Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);


            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                //signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

                manager.AddToRole(user.Id, DDL_Role.SelectedValue);

                if (DDL_Role.SelectedValue.Contains("Dept. Manager"))
                {
                    var adddeptmanger = new tblDeptManagerSection
                    {
                        Section = DDL_Department.SelectedValue,
                        UserID = user.Id
                        
                    };

                    ctx.tblDeptManagerSections.Add(adddeptmanger);
                    ctx.SaveChanges();


                }

                Response.Redirect("../Default.aspx");

                
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}