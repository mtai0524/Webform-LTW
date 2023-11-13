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
    public partial class SuaSanPham : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string maSP = Request.QueryString["MaSP"];

                LoadProductDetails(maSP);
            }
        }

        private void LoadProductDetails(string maSP)
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // Lấy sản phẩm từ cơ sở dữ liệu bằng MaSP
                    var product = context.SanPhams.SingleOrDefault(sp => sp.MaSP == maSP);

                    if (product != null)
                    {
                        // Hiển thị thông tin chi tiết sản phẩm trên trang chỉnh sửa
                        txtMaSP.Text = product.MaSP;
                        txtTenSP.Text = product.TenSP;
                        txtTrongLuong.Text = product.TrongLuong;
                        txtKichCo.Text = product.KichCo;
                        txtSoLuongTon.Text = product.SoLuongTon.ToString();
                        txtGiaBan.Text = product.GiaBan.ToString();
                        txtMoTa.Text = product.MoTa;
                        // Nạp dữ liệu vào DropDownList ddlMaLoaiSP
                        var listLoaiSP = context.LoaiSPs.ToList();
                        ddlMaLoaiSP.DataSource = listLoaiSP;
                        ddlMaLoaiSP.DataTextField = "TenLoaiSP";
                        ddlMaLoaiSP.DataValueField = "MaLoaiSP";
                        ddlMaLoaiSP.DataBind();

                        // Chọn giá trị tương ứng với sản phẩm đang được chỉnh sửa
                        ddlMaLoaiSP.SelectedValue = product.MaLoaiSP;
                    }
                    else
                    {
                        // Xử lý trường hợp không tìm thấy sản phẩm
                        // Có thể chuyển hướng hoặc hiển thị thông báo không tìm thấy sản phẩm
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý exception nếu có
                    Console.WriteLine("Error: " + ex.Message);
                    // Có thể chuyển hướng hoặc hiển thị thông báo lỗi
                }
            }
        }


        protected void btnCapNhatSanPham_Click(object sender, EventArgs e)
        {
            UpdateProduct();
        }

        private void UpdateProduct()
        {
            string maSP = txtMaSP.Text;
            string tenSP = txtTenSP.Text;

            // Kiểm tra xem FileUpload có chứa dữ liệu không
            string hinh1 = GetProductImage(maSP);
            string hinh2 = GetProductImage2(maSP);
            if (fileUpload.HasFile)
            {
                // Nếu có, thực hiện cập nhật hình ảnh mới
                string fileName = Path.GetFileName(fileUpload.FileName);
                string filePath = Server.MapPath("/image/" + fileName);
                fileUpload.SaveAs(filePath);
                hinh1 = "/image/" + fileName;
            }

            if (fileUpload2.HasFile)
            {
                // Nếu có, thực hiện cập nhật hình ảnh mới
                string fileName = Path.GetFileName(fileUpload2.FileName);
                string filePath = Server.MapPath("/image/" + fileName);
                fileUpload2.SaveAs(filePath);
                hinh2 = "/image/" + fileName;
            }

            string moTa = txtMoTa.Text;
            string trongLuong = txtTrongLuong.Text;
            string kichCo = txtKichCo.Text;
            int soLuongTon = Convert.ToInt32(txtSoLuongTon.Text);
            decimal giaBan = Convert.ToDecimal(txtGiaBan.Text);

            // Truy vấn SQL cập nhật thông tin sản phẩm
            string updateQuery = "UPDATE SanPham SET TenSP = @TenSP, Hinh1 = @Hinh1, Hinh2 = @Hinh2, MoTa = @MoTa, TrongLuong = @TrongLuong, KichCo = @KichCo, SoLuongTon = @SoLuongTon, GiaBan = @GiaBan,MaLoaiSP = @MaLoaiSP WHERE MaSP = @MaSP";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@TenSP", tenSP);
                    command.Parameters.AddWithValue("@Hinh1", hinh1);
                    command.Parameters.AddWithValue("@Hinh2", hinh2);
                    command.Parameters.AddWithValue("@MoTa", moTa);
                    command.Parameters.AddWithValue("@TrongLuong", trongLuong);
                    command.Parameters.AddWithValue("@KichCo", kichCo);
                    command.Parameters.AddWithValue("@SoLuongTon", soLuongTon);
                    command.Parameters.AddWithValue("@GiaBan", giaBan);
                    command.Parameters.AddWithValue("@MaLoaiSP", ddlMaLoaiSP.SelectedValue);
                    command.Parameters.AddWithValue("@MaSP", maSP);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        // Hiển thị thông báo hoặc chuyển hướng
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToastr", "toastr.success('Product updated successfully!');", true);
                    }
                    else
                    {
                    }
                }
            }
        }

        private string GetProductImage2(string maSP)
        {
            // Lấy đường dẫn hình ảnh của sản phẩm từ cơ sở dữ liệu
            string selectQuery = "SELECT Hinh2 FROM SanPham WHERE MaSP = @MaSP";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaSP", maSP);

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

        private string GetProductImage(string maSP)
        {
            // Lấy đường dẫn hình ảnh của sản phẩm từ cơ sở dữ liệu
            string selectQuery = "SELECT Hinh1 FROM SanPham WHERE MaSP = @MaSP";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaSP", maSP);

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