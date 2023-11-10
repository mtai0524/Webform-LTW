using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NonBaoHiemRoyalHelmet.data
{
    public class QuanLyBanHangContext: DbContext
    {
        public QuanLyBanHangContext() : base("name=QuanLyBanHangRoyalHelmetEntities")
        {
        }
        public DbSet<SanPham> SanPham { get; set; }
    }
}