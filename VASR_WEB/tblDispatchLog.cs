//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VASR_WEB
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblDispatchLog
    {
        public int ID { get; set; }
        public int OperatorID { get; set; }
        public int VehicleID { get; set; }
        public Nullable<System.DateTime> CheckoutTime { get; set; }
        public string StartMileage { get; set; }
        public string StartFuelLevel { get; set; }
        public Nullable<System.DateTime> ReturnTime { get; set; }
        public string Purpose { get; set; }
        public string EndMileage { get; set; }
        public string EndFuelLevel { get; set; }
    }
}