using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet.QuanTri
{
    public partial class ThongTinQuanTri : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string userID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminID"] != null)
                {
                    userID = Session["AdminID"].ToString();

                    if (!string.IsNullOrEmpty(userID))
                    {
                        LoadCustomerInformation(userID);
                    }
                }
            }
        }
        private void LoadCustomerInformation(string userID)
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // Lấy thông tin khách hàng từ cơ sở dữ liệu bằng MaKH
                    var customer = context.QuanTriViens.SingleOrDefault(kh => kh.MaQTV == userID);

                    if (customer != null)
                    {
                        txtTenKH.Text = customer.HoTen;
                        txtEmail.Text = customer.Email;
                        txtSoDienThoai.Text = customer.DienThoai;
                        txtDiaChi.Text = customer.DiaChi;

                        string gioiTinh = customer.GioiTinh;

                        // Kiểm tra và chọn RadioButton tương ứng
                        if (!string.IsNullOrEmpty(gioiTinh))
                        {
                            if (gioiTinh.Equals("Nam", StringComparison.OrdinalIgnoreCase))
                            {
                                radNam.Checked = true;
                            }
                            else if (gioiTinh.Equals("Nữ", StringComparison.OrdinalIgnoreCase))
                            {
                                radNu.Checked = true;
                            }
                        }
                        // Hiển thị ảnh đại diện
                        if (!string.IsNullOrEmpty(customer.AnhDaiDien))
                        {
                            imgAnhDaiDien.Src = customer.AnhDaiDien;
                        }
                    }

                }
                catch (Exception ex)
                {

                }
            }
        }
        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {

            string tenKH = txtTenKH.Text;
            string diaChi = txtDiaChi.Text;
            userID = Session["AdminID"].ToString();
            string email = txtEmail.Text;
            string soDienThoai = txtSoDienThoai.Text;

            // Lấy giới tính từ RadioButton được chọn
            string gioiTinh = radNam.Checked ? "Nam" : "Nữ";

            string anhDaiDien = GetAvatar();
            Session["AdminAnhDaiDien"] = anhDaiDien;
            if (fileAnhDaiDien.HasFile)
            {
                // Nếu có, thực hiện cập nhật hình ảnh mới
                string fileName = Path.GetFileName(fileAnhDaiDien.FileName);
                string filePath = Server.MapPath("/image/AnhDaiDien/" + fileName);
                fileAnhDaiDien.SaveAs(filePath);
                anhDaiDien = "/image/AnhDaiDien/" + fileName;
            }
            string updateQuery = "UPDATE QuanTriVien SET HoTen = @HoTen, GioiTinh = @GioiTinh, DiaChi = @DiaChi, DienThoai = @DienThoai, Email = @Email, AnhDaiDien = @AnhDaiDien WHERE MaQTV = @MaQTV";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@HoTen", tenKH);
                    command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);
                    command.Parameters.AddWithValue("@DienThoai", soDienThoai);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@AnhDaiDien", anhDaiDien);
                    command.Parameters.AddWithValue("@MaQTV", userID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        LoadCustomerInformation(userID);
                        Response.Redirect("QuanLySanPham.aspx");

                        // Hiển thị thông báo hoặc chuyển hướng
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToastr", "toastr.success('Product updated successfully!');", true);
                    }
                    else
                    {
                    }
                }
            }
        }
        private string GetAvatar()
        {
            // Lấy đường dẫn hình ảnh của sản phẩm từ cơ sở dữ liệu
            string selectQuery = "SELECT AnhDaiDien FROM QuanTriVien WHERE MaQTV = @MaQTV";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaQTV", userID);

                    connection.Open();
                    object result = command.ExecuteScalar();
                    connection.Close();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                    else
                    {
                        return string.Empty;
                    }
                }
            }
        }
    }
}