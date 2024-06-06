using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VASR_WEB
{
    public partial class VehicleInspections : System.Web.UI.Page
    {
        VASRDatabaseEntities ctx = new VASRDatabaseEntities();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private bool mvaOccurred()
        {

            int result = rbl_Accident.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool mileagePass()
        {
            int result = RadioButtonList2.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool conditionPass()
        {
            int result = rbl_OverallVehicleCondition.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool fuelPass()
        {
            int result = RadioButtonList3.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool cleanPass()
        {
            int result = rbl_exteriorClean.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool exteriorDamagePass()
        {

            int result = rbl_exteriorDamage.SelectedIndex;
            return (result == 1) ? true : false;

        }



        private bool interiorCleanPass()
        {
            int result = rbl_interiorClean.SelectedIndex;

            return (result == 1) ? true : false;

        }



        private bool windowDamagePass()
        {
            int result = rbl_windowDamage.SelectedIndex;

            return (result == 1) ? true : false;

        }

        private bool lightsServicePass()
        {
            int result = rbl_lightsServiceable.SelectedIndex;

            return (result == 1) ? true : false;

        }



        private bool fluidServicePass()
        {
            int result = rbl_fluidLeaksServiceable.SelectedIndex;

            return (result == 1) ? true : false;

        }



        private bool tireServicePass()
        {
            int result = rbl_tireInflationServiceable.SelectedIndex;

            return (result == 1) ? true : false;

        }








        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {


            editMileage.Visible = mileagePass();

        }

        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            editFuelevel.Visible = fuelPass();

        }

        protected void btnCompleteInspection_Click(object sender, EventArgs e)
        {

            int dispatchId = Convert.ToInt32(Request.QueryString["ID"].ToString());
            int vehicleID = Convert.ToInt32(Request.QueryString["VehicleID"].ToString());




            if (mileagePass() && !fuelPass())
            {

                var updateMileage = ctx.tblDispatchLogs
                                     .Where(x => x.ID == dispatchId)
                                     .First<tblDispatchLog>();
                updateMileage.EndMileage = txtappendEndMileage.Text;


                var updateVehicle = ctx.tblVehicleFleets
                            .Where(x => x.ID == vehicleID)
                            .First<tblVehicleFleet>();
                updateVehicle.CurrentMileage = txtappendEndMileage.Text;


                var insertDailyInspectionRecord = new tblDailyInspection()
                {
                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();
            }
            else if (fuelPass() && !mileagePass())
            {
                var updateFuelLevel = ctx.tblDispatchLogs
                              .Where(x => x.ID == dispatchId)
                              .First<tblDispatchLog>();
                updateFuelLevel.EndFuelLevel = appendEndFuelLevel.Value;

                var updateVehicle = ctx.tblVehicleFleets
              .Where(x => x.ID == vehicleID)
              .First<tblVehicleFleet>();
                updateVehicle.CurrentFuelLevel = appendEndFuelLevel.Value;


                var insertDailyInspectionRecord = new tblDailyInspection()
                {

                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();

            }
            else if (fuelPass() && mileagePass())
            {

                var updateMileage = ctx.tblDispatchLogs
                                     .Where(x => x.ID == dispatchId)
                                     .First<tblDispatchLog>();
                updateMileage.EndMileage = txtappendEndMileage.Text;
                updateMileage.EndFuelLevel = appendEndFuelLevel.Value;

                var updateVehicle = ctx.tblVehicleFleets
                                    .Where(x => x.ID == vehicleID)
                                    .First<tblVehicleFleet>();
                updateVehicle.CurrentFuelLevel = appendEndFuelLevel.Value;
                updateVehicle.CurrentMileage = txtappendEndMileage.Text;



                var insertDailyInspectionRecord = new tblDailyInspection()
                {

                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();

            }
            else
            {


                var insertDailyInspectionRecord = new tblDailyInspection()
                {
                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),

                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()

                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();


            }

            Response.Redirect("InspectionRecord.aspx?ID=" + dispatchId);





        }

        protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            // conditionPass();

        }

        protected void rbl_OverallVehicleCondition_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnCompleteInspection.Visible = !conditionPass();
            //   btnAddDailyInspectionPhotos.Visible = conditionPass();
            mvaSection.Visible = conditionPass();

        }

        protected void btnAddDailyInspectionPhotos_Click(object sender, EventArgs e)
        {
            int dispatchId = Convert.ToInt32(Request.QueryString["ID"].ToString());
            int vehicleID = Convert.ToInt32(Request.QueryString["VehicleID"].ToString());

            if (mileagePass() && !fuelPass())
            {

                var updateMileage = ctx.tblDispatchLogs
                                     .Where(x => x.ID == dispatchId)
                                     .First<tblDispatchLog>();
                updateMileage.EndMileage = txtappendEndMileage.Text;


                var updateVehicle = ctx.tblVehicleFleets
                            .Where(x => x.ID == vehicleID)
                            .First<tblVehicleFleet>();
                updateVehicle.CurrentMileage = txtappendEndMileage.Text;


                var insertDailyInspectionRecord = new tblDailyInspection()
                {
                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();
                Response.Redirect("VehicleInspectionsUploads.aspx?ID=" + insertDailyInspectionRecord.ID + "&" + "DispatchID=" + dispatchId +"&"+"Vehicle="+vehicleID);




            }
            else if (fuelPass() && !mileagePass())
            {
                var updateFuelLevel = ctx.tblDispatchLogs
                              .Where(x => x.ID == dispatchId)
                              .First<tblDispatchLog>();
                updateFuelLevel.EndFuelLevel = appendEndFuelLevel.Value;

                var updateVehicle = ctx.tblVehicleFleets
              .Where(x => x.ID == vehicleID)
              .First<tblVehicleFleet>();
                updateVehicle.CurrentFuelLevel = appendEndFuelLevel.Value;


                var insertDailyInspectionRecord = new tblDailyInspection()
                {

                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();

                Response.Redirect("VehicleInspectionsUploads.aspx?ID=" + insertDailyInspectionRecord.ID + "&" + "DispatchID=" + dispatchId + "&" + "Vehicle=" + vehicleID);





            }
            else if (fuelPass() && mileagePass())
            {

                var updateMileage = ctx.tblDispatchLogs
                                     .Where(x => x.ID == dispatchId)
                                     .First<tblDispatchLog>();
                updateMileage.EndMileage = txtappendEndMileage.Text;
                updateMileage.EndFuelLevel = appendEndFuelLevel.Value;

                var updateVehicle = ctx.tblVehicleFleets
                                    .Where(x => x.ID == vehicleID)
                                    .First<tblVehicleFleet>();
                updateVehicle.CurrentFuelLevel = appendEndFuelLevel.Value;
                updateVehicle.CurrentMileage = txtappendEndMileage.Text;



                var insertDailyInspectionRecord = new tblDailyInspection()
                {

                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()


                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();

                Response.Redirect("VehicleInspectionsUploads.aspx?ID=" + insertDailyInspectionRecord.ID + "&" + "DispatchID=" + dispatchId + "&" + "Vehicle=" + vehicleID);





            }
            else
            {


                var insertDailyInspectionRecord = new tblDailyInspection()
                {
                    ExteriorClean = !cleanPass(),
                    ExteriorCleanComment = txt_ExteriorCleanComment.Text,
                    ExteriorDamage = !exteriorDamagePass(),
                    ExteriorDamageComment = txt_ExteriorDamageComment.Text,
                    InteriorClean = !interiorCleanPass(),
                    InteriorCleanComment = txt_interiorCleanComment.Text,
                    WindowDamage = !windowDamagePass(),
                    WindowDamageComment = txt_windowDamageComment.Text,
                    Lights = !lightsServicePass(),
                    LightsComment = txt_lightsServiceableComment.Text,

                    FluidLeaks = !fluidServicePass(),
                    FluidLeaksComment = txt_fluidLeaksServiceableComment.Text,

                    TireInflation = !tireServicePass(),
                    TireInflationComment = txt_tireInflationServiceableComments.Text,


                    FuelLevelPass = !fuelPass(),
                    MileagePass = !mileagePass(),
                    ConditionPass = !conditionPass(),
                    IsMVA = !mvaOccurred(),
                    Comments = txtInspectionNotes.Text,
                    DispatchID = dispatchId,
                    InspectionDateCompleted = DateTime.Now,
                    InspectionDone = true,
                    DispatchInspector = Context.User.Identity.Name.ToString()

                };
                ctx.tblDailyInspections.Add(insertDailyInspectionRecord);

                ctx.SaveChanges();


                Response.Redirect("VehicleInspectionsUploads.aspx?ID=" + insertDailyInspectionRecord.ID + "&" + "DispatchID=" + dispatchId + "&" + "Vehicle=" + vehicleID);

            }


        }

        protected void rbl_Accident_SelectedIndexChanged(object sender, EventArgs e)
        {
             btnCompleteInspection.Visible = mvaOccurred();
             btnAddDailyInspectionPhotos.Visible = !mvaOccurred();
        }
    }
}