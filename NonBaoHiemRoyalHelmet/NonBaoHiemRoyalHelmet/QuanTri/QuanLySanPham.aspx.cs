using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet.QuanTri
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowListProduct();
            }
        }
        protected void AddProduct(object sender, EventArgs e)
        {
            Response.Redirect("ThemSanPham.aspx");
        }

        private void ShowListProduct()
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // repeater hien thi danh sach san pham
                    var listSp = context.SanPhams.ToList(); // lấy 15 sản phẩm
                    //adminShowProducts.DataSource = listSp.Select(sp => new
                    //{
                    //    Hinh1 = sp.Hinh1, // Hinh1 bên trái phải đặt đúng tên trong database
                    //    Hinh2 = sp.Hinh2, // Hinh1 bên trái phải đặt đúng tên trong database
                    //    TenSp = sp.TenSP,
                    //    GiaBan = sp.GiaBan.ToString("N0"),
                    //    DetailUrl = $"ChiTiet.aspx?MaSanPham={sp.MaSP}",
                    //});
                    adminShowProducts.DataSource = listSp;
                    adminShowProducts.DataBind();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
        protected void adminShowProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                string maSP = e.CommandArgument.ToString();
              
                bool deleteSuccess = DeleteProduct(maSP);

                if (deleteSuccess)
                {
                    ShowListProduct();
                }
                else
                {
                }
            }
        }

        private bool DeleteProduct(string maSP)
        {
            try
            {
                using (var context = new QuanLyBanHangRoyalHelmetEntities())
                {
                    string sql = "DELETE FROM SanPham WHERE MaSP = @maSP";

                    int row = context.Database.ExecuteSqlCommand(sql, new SqlParameter("@maSP", maSP));

                    if (row > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }


    }
}