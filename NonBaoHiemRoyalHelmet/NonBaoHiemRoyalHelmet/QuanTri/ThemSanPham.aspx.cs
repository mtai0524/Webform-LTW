using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet.QuanTri
{
    public partial class ThemSanPham : System.Web.UI.Page
    {


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] != null)
            {
                if (!IsPostBack)
                {
                    LoadProductTypes();
                }
            }
            else
            {
                // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
                Response.Redirect("/DangNhap.aspx");
            }
        }

        protected void LoadProductTypes()
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT MaLoaiSP, TenLoaiSP FROM LoaiSP";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dtProductTypes = new DataTable();
                        dtProductTypes.Load(reader);

                        ddlMaLoaiSP.DataSource = dtProductTypes;
                        ddlMaLoaiSP.DataTextField = "TenLoaiSP";
                        ddlMaLoaiSP.DataValueField = "MaLoaiSP";
                        ddlMaLoaiSP.DataBind();
                    }
                }
            }
        }

        protected void btnThemSanPham_Click(object sender, EventArgs e)
        {
            try
            {
                // lấy mã loại ngưòi dùng chọn
                string selectedProductType = ddlMaLoaiSP.SelectedValue;

                // Tạo đối tượng SanPham và gán giá trị từ các TextBox
                SanPham sanPham = new SanPham();
                sanPham.MaSP = txtMaSP.Text;
                sanPham.TenSP = txtTenSP.Text;
                sanPham.MoTa = txtMoTa.Text;
                sanPham.TrongLuong = txtTrongLuong.Text;
                sanPham.KichCo = txtKichCo.Text;
                sanPham.SoLuongTon = Convert.ToInt32(txtSoLuongTon.Text);
                sanPham.GiaBan = Convert.ToInt32(txtGiaBan.Text);
                sanPham.MaLoaiSP = selectedProductType;

                // Lưu hình ảnh vào thư mục trên server
                if (fileUpload.HasFile)
                {
                    try
                    {
                        string fileName = Path.GetFileName(fileUpload.FileName);

                        // Lấy đường dẫn vật lý của thư mục "image" trong dự án
                        string imagePath = Server.MapPath("/image/NonBaoHiem/") + fileName;

                        // Lưu hình ảnh vào thư mục "image"
                        fileUpload.SaveAs(imagePath);

                        // Lưu đường dẫn hình ảnh vào đối tượng SanPham
                        sanPham.Hinh1 = "/image/NonBaoHiem/" + fileName;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Lỗi khi lưu hình ảnh: " + ex.Message);
                    }
                }

                if (fileUpload2.HasFile)
                {
                    try
                    {
                        string fileName = Path.GetFileName(fileUpload2.FileName);

                        // Lấy đường dẫn vật lý của thư mục "image" trong dự án
                        string imagePath = Server.MapPath("/image/NonBaoHiem/") + fileName;

                        // Lưu hình ảnh vào thư mục "image"
                        fileUpload2.SaveAs(imagePath);

                        // Lưu đường dẫn hình ảnh vào đối tượng SanPham
                        sanPham.Hinh2 = "/image/NonBaoHiem/" + fileName;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Lỗi khi lưu hình ảnh: " + ex.Message);
                    }
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Tạo câu truy vấn SQL chèn dữ liệu vào bảng SanPham
                    string query = "INSERT INTO SanPham (MaSP, TenSP, Hinh1, Hinh2, MoTa, TrongLuong, KichCo, SoLuongTon, GiaBan, MaLoaiSP) " +
                                   "VALUES (@MaSP, @TenSP,  @Hinh1, @Hinh2, @MoTa, @TrongLuong, @KichCo, @SoLuongTon, @GiaBan, @MaLoaiSP)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@MaSP", sanPham.MaSP);
                        command.Parameters.AddWithValue("@TenSP", sanPham.TenSP);
                        command.Parameters.AddWithValue("@Hinh1", sanPham.Hinh1);
                        command.Parameters.AddWithValue("@Hinh2", sanPham.Hinh2);
                        command.Parameters.AddWithValue("@MoTa", sanPham.MoTa);
                        command.Parameters.AddWithValue("@TrongLuong", sanPham.TrongLuong);
                        command.Parameters.AddWithValue("@KichCo", sanPham.KichCo);
                        command.Parameters.AddWithValue("@SoLuongTon", sanPham.SoLuongTon);
                        command.Parameters.AddWithValue("@GiaBan", sanPham.GiaBan);
                        command.Parameters.AddWithValue("@MaLoaiSP", sanPham.MaLoaiSP);

                        // Thực hiện truy vấn
                        command.ExecuteNonQuery();
                    }
                }

                Response.Write("Thêm sản phẩm thành công!");
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

    }
}