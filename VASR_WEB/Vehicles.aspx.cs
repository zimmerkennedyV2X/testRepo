using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronBarCode;
using Microsoft.AspNet.Identity;

namespace VASR_WEB
{
    public partial class Vehicles : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        string CS = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateadd60 = DateTime.Today.AddDays(60);


            var list = ctx.tblVehicleFleets.ToList();

            if (User.IsInRole("Dept. Manager"))
            {
                var userID = User.Identity.GetUserId();

                var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();


                list = ctx.tblVehicleFleets
                                .Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();

                ListViewVehicleAll.DataSource = list;
                ListViewVehicleAll.DataBind();
            }
            else
            {

                ListViewVehicleAll.DataSource = list;
                ListViewVehicleAll.DataBind();
            }


            ListView30VehiclesExpired.DataSource = ctx.tblVehicleFleets
                                          .Where(x => x.RegExpiry < dateadd60)
                                          .ToList();
            ListView30VehiclesExpired.DataBind();

            ListViewVehiclesExpired.DataSource = ctx.tblVehicleFleets
                                         .Where(x => x.RegExpiry < DateTime.Today)
                                         .ToList();
            ListViewVehiclesExpired.DataBind();



        }

        protected void txtfilterVehicles_TextChanged(object sender, EventArgs e)
        {

            int skip = 0;
            int take = 20;


            if (String.IsNullOrEmpty(txtfilterVehicles.Text))
            {

                var list = ctx.tblVehicleFleets.ToList();

                if (User.IsInRole("Dept. Manager"))
                {
                    var userID = User.Identity.GetUserId();

                    var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                    list = ctx.tblVehicleFleets
                                    .Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();

                    ListViewVehicleAll.DataSource = list;
                    ListViewVehicleAll.DataBind();
                }
                else
                {

                    ListViewVehicleAll.DataSource = list;
                    ListViewVehicleAll.DataBind();
                }



            }
            else
            {
                if (vehicleSearchSelector.SelectedValue.ToString().Contains("Admin Number"))
                {


                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.AdminNumber.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.AdminNumber).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();


                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }



                }
                else if (vehicleSearchSelector.SelectedValue.ToString().Contains("Department"))
                {


                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.Section.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.Section).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();


                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }


                }

                else if (vehicleSearchSelector.SelectedValue.ToString().Contains("Model"))
                {


                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.Model.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.Model).Skip(skip).Take(take)).ToList();
                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();


                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }


                }

                else
                {


                    var list = ((from v in ctx.tblVehicleFleets
                                 where v.PlateNumber.Contains(txtfilterVehicles.Text.ToString())
                                 select v).OrderBy(x => x.PlateNumber).Skip(skip).Take(take)).ToList();


                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();


                        ListViewVehicleAll.DataSource = list.Where(x => x.Section.Contains(sectionAssigned.Section.ToString().Trim())).ToList();
                        ListViewVehicleAll.DataBind();
                    }
                    else
                    {
                        ListViewVehicleAll.DataSource = list;
                        ListViewVehicleAll.DataBind();
                    }


                }





            }





        }

        protected string GetStatusColor(object val)
        {
            string output = "text-success";
            if (!(bool)val)
            {
                output = "text-danger";
            }
            return output;


        }

        protected void btnExportVehicles_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "IMD_VehicleList_" + DateTime.Now.Date.ToString("d") + ".xls"));
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
                using (SqlCommand cmd = new SqlCommand("spExportToExcel", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();

                    return dt;
                }



            }

        }

        protected void btnAddOperator_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewVehicle.aspx");
        }

        protected void lnkAddVehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewVehicle.aspx");
        }

        protected void lnkExportVehicles_Click(object sender, EventArgs e)
        {

        }

        //protected void btnAddNewVehicle_Click(object sender, EventArgs e)
        //{
        //    var insertNewVehicle = new tblVehicleFleet()
        //    {
        //        AdminNumber = VehicleAdminNumberText.Text,
        //        PlateNumber = VehiclePlateNumberText.Text,
        //        Model = ModelText.Text,
        //        RegExpiry = DateTime.Parse(RegistrationExpiryText.Text.ToString()),
        //        CurrentMileage=CurrentMileageText.Text,
        //        CurrentFuelLevel = CurrentFuelTankLevelText.Text,
        //        DueMileage = DueMileageText.Text

        //    };

        //    ctx.tblVehicleFleets.Add(insertNewVehicle);
        //    ctx.SaveChanges();


        //}


    }
}