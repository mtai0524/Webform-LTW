using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.IO;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI;

namespace NonBaoHiemRoyalHelmet
{
    public partial class ThongTinKhachHang : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string userID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["UserID"] != null)
                {
                    userID = Session["UserID"].ToString();

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
                    var customer = context.KhachHangs.SingleOrDefault(kh => kh.MaKH == userID);

                    if (customer != null)
                    {
                        txtTenKH.Text = customer.TenKH;
                        txtEmail.Text = customer.Email;
                        txtSoDienThoai.Text = customer.SoDT;
                        txtDiaChi.Text = customer.DiaChi;
                        if (customer.NgaySinh.HasValue)
                        {
                            txtNgaySinh.Text = customer.NgaySinh.Value.ToString("yyyy-MM-dd");
                        }

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
            userID = Session["UserID"].ToString();
            string email = txtEmail.Text;
            string soDienThoai = txtSoDienThoai.Text;
            DateTime ngaySinh = DateTime.Parse(txtNgaySinh.Text);

            // Lấy giới tính từ RadioButton được chọn
            string gioiTinh = radNam.Checked ? "Nam" : "Nữ";

            string anhDaiDien = GetAvatar();
            if (fileAnhDaiDien.HasFile)
            {
                // Nếu có, thực hiện cập nhật hình ảnh mới
                string fileName = Path.GetFileName(fileAnhDaiDien.FileName);
                string filePath = Server.MapPath("/image/AnhDaiDien/" + fileName);
                fileAnhDaiDien.SaveAs(filePath);
                anhDaiDien = "/image/AnhDaiDien/" + fileName;
            }
            string updateQuery = "UPDATE KhachHang SET TenKH = @TenKH, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, DiaChi = @DiaChi, SoDT = @SoDT, Email = @Email, AnhDaiDien = @AnhDaiDien WHERE MaKH = @MaKH";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@TenKH", tenKH);
                    command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    command.Parameters.AddWithValue("@NgaySinh", ngaySinh);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);
                    command.Parameters.AddWithValue("@SoDT", soDienThoai);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@AnhDaiDien", anhDaiDien);
                    command.Parameters.AddWithValue("@MaKH", userID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        LoadCustomerInformation(userID);
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
            string selectQuery = "SELECT AnhDaiDien FROM KhachHang WHERE MaKH = @MaKH";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaKH", userID);

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
