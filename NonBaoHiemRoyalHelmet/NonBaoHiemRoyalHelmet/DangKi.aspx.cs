using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class DangKi : System.Web.UI.Page
    {
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext();
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string newUsername = txtNewUsername.Text;
            string newPassword = txtNewPassword.Text;

            User userDAL = new User(connectionString);

            if (!userDAL.ValidateUser(newUsername, ""))
            {
                // Tạo một người dùng mới và thêm vào cơ sở dữ liệu
                KhachHang newUser = new KhachHang
                {
                    TaiKhoan = newUsername,
                    MatKhau = newPassword
                };

                userDAL.RegisterUser(newUser);

                // Chuyển hướng đến trang đăng nhập khi đăng ký thành công
                Response.Redirect("DangNhap.aspx");
            }
            else
            {
                // Hiển thị thông báo lỗi
                //lblRegisterError.Text = "Tên đăng nhập đã tồn tại.";
            }
        }
    }
}