using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class test : System.Web.UI.Page
    {
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            // Mở kết nối
            using (var context = new QuanLyBanHangContext())
            {
                try
                {
                    // repeater hien thi danh sach san pham
                    var listSp = context.SanPham.Take(15).ToList(); // lấy 15 sản phẩm
                    rptListProd.DataSource = listSp.Select(sp => new
                    {
                        Hinh1 = sp.Hinh1, // Hinh1 bên trái phải đặt đúng tên trong database
                        Hinh2 = sp.Hinh2, // Hinh1 bên trái phải đặt đúng tên trong database
                        TenSp = sp.TenSP,
                        GiaBan = sp.GiaBan.ToString("N0"),
                        DetailUrl = $"ChiTiet.aspx?MaSanPham={sp.MaSP}",
                    });
                    //rptListProd.DataSource = listSp;
                    rptListProd.DataBind();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }

            }
        }
    }
}