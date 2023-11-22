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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Lấy mã sản phẩm từ CommandArgument
            string maSanPham = (sender as LinkButton).CommandArgument;

            // Thêm sản phẩm vào giỏ hàng (sử dụng Session để lưu thông tin giỏ hàng)
            AddToCart(maSanPham);

            // Chuyển hướng đến trang giỏ hàng
            Response.Redirect("GioHang.aspx");
        }

        private void AddToCart(string maSanPham)
        {
            // Kiểm tra xem giỏ hàng có tồn tại trong Session chưa
            if (Session["Cart"] == null)
            {
                // Nếu chưa, tạo một danh sách mới để lưu các sản phẩm
                List<SanPham> cart = new List<SanPham>();
                cart.Add(context.SanPham.SingleOrDefault(sp => sp.MaSP == maSanPham));
                Session["Cart"] = cart;
            }
            else
            {
                // Nếu giỏ hàng đã tồn tại, kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                List<SanPham> cart = (List<SanPham>)Session["Cart"];

                // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                bool isExist = cart.Any(sp => sp.MaSP == maSanPham);

                if (!isExist)
                {
                    // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm vào danh sách
                    cart.Add(context.SanPham.SingleOrDefault(sp => sp.MaSP == maSanPham));
                    Session["Cart"] = cart;
                }
                else
                {
                    Response.Write("Sản phẩm đã có trong giỏ hàng.");
                }
            }
        }


    }
}