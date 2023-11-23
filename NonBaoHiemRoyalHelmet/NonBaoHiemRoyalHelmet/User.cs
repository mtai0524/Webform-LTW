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
        private readonly QuanLyBanHangContext context = new QuanLyBanHangContext();
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

        public bool ValidateAdmin(string username, string password)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // check taikhoan matkhau
                string query = "SELECT COUNT(*) FROM QuanTriVien WHERE TaiKhoan = @TaiKhoan AND MatKhau = @MatKhau";
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

        public void RegisterUser(KhachHang user)
        {
            // Kiểm tra trước nếu tên đăng nhập đã tồn tại
            if (IsUsernameExists(user.TaiKhoan))
            {
                throw new InvalidOperationException("Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
            }

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Lấy số lượng người dùng hiện tại trong cơ sở dữ liệu để tạo MaKH
                string countQuery = "SELECT COUNT(*) FROM KhachHang";
                using (var countCommand = new SqlCommand(countQuery, connection))
                {
                    int userCount = (int)countCommand.ExecuteScalar();

                    // Tạo mã KH dựa trên số lượng người dùng và tăng dần lên.
                    string maKH = $"KH{userCount + 1:D2}"; // +1 tăng lên một đơn vị, D2 số nguyên 2 chữ số

                    string insertQuery = "INSERT INTO KhachHang (MaKH, TaiKhoan, TenKH ,MatKhau, Email, SoDT, NgaySinh, GioiTinh, AnhDaiDien, DiaChi) " +
                                         "VALUES (@MaKH, @TaiKhoan, @TenKH ,@MatKhau, @Email, @SoDT, @NgaySinh, @GioiTinh, @AnhDaiDien, @DiaChi)";
                    using (var command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@MaKH", maKH);
                        command.Parameters.AddWithValue("@TaiKhoan", user.TaiKhoan);
                        command.Parameters.AddWithValue("@MatKhau", user.MatKhau);
                        command.Parameters.AddWithValue("@TenKH", user.TenKH);
                        command.Parameters.AddWithValue("@Email", user.Email);
                        command.Parameters.AddWithValue("@SoDT", user.SoDT);
                        command.Parameters.AddWithValue("@NgaySinh", user.NgaySinh);
                        command.Parameters.AddWithValue("@GioiTinh", user.GioiTinh);
                        command.Parameters.AddWithValue("@AnhDaiDien", user.AnhDaiDien);
                        command.Parameters.AddWithValue("@DiaChi", user.DiaChi);

                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        public void RegisterAdmin(QuanTriVien user)
        {
            // Kiểm tra trước nếu tên đăng nhập đã tồn tại
            if (IsUsernameExists(user.TaiKhoan))
            {
                throw new InvalidOperationException("Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
            }

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Lấy số lượng người dùng hiện tại trong cơ sở dữ liệu để tạo MaKH
                string countQuery = "SELECT COUNT(*) FROM QuanTriVien";
                using (var countCommand = new SqlCommand(countQuery, connection))
                {
                    int userCount = (int)countCommand.ExecuteScalar();

                    // Tạo mã KH dựa trên số lượng người dùng và tăng dần lên.
                    string maKH = $"QTV{userCount + 1:D2}"; // +1 tăng lên một đơn vị, D2 số nguyên 2 chữ số

                    string insertQuery = "INSERT INTO QuanTriVien (MaQTV, TaiKhoan, HoTen ,MatKhau, Email, AnhDaiDien) " +
                                         "VALUES (@MaQTV, @TaiKhoan, @HoTen ,@MatKhau, @Email, @AnhDaiDien)";
                    using (var command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@MaQTV", maKH);
                        command.Parameters.AddWithValue("@TaiKhoan", user.TaiKhoan);
                        command.Parameters.AddWithValue("@HoTen", user.HoTen);
                        command.Parameters.AddWithValue("@MatKhau", user.MatKhau);
                        command.Parameters.AddWithValue("@Email", user.Email);
                        command.Parameters.AddWithValue("@AnhDaiDien", user.AnhDaiDien);

                        command.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}