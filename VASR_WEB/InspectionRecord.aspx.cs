using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class InspectionRecord : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        int inspection = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int dispatchID = Convert.ToInt32(Request.QueryString["ID"]);

            var inspectId = ctx.tblDailyInspections.Where(x => x.DispatchID == dispatchID).First();
            inspection = inspectId.ID;

            ListView lvAttachedPhotos = (ListView)FormView1.FindControl("lvInspectionRecordsPhoto");
            lvAttachedPhotos.DataSource = ctx.tblDailyInspectionUploads
                                        .Where(x => x.FileType.Contains("image") && x.DailyInspectionID == dispatchID)
                                        .ToList();
            lvAttachedPhotos.DataBind();

            ListView lvAttachedDocs = (ListView)FormView1.FindControl("lvInspectionRecordDocs");
            lvAttachedDocs.DataSource = ctx.tblDailyInspectionUploads
                                        .Where(x => x.FileType.Contains("application") && x.DailyInspectionID == dispatchID)
                                        .ToList();
            lvAttachedDocs.DataBind();
                       
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

        protected void btnManageFiles_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccidentReport.aspx?DispatchID=" + Request.QueryString["ID"].ToString());

        }

        protected void ManageFiles_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageFiles.aspx?ID="+inspection);

        }
    }
}