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
                        maSP = Request.QueryString["MaSanPham"];
                        lbTenSp.Text = maSP;
                    }
                    var sanPham = context.SanPham.FirstOrDefault(sp => sp.MaSP == maSP);

                    // repeater hien thi chi tiet san pham
                    rptDetailProd.DataSource = sanPham;
                    rptDetailProd.DataBind();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }

            }
        }
    }
}