using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace VASR_WEB
{
    public partial class Operators : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        string CS = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateadd30 = DateTime.Today.AddDays(30);

            var list = ctx.tblVehicleOperators.ToList();

            if (User.IsInRole("Dept. Manager"))
            {
                var userID = User.Identity.GetUserId();

                var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                string section = sectionAssigned.Section.ToString().Substring(0, 2);

                ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                ListViewOperatorsAll.DataBind();
            }
            else
            {
                ListViewOperatorsAll.DataSource = list;
                ListViewOperatorsAll.DataBind();
            }


  


            ListView30Expire.DataSource = ctx.tblVehicleOperators
                                          .Where(x => x.LicenseExpiryDate < dateadd30)
                                          .ToList();
            ListView30Expire.DataBind();

            ListViewExpired.DataSource = ctx.tblVehicleOperators
                                         .Where(x => x.LicenseExpiryDate < DateTime.Today)
                                         .ToList();
            ListViewExpired.DataBind();






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

        protected void txtfilterOperators_TextChanged(object sender, EventArgs e)
        {
            int skip = 0;
            int take = 15;


            if (String.IsNullOrEmpty(txtfilterOperators.Text))
            {

                var list = ctx.tblVehicleOperators.ToList();

                if (User.IsInRole("Dept. Manager"))
                {
                    var userID = User.Identity.GetUserId();

                    var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                    string section = sectionAssigned.Section.ToString().Substring(0, 2);


                    ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                    ListViewOperatorsAll.DataBind();
                }
                else
                {
                    ListViewOperatorsAll.DataSource = list;
                    ListViewOperatorsAll.DataBind();
                }

            }
            else
            {
                if (operatorSearchSelector.SelectedValue.ToString().Contains("Name"))
                {
                    var list = ((from o in ctx.tblVehicleOperators
                                 where o.FullName.Contains(txtfilterOperators.Text)
                                 select o).OrderBy(x => x.FullName).Skip(skip).Take(take)).ToList();


                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        string section = sectionAssigned.Section.ToString().Substring(0, 2);


                        ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                        ListViewOperatorsAll.DataBind();
                    }
                    else
                    {
                        ListViewOperatorsAll.DataSource = list;
                        ListViewOperatorsAll.DataBind();
                    }
                }
                else if (operatorSearchSelector.SelectedValue.ToString().Contains("Section"))
                {
                    var list = ((from o in ctx.tblVehicleOperators
                                 where o.Section.Contains(txtfilterOperators.Text)
                                 select o).OrderBy(x => x.Section).Skip(skip).Take(take)).ToList();


                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        string section = sectionAssigned.Section.ToString().Substring(0, 2);


                        ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                        ListViewOperatorsAll.DataBind();
                    }
                    else
                    {
                        ListViewOperatorsAll.DataSource = list;
                        ListViewOperatorsAll.DataBind();
                    }
                }
                //else if (operatorSearchSelector.SelectedValue.ToString().Contains("Code"))
                //{
                //    var list = ((from o in ctx.tblVehicleOperators
                //                 where o.OperatorLicenseCode == Convert.ToInt32(txtfilterOperators.Text)
                //                 select o).OrderBy(x => x.OperatorLicenseCode).Skip(skip).Take(take)).ToList();



                //    ListViewOperatorsAll.DataSource = list;

                //    ListViewOperatorsAll.DataBind();

                //}
                else if (operatorSearchSelector.SelectedValue.ToString().Contains("Location"))
                {
                    var list = ((from o in ctx.tblVehicleOperators
                                 where o.Location.Contains(txtfilterOperators.Text)
                                 select o).OrderBy(x => x.Location).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        string section = sectionAssigned.Section.ToString().Substring(0, 2);


                        ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                        ListViewOperatorsAll.DataBind();
                    }
                    else
                    {
                        ListViewOperatorsAll.DataSource = list;
                        ListViewOperatorsAll.DataBind();
                    }

                }
                else
                {
                    var list = ((from o in ctx.tblVehicleOperators
                                 where o.OperatorNum.Contains(txtfilterOperators.Text)
                                 select o).OrderBy(x => x.OperatorNum).Skip(skip).Take(take)).ToList();

                    if (User.IsInRole("Dept. Manager"))
                    {
                        var userID = User.Identity.GetUserId();

                        var sectionAssigned = ctx.tblDeptManagerSections.Where(x => x.UserID == userID).Single();

                        string section = sectionAssigned.Section.ToString().Substring(0, 2);


                        ListViewOperatorsAll.DataSource = list.Where(x => x.Section.Contains(section)).ToList();
                        ListViewOperatorsAll.DataBind();
                    }
                    else
                    {
                        ListViewOperatorsAll.DataSource = list;
                        ListViewOperatorsAll.DataBind();
                    }

                }




            }



        }

        protected void btnAddOperator_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewOperator.aspx");
        }

        protected void btnExportOperators_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "OperatorList_" + DateTime.Now.Date.ToString("d") + ".xls"));
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
                using (SqlCommand cmd = new SqlCommand("spExportToExcelOperator", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;


                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();

                    return dt;
                }



            }

        }


    }
}