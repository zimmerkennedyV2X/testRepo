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
    
    public partial class tblCLVBWeeklyInspection
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> WeeklyInspectionDate { get; set; }
        public string WeeklyInspector { get; set; }
        public byte[] WeeklyInspectionSheet { get; set; }
        public Nullable<int> VehicleID { get; set; }
        public string FileName { get; set; }
    }
}
