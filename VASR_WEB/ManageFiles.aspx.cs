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
    public partial class ManageFiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();

        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Data,FileType,FileName from tblDailyInspectionUploads where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["FileType"].ToString();
                        fileName = sdr["FileName"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
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
                        string insertDocument = "insert into tblDailyInspectionUploads values (@DailyInspectionID,@FileType,@Data,@FileName)";
                        using (SqlCommand cmd = new SqlCommand(insertDocument, con))
                        {
                            cmd.Parameters.AddWithValue("@DailyInspectionID", Convert.ToInt32(Request.QueryString["DispatchID"].ToString()));
                            cmd.Parameters.AddWithValue("@FileType", contentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@FileName", fileName);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();


                        }

                    }

                }

            }
            BindGrid();


        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select ID, FileName,FileType from tblDailyInspectionUploads where DailyInspectionID=" + Request.QueryString["DispatchID"].ToString();
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }

        }



    }
}