using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class VehicleFleetDispatchReturn : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();
        int vehicleId = 0;
        string startmileage, fuelTankLevel;


        int dispatchlogID = 0,
            vehiclefleetID = 0;



        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region Dispatch
        protected void btnDispatch_DispatchVehicle_ServerClick(object sender, EventArgs e)
        {
            if (CheckOperator() && CheckVehicle() && CheckOperatorValidity())
            {
                RetrieveVehicleID();

                var insertLog = new tblDispatchLog()
                {
                    VehicleID = vehicleId,
                    OperatorID = RetrieveOperatorID(),
                    CheckoutTime = DateTime.Now.AddHours(3),
                    StartMileage = startmileage,
                    StartFuelLevel = fuelTankLevel,
                    Purpose = "Work"


                };


                var insertUsageRecords = new tblUsageRecord()
                {
                    CurrentMileage = startmileage,
                    VehicleID = vehicleId,
                    LogTime = DateTime.Now.AddHours(3),
                    TankLevel = fuelTankLevel



                };

                ctx.tblDispatchLogs.Add(insertLog);
                ctx.tblUsageRecords.Add(insertUsageRecords);
                ctx.SaveChanges();



                //dispatchStatus.InnerText = "Vehicle Successfully Checked Out. Drive Safe!";
                //refreshDispatch.Visible = true;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirmCheckout", "$('#confirmCheckout').modal();", true);


            }
            else
            {

                dispatchStatus.InnerText = "Invalid Vehicle Checkout! Contact SSD Manager.";



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


        private void RetrieveVehicleID()
        {

            var retrieveVechileId = ctx.tblVehicleFleets
                             .Where(op => op.AdminNumber == txtDispatch_VehicleID.Text)
                            .ToList();


            foreach (var item in retrieveVechileId)
            {
                vehicleId = item.ID;
                startmileage = item.CurrentMileage;
                fuelTankLevel = item.CurrentFuelLevel;

            }

        }

        public bool CheckOperator()
        {

            // Lacking 
            //1 - Operator Check LicenseExpiryDate
            //2 - Operator Check if Dispatched  

            var operatorCollection = ctx.tblVehicleOperators
     .Where(op => op.OperatorNum == txtDispatch_OperatorId.Text && op.LicenseExpiryDate > DateTime.Today && op.OperatorStatus == true)
     .ToList();

            return (operatorCollection.Count < 1) ? false : true;

        }


        public bool CheckOperatorValidity()
        {


            int ? ocode = 0, vcode = 0;
            string ocodeString, vcodeString;


            var vehicleCollection = ctx.tblVehicleFleets
          .Where(v => v.AdminNumber == txtDispatch_VehicleID.Text && v.VehicleStatus == true)
          .ToList();

            foreach (var item in vehicleCollection)
            {
               vcode = item.VehicleCode;

            }

            var operatorCollection = ctx.tblVehicleOperators
  .Where(op => op.OperatorNum == txtDispatch_OperatorId.Text && op.LicenseExpiryDate > DateTime.Today && op.OperatorStatus == true)
  .ToList();
            foreach (var item in operatorCollection)
            {
             ocode = item.OperatorLicenseCode ;

            }


            vcodeString = vcode.ToString();
            ocodeString = ocode.ToString();

            if(ocodeString.Contains(vcodeString))
            {
                return true;
            }
            else
            {
                return false;

            }

        


        }

        public bool CheckVehicle()
        {
            //Lacking
            // 1 - Vehicle already dispatched
            var vehicleCollection = ctx.tblVehicleFleets
                                    .Where(v => v.AdminNumber == txtDispatch_VehicleID.Text && v.VehicleStatus == true)
                                    .ToList();

            return (vehicleCollection.Count < 1 || CheckDispatchRecord_Dispatch()) ? false : true;


        }

        protected void txtDispatch_VehicleID_ServerChange(object sender, EventArgs e)
        {
            //lblDispatch_AdminNumber.InnerText = txtDispatch_VehicleID.Text.ToString();

            if (CheckVehicle())
            {
                panelDispatch_VehicleDetails.Visible = true;
                panelDispatch_VehicleUnavailable.Visible = false;
                var vehicleCollection = ctx.tblVehicleFleets
                                                  .Where(v => v.AdminNumber == txtDispatch_VehicleID.Text)
                                                  .ToList();

                foreach (var item in vehicleCollection)
                {
                    lblDispatch_AdminNumber.InnerText = item.AdminNumber.ToString();
                    lblDispatch_Model.InnerText = item.Model.ToString();
                    lblDispatch_PlateNumber.InnerText = item.PlateNumber.ToString();
                    lblDispatch_CurrentMileage.InnerText = item.CurrentMileage.ToString();
                    lblDispatch_CurrentFuelLevel.InnerText = item.CurrentFuelLevel.ToString();


                }
            }
            else
            {
                panelDispatch_VehicleUnavailable.Visible = true;
                panelDispatch_VehicleDetails.Visible = false;
            }







        }

        protected void txtDispatch_OperatorId_TextChanged(object sender, EventArgs e)
        {
            if (CheckOperator() && CheckOperatorValidity())
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
            else
            {
                panelDispatch_OperatorUnavailable.Visible = true;
                panelDispatch_OperatorDetails.Visible = false;

            }





        }


        #endregion

        #region Return

        private void GetDispatchID()
        {


            var dispatchCollection = (from x in ctx.tblDispatchLogs
                                      join y in ctx.tblVehicleFleets on x.VehicleID equals y.ID
                                      join z in ctx.tblVehicleOperators on x.OperatorID equals z.ID
                                      where y.AdminNumber == txtReturn_VehicleID.Text && x.ReturnTime == null
                                      select new
                                      {

                                          x.ID,
                                          x.VehicleID

                                      }).ToList();

            foreach (var item in dispatchCollection)
            {
                dispatchlogID = item.ID;
                vehiclefleetID = item.VehicleID;

            }


        }


        public bool CheckDispatchRecord_Dispatch()
        {

            var dispatchCollection = (from x in ctx.tblDispatchLogs
                                      join y in ctx.tblVehicleFleets on x.VehicleID equals y.ID
                                      join z in ctx.tblVehicleOperators on x.OperatorID equals z.ID
                                      where y.AdminNumber == txtDispatch_VehicleID.Text && x.ReturnTime == null
                                      select new
                                      {
                                          y.AdminNumber,
                                          y.PlateNumber,
                                          y.Model,
                                          x.CheckoutTime,
                                          z.OperatorNum,
                                          z.FullName,
                                          y.CurrentMileage,
                                          y.CurrentFuelLevel,
                                          x.ID
                                      }).ToList();

            return (dispatchCollection.Count >= 1) ? true : false;



        }

        public bool CheckDispatchRecord()
        {

            var dispatchCollection = (from x in ctx.tblDispatchLogs
                                      join y in ctx.tblVehicleFleets on x.VehicleID equals y.ID
                                      join z in ctx.tblVehicleOperators on x.OperatorID equals z.ID
                                      where y.AdminNumber == txtReturn_VehicleID.Text && x.ReturnTime == null
                                      select new
                                      {
                                          y.AdminNumber,
                                          y.PlateNumber,
                                          y.Model,
                                          x.CheckoutTime,
                                          z.OperatorNum,
                                          z.FullName,
                                          y.CurrentMileage,
                                          y.CurrentFuelLevel,
                                          x.ID
                                      }).ToList();

            return (dispatchCollection.Count >= 1) ? true : false;



        }


        protected void txtReturn_VehicleID_TextChanged(object sender, EventArgs e)
        {
            if (CheckDispatchRecord())
            {

                panelReturn_DispatchRecords.Visible = true;
                panelReturn_NoDispatchRecords.Visible = false;


                var dispatchCollection = (from x in ctx.tblDispatchLogs
                                          join y in ctx.tblVehicleFleets on x.VehicleID equals y.ID
                                          join z in ctx.tblVehicleOperators on x.OperatorID equals z.ID
                                          where y.AdminNumber == txtReturn_VehicleID.Text && x.ReturnTime == null
                                          select new
                                          {
                                              y.AdminNumber,
                                              y.PlateNumber,
                                              y.Model,
                                              x.CheckoutTime,
                                              z.OperatorNum,
                                              z.FullName,
                                              y.CurrentMileage,
                                              y.CurrentFuelLevel,
                                              x.ID
                                          }).ToList();

                foreach (var item in dispatchCollection)
                {
                    lblReturn_CheckoutTime.InnerText = item.CheckoutTime.ToString();

                    lblReturn_AdminNumber.InnerText = item.AdminNumber.ToString();
                    lblReturn_PlateNumber.InnerText = item.PlateNumber.ToString();
                    lblReturn_Model.InnerText = item.Model.ToString();
                    lblReturn_OperatorLicense.InnerText = item.OperatorNum.ToString();
                    lblReturn_OperatorNumber.InnerText = item.FullName.ToString();
                    lblReturn_StartingFuel.InnerText = item.CurrentFuelLevel.ToString();
                    lblReturn_StartMileage.InnerText = item.CurrentMileage.ToString();
                    txtStartMileageReturn.Text = item.CurrentMileage.ToString();
                    //lblstartMileage.InnerText = item.CurrentMileage.ToString();
                    txtReturn_EndingMileage.Value = item.CurrentMileage.ToString();

                  

                }

            }
            else
            {
                panelReturn_DispatchRecords.Visible = false;
                panelReturn_NoDispatchRecords.Visible = true;




            }



        }

        protected void refreshDispatch_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("VehicleFleetDispatchReturn.aspx");

        }

        private bool ValidateMileageAndFuel()
        {
            if (String.IsNullOrEmpty(txtReturn_EndingMileage.Value) || String.IsNullOrEmpty(cmbReturn_FuelLevel.Value.ToString()))
            {
                return false;
            }
            else
            {

                return true;
            }


        }


        protected void btnReturn_ReturnVehicle_ServerClick(object sender, EventArgs e)
        {
            if (ValidateMileageAndFuel())
            {
                GetDispatchID();

                var updateDispatchLog = ctx.tblDispatchLogs
                                        .Where(x => x.ID == dispatchlogID)
                                        .First<tblDispatchLog>();
                updateDispatchLog.ReturnTime = DateTime.Now.AddHours(3);
                updateDispatchLog.EndMileage = txtReturn_EndingMileage.Value;
                updateDispatchLog.EndFuelLevel = cmbReturn_FuelLevel.Value.ToString();

                var updateVehicleRecord = ctx.tblVehicleFleets
                                          .Where(y => y.ID == vehiclefleetID)
                                          .First<tblVehicleFleet>();
                updateVehicleRecord.CurrentMileage = txtReturn_EndingMileage.Value;
                updateVehicleRecord.CurrentFuelLevel = cmbReturn_FuelLevel.Value.ToString();



                var insertUsageRecords = new tblUsageRecord()
                {
                    CurrentMileage = txtReturn_EndingMileage.Value,
                    VehicleID = vehiclefleetID,
                    LogTime = DateTime.Now.AddHours(3),
                    TankLevel = cmbReturn_FuelLevel.Value.ToString()



                };


                ctx.tblUsageRecords.Add(insertUsageRecords);

                ctx.SaveChanges();


                //refreshReturn.Visible = true;

                //returnStatus.InnerText = "You have successfully returned the Vehicle. Enjoy the rest of the day!";

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirmReturn", "$('#confirmReturn').modal();", true);




            }
            else
            {
                returnStatus.InnerText = "Return Failed. Enter End Mileage and Fuel Level ";

            }
        }



        #endregion






    }
}