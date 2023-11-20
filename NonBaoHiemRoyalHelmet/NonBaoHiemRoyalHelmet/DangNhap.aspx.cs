﻿using NonBaoHiemRoyalHelmet.data;
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
            else if(userDAL.ValidateAdmin(username, password))
            {
                Session["AdminID"] = GetAdminIDByUsername(username);
                Session["AdminName"] = username;
                // Chuyển hướng đến trang chính khi đăng nhập thành công
                Response.Redirect("QuanTri/QuanLySanPham.aspx");
            }
        }
        public string GetAdminIDByUsername(string taiKhoan)
        {
            string adminID = "";

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT MaQTV FROM QuanTriVien WHERE TaiKhoan = @TaiKhoan";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        adminID = result as string;
                    }
                }
            }

            return adminID;
        }
        public string GetUserIDByUsername(string taiKhoan)
        {
            string userID = "";

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT MaKH FROM KhachHang WHERE TaiKhoan = @TaiKhoan";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);

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