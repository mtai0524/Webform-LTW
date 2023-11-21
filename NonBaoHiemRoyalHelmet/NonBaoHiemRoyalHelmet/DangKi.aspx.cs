using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
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
            string tenKH = txtTenKH.Text;
            string diaChi = txtDiaChi.Text;

            string email = txtEmail.Text;
            string soDienThoai = txtSoDienThoai.Text;
            DateTime ngaySinh = DateTime.Parse(txtNgaySinh.Text);

            // Lấy giới tính từ RadioButton được chọn
            string gioiTinh = radNam.Checked ? "Nam" : "Nữ";

            // Xử lý ảnh đại diện
            string anhDaiDien = ""; 
            if (fileAnhDaiDien.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileAnhDaiDien.FileName);
                    string imagePath = Server.MapPath("/image/AnhDaiDien/") + fileName;

                    // Lưu trữ tệp tin vào thư mục trên server
                    fileAnhDaiDien.SaveAs(imagePath);
                    anhDaiDien = "/image/AnhDaiDien/" + fileName;
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi khi tải ảnh đại diện
                    //lblError.Text = "Lỗi khi tải ảnh đại diện: " + ex.Message;
                }
            }
           
            User userDAL = new User(connectionString);

            if (!userDAL.ValidateUser(newUsername, ""))
            {
                // Tạo một người dùng mới và thêm vào db
                KhachHang newUser = new KhachHang
                {
                    TaiKhoan = newUsername,
                    MatKhau = newPassword,
                    TenKH = tenKH,
                    Email = email,
                    SoDT = soDienThoai,
                    NgaySinh = ngaySinh,
                    GioiTinh = gioiTinh,
                    AnhDaiDien = anhDaiDien,
                    DiaChi = diaChi
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