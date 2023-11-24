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
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities();
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string maSP = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    if (!IsPostBack)
                    {
                        // tìm kiếm
                        string keyword = Request.QueryString["keyword"];

                        if (string.IsNullOrEmpty(keyword))
                        {
                            // Nếu keyword rỗng, hiển thị tất cả sản phẩm
                            DanhSachSanPham(null);
                        }
                        else
                        {
                            // Thực hiện tìm kiếm và hiển thị kết quả
                            HienThiKetQuaTimKiem(keyword);
                        }

                        LoadLoaiSanPhamData();

                        if (Request.QueryString["MaLoaiSanPham"] != null)
                        {
                            string maLoai = Request.QueryString["MaLoaiSanPham"];
                            DanhSachSanPham(maLoai);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }



        private void HienThiKetQuaTimKiem(string keyword)
        {
            try
            {
                // Lấy danh sách sản phẩm từ cơ sở dữ liệu
                var listSp = context.SanPhams
                    .Where(sp =>
                        string.IsNullOrEmpty(keyword) || sp.TenSP.Contains(keyword))
                    .ToList();

                rptListSp.DataSource = listSp.Select(sp => new
                {
                    Hinh1 = sp.Hinh1,
                    Hinh2 = sp.Hinh2,
                    TenSp = sp.TenSP,
                    GiaBan = sp.GiaBan.ToString("N0"),
                    DetailUrl = $"ChiTiet.aspx?MaSanPham={sp.MaSP}",
                });

                rptListSp.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }



        private void LoadLoaiSanPhamData()
        {
            try
            {
                // Lấy danh sách loại sản phẩm từ cơ sở dữ liệu
                var listLoaiSP = context.LoaiSPs.ToList();

                // Đổ danh sách loại sản phẩm vào Repeater
                rptLoaiSP.DataSource = listLoaiSP;
                rptLoaiSP.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        private void DanhSachSanPham(string maLoaiSanPham)
        {
            try
            {
                // Lấy danh sách sản phẩm theo loại từ cơ sở dữ liệu
                var listSp = context.SanPhams
                    .Where(sp => maLoaiSanPham == null || sp.MaLoaiSP == maLoaiSanPham)
                    .ToList();

                rptListSp.DataSource = listSp.Select(sp => new
                {
                    Hinh1 = sp.Hinh1,
                    Hinh2 = sp.Hinh2,
                    TenSp = sp.TenSP,
                    GiaBan = sp.GiaBan.ToString("N0"),
                    DetailUrl = $"ChiTiet.aspx?MaSanPham={sp.MaSP}",
                });

                rptListSp.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        protected void rptLoaiSP_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ShowProducts")
            {
                // Lấy mã loại sản phẩm từ CommandArgument
                string maLoaiSP = e.CommandArgument.ToString();

                // Hiển thị danh sách sản phẩm theo loại
                DanhSachSanPham(maLoaiSP);

                Response.Redirect($"LoaiSanPham.aspx?MaLoaiSanPham={maLoaiSP}");
            }
        }

        protected void lnkShowAllProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoaiSanPham.aspx");
        }
    }
}
