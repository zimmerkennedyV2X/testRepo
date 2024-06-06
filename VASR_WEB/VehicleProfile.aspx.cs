using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class VehicleProfile : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();

            if (!IsPostBack)
            {
                BindVehiclePhotos();
            }



        }

        private void BindVehiclePhotos()
        {
            //ListView lvVehiclePhotos = (ListView)FormView1.FindControl("lvVehiclePhotos");
            //int vehicleID = Convert.ToInt32(Request.QueryString["ID"]);

            //lvVehiclePhotos.DataSource = ctx.tblVehiclePhotos
            //                             .Where(x => x.VehicleID == vehicleID).ToList();
            //lvVehiclePhotos.DataBind();

            Repeater lvVehiclePhotos = (Repeater)FormView1.FindControl("lvVehiclePhotos");
            int vehicleID = Convert.ToInt32(Request.QueryString["ID"]);

            lvVehiclePhotos.DataSource = ctx.tblVehiclePhotos
                                         .Where(x => x.VehicleID == vehicleID).ToList();
            lvVehiclePhotos.DataBind();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateUsageRecords.aspx?VehicleID=" + Request.QueryString["ID"].ToString());

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



        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select ID, FileName,WeeklyInspectionDate from tblCLVBWeeklyInspections where VehicleID=" + Request.QueryString["ID"].ToString();
                    cmd.Connection = con;
                    con.Open();
                    lvWeeklyInspections.DataSource = cmd.ExecuteReader();
                    lvWeeklyInspections.DataBind();
                    con.Close();
                }
            }

        }

        protected void btnUploadWeekly_Click(object sender, EventArgs e)
        {
            weeklyInspectionUploader.Visible = true;

        }

        protected void btnUploadDocuments_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string insertDocument = "insert into tblCLVBWeeklyInspections values (@WeeklyInspectionDate,@WeeklyInspector,@WeeklyInspectionSheet,@VehicleID,@FileName)";
                        using (SqlCommand cmd = new SqlCommand(insertDocument, con))
                        {
                            cmd.Parameters.AddWithValue("@WeeklyInspectionDate", DateTime.Now.Date);
                            cmd.Parameters.AddWithValue("@WeeklyInspector", User.Identity.Name.ToString());
                            cmd.Parameters.AddWithValue("@WeeklyInspectionSheet", bytes);
                            cmd.Parameters.AddWithValue("@VehicleID", Convert.ToInt32(Request.QueryString["ID"].ToString()));
                            cmd.Parameters.AddWithValue("@FileName", fileName);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();


                        }

                    }

                }

            }
            BindGrid();
            weeklyInspectionUploader.Visible = false;


        }

        protected void downloadDoc_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select WeeklyInspectionSheet,FileName from tblCLVBWeeklyInspections where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["WeeklyInspectionSheet"];

                        fileName = sdr["FileName"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkUploadPhotos_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirmReservationPop", "$('#confirmReservationPop').modal();", true);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
            string contentType = FileUpload2.PostedFile.ContentType;
            using (Stream fs = FileUpload2.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string insertDocument = "insert into tblVehiclePhotos values (@VehiclePictures,@VehicleID,@PhotoFileName)";
                        using (SqlCommand cmd = new SqlCommand(insertDocument, con))
                        {

                            cmd.Parameters.AddWithValue("@VehiclePictures", bytes);
                            cmd.Parameters.AddWithValue("@PhotoFileName", fileName);
                            cmd.Parameters.AddWithValue("@VehicleID", Convert.ToInt32(Request.QueryString["ID"].ToString()));

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();


                        }

                    }

                }

            }
            BindVehiclePhotos();
        }
    }
}