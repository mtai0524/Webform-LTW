using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowInfoAdmin();
            if (Session["AdminName"] != null)
            {
                lblAdminEmail.Text = Session["AdminEmail"].ToString();
                lblFullName.Text = Session["AdminFullName"].ToString();
                lblFullName2.Text = Session["AdminFullName"].ToString();
                imgAnhDaiDien.Src = Session["AdminAnhDaiDien"].ToString();
                imgAnhDaiDien2.Src = Session["AdminAnhDaiDien"].ToString();
            }
        }
        void ShowInfoAdmin()
        {
            Session.Timeout = 1000;
            string maQTV = Session["AdminID"].ToString();
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // Lấy sản phẩm từ cơ sở dữ liệu bằng MaSP
                    var admin = context.QuanTriViens.SingleOrDefault(sp => sp.MaQTV == maQTV);

                    if (admin != null)
                    {
                        Session["AdminFullName"] = admin.HoTen;
                        Session["AdminEmail"] = admin.Email;
                        Session["AdminAnhDaiDien"] = admin.AnhDaiDien;
                    }
                   
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            // Xóa các Session liên quan đến đăng nhập
            Session.Remove("UserID");
            Session.Remove("AdminID");
            Session.Remove("AdminName");

            Response.Redirect("/DangNhap.aspx");
        }

    }
}