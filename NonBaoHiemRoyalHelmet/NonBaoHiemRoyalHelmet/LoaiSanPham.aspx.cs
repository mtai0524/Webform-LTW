using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class LoaiSanPham : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string maSP = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    if (Request.QueryString["MaLoaiSanPham"] != null)
                    {
                        string maLoai = Request.QueryString["MaLoaiSanPham"];
                        var loaiSp = context.LoaiSPs.SingleOrDefault(sp => sp.MaLoaiSP == maLoai);

                        if (loaiSp != null)
                        {

                        }
                        else
                        {
                            // Xử lý khi không tìm thấy sản phẩm
                        }
                    }
                    else
                    {
                        // Xử lý khi không có mã sản phẩm được chuyển đến
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }

            }
        }
    }
}