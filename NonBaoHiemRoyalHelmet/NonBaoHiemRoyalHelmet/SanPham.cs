//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NonBaoHiemRoyalHelmet
{
    using System;
    using System.Collections.Generic;
    
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.CTDHs = new HashSet<CTDH>();
        }
    
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public string Hinh1 { get; set; }
        public string Hinh2 { get; set; }
        public string MoTa { get; set; }
        public string TrongLuong { get; set; }
        public string KichCo { get; set; }
        public int SoLuongTon { get; set; }
        public int GiaBan { get; set; }
        public string MaLoaiSP { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDH> CTDHs { get; set; }
        public virtual LoaiSP LoaiSP { get; set; }
    }
}
