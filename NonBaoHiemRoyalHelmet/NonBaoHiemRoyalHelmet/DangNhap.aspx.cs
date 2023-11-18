using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class DangNhap : System.Web.UI.Page
    {
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            User userDAL = new User(connectionString);

            if (userDAL.ValidateUser(username, password))
            {
                Session["UserID"] = GetUserIDByUsername(username);
                Session["Username"] = username;
                // Chuyển hướng đến trang chính khi đăng nhập thành công
                Response.Redirect("LoaiSanPham.aspx");
            }
            else
            {
                // Hiển thị thông báo lỗi
                //lblLoginError.Text = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }
        }
        public string GetUserIDByUsername(string username)
        {
            string userID = ""; // Default value if not found

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT MaQTV FROM KhachHang WHERE TaiKhoan = @Username";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        userID = result as string;
                    }
                }
            }

            return userID;
        }

    }
}