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

        StringBuilder danhSachSp = new StringBuilder();

        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            // Mở kết nối
            using (var context = new QuanLyBanHangContext())
            {
                try
                {
                    StringBuilder danhSachSp = new StringBuilder();
                    // Thực hiện truy vấn LINQ để lấy dữ liệu từ cơ sở dữ liệu
                    var result = context.SanPham.ToList();

                    // In kết quả
                    foreach (var item in result)
                    {
                        danhSachSp.AppendLine($" <br/> Id: {item.MaSP}, Name: {item.TenSP} ");
                    }
                    Label1.Text = danhSachSp.ToString();


                    // repeater hien thi danh sach san pham
                    var listSp = context.SanPham.ToList();
                    rptListProd.DataSource = listSp;
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