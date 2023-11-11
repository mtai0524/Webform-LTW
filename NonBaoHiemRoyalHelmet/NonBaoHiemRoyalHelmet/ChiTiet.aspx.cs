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
    public partial class ChiTiet : System.Web.UI.Page
    {
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string maSP = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new QuanLyBanHangContext())
            {
                try
                {
                    if (Request.QueryString["MaSanPham"] != null)
                    {
                        string productId = Request.QueryString["MaSanPham"];
                        var sanPham = context.SanPham.SingleOrDefault(sp => sp.MaSP == productId);

                        if (sanPham != null)
                        {
                            // Hiển thị thông tin chi tiết sản phẩm
                            rptDetailProd.DataSource = new List<SanPham> { sanPham };
                            rptDetailProd.DataBind();
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