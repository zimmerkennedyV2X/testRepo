using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class UpdateUsageRecords : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        string startmileage, fuelTankLevel;
        int vehicleId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int vehicleId = Convert.ToInt32(Request.QueryString["VehicleID"].ToString());

            if (true)
            {
                panelDispatch_VehicleDetails.Visible = true;
                panelDispatch_VehicleUnavailable.Visible = false;
                var vehicleCollection = ctx.tblVehicleFleets
                                                  .Where(v => v.ID == vehicleId)
                                                  .ToList();

                foreach (var item in vehicleCollection)
                {
                    lblDispatch_AdminNumber.InnerText = item.AdminNumber.ToString();
                    lblDispatch_Model.InnerText = item.Model.ToString();
                    lblDispatch_PlateNumber.InnerText = item.PlateNumber.ToString();
                    lblDispatch_CurrentMileage.InnerText = item.CurrentMileage.ToString();
                    lblDispatch_CurrentFuelLevel.InnerText = item.CurrentFuelLevel.ToString();
                    lblstartMileage.InnerText = item.CurrentMileage.ToString();




                }
            }
            //else
            //{
            //    panelDispatch_VehicleUnavailable.Visible = true;
            //    panelDispatch_VehicleDetails.Visible = false;
            //}






        }

        protected void txtDispatch_OperatorId_TextChanged(object sender, EventArgs e)
        {
            if (true)
            {
                panelDispatch_OperatorDetails.Visible = true;
                panelDispatch_OperatorUnavailable.Visible = false;

                var operatorCollection = ctx.tblVehicleOperators
                                .Where(op => op.OperatorNum == txtDispatch_OperatorId.Text && op.LicenseExpiryDate > DateTime.Today)
                                .ToList();

                foreach (var item in operatorCollection)
                {
                    lblDispatch_OperatorNum.InnerText = item.OperatorNum.ToString();
                    lblDispatch_OperatorName.InnerText = item.FullName.ToString();
                    lblDispatch_IssueDate.InnerText = item.LicenseIssueDate.ToString();
                    lblDispatch_ExpiryDate.InnerText = item.LicenseExpiryDate.ToString();

                }
            }


        }

        private void RetrieveVehicleID()
        {
            int vehicleID = Convert.ToInt32(Request.QueryString["VehicleID"].ToString());

            var retrieveVechileId = ctx.tblVehicleFleets
                             .Where(op => op.ID == vehicleID)
                            .ToList();


            foreach (var item in retrieveVechileId)
            {
                vehicleId = item.ID;
                startmileage = item.CurrentMileage;
                fuelTankLevel = item.CurrentFuelLevel;

            }

        }



        private int RetrieveOperatorID()
        {

            int operatorId = 0;



            var retrieveOperatorId = ctx.tblVehicleOperators
                 .Where(op => op.OperatorNum == txtDispatch_OperatorId.Text)
                 .ToList();




            foreach (var item in retrieveOperatorId)
            {
                operatorId = item.ID;

            }

            return operatorId;



        }

        protected void btnReturn_ReturnVehicle_ServerClick(object sender, EventArgs e)
        {

            RetrieveVehicleID();

            var updateVehicleRecord = ctx.tblVehicleFleets
                           .Where(y => y.ID == vehicleId)
                           .First<tblVehicleFleet>();
            updateVehicleRecord.CurrentMileage = txtReturn_EndingMileage.Value;
            updateVehicleRecord.CurrentFuelLevel = cmbReturn_FuelLevel.Value.ToString();


            var insertLog = new tblDispatchLog()
            {
                VehicleID = vehicleId,
                OperatorID = RetrieveOperatorID(),
                ReturnTime = DateTime.Now,
                StartMileage = startmileage,
                StartFuelLevel = fuelTankLevel,
                EndFuelLevel = cmbReturn_FuelLevel.Value,
                EndMileage = txtReturn_EndingMileage.Value,
                Purpose = "Work"


            };





            ctx.tblDispatchLogs.Add(insertLog);

            ctx.SaveChanges();

            Response.Redirect("VehicleProfile?ID=" + vehicleId.ToString());


        }

        protected void refreshReturn_ServerClick(object sender, EventArgs e)
        {



        }
    }
}