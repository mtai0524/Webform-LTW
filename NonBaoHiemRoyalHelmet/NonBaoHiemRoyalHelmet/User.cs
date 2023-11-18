using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NonBaoHiemRoyalHelmet
{
    public class User
    {
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        public User(string connectionString)
        {
            this.connectionString = connectionString;
        }
        public bool ValidateUser(string username, string password)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // check taikhoan matkhau
                string query = "SELECT COUNT(*) FROM KhachHang WHERE TaiKhoan = @TaiKhoan AND MatKhau = @MatKhau";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TaiKhoan", username);
                    command.Parameters.AddWithValue("@MatKhau", password);

                    int count = (int)command.ExecuteScalar();

                    // Trả về true nếu tồn tại người dùng và mật khẩu đúng
                    return count > 0;
                }
            }
        }
        public bool IsUsernameExists(string username)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Thực hiện truy vấn kiểm tra xem có người dùng nào có tên đăng nhập đã tồn tại không
                string query = "SELECT COUNT(*) FROM KhachHang WHERE TaiKhoan = @TaiKhoan";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TaiKhoan", username);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        public void RegisterUser(KhachHang admin)
        {
            // Kiểm tra trước nếu tên đăng nhập đã tồn tại
            if (IsUsernameExists(admin.TaiKhoan))
            {
                throw new InvalidOperationException("Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
            }

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Lấy số lượng người dùng hiện tại trong cơ sở dữ liệu để tạo MaQTV
                string countQuery = "SELECT COUNT(*) FROM KhachHang";
                using (var countCommand = new SqlCommand(countQuery, connection))
                {
                    int userCount = (int)countCommand.ExecuteScalar();

                    // Tạo mã QTV dựa trên số lượng người dùng và tăng dần lên.
                    string maKH = $"KH{userCount + 1:D2}"; // +1 tăng lên một đơn vị, D2 số nguyên 2 chữ số

                    string insertQuery = "INSERT INTO KhachHang (MaKH, TaiKhoan, MatKhau) VALUES (@MaKH, @TaiKhoan, @MatKhau)";
                    using (var command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@MaKH", maKH);
                        command.Parameters.AddWithValue("@TaiKhoan", admin.TaiKhoan);
                        command.Parameters.AddWithValue("@MatKhau", admin.MatKhau);

                        command.ExecuteNonQuery();
                    }
                }
            }
        }

    }
}