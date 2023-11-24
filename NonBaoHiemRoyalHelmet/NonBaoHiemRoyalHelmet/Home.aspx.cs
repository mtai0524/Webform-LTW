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
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {
                string userId = Session["UserID"].ToString();
            }

            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
            }

            // Mở kết nối
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // lay tat ca loai san pham
                    var listLoai = context.LoaiSPs.ToList();

                    listLoaiSp.DataSource = listLoai.Select(sp => new
                    {
                        TenLoaiSP = sp.TenLoaiSP,
                        URLLoaiSP = $"LoaiSanPham.aspx?MaLoaiSanPham={sp.MaLoaiSP}",
                    });
                    listLoaiSp.DataBind();


                    // repeater hien thi danh sach san pham
                    var listSp = context.SanPhams.Take(15).ToList(); // lấy 15 sản phẩm
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