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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] != null)
            //{
            //    string userId = Session["UserID"].ToString();
            //    lblUserId.Text = $"UserID: {userId}";
            //}

            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                lblUsername.Text = $"xin chào {username}";
                lnkAdmin.Text = "";
                lnkInfo.Text = "Thông tin tài khoản";
                LoadAvatar();
            }
            if (Session["AdminName"] != null)
            {
                string username = Session["AdminName"].ToString();
                lblUsername.Text = $"xin chào {username}";
                lnkAdmin.Text = "Quản trị hệ thống";
                lnkInfo.Text = "";
            }
            if (!IsPostBack)
            {
                DisplayData();
            }
        }
        public void DisplayData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Truy vấn dữ liệu
                string query = "SELECT * FROM LoaiSP";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // hiển thị data trong GridView

                    }

                }

                // Đóng kết nối
                connection.Close();
            }
        }

        private void LoadAvatar()
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    // Lấy thông tin khách hàng từ cơ sở dữ liệu bằng MaKH
                    string userID = Session["UserID"].ToString();
                    var customer = context.KhachHangs.SingleOrDefault(kh => kh.MaKH == userID);

                    if (customer != null)
                    {
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
        protected void btnConnect_Click(object sender, EventArgs e)
        {
            //SqlDataSource1.DataBind();


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    lbStatus.Text = "Kết nối thành công!";
                }
                catch (Exception ex)
                {
                    lbStatus.Text = "Lỗi kết nối: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("Home.aspx");
        }
        protected void lnkAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanTri/QuanLySanPham.aspx");
        }
        protected void lnkInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongTinKhachHang.aspx");
        }
    }
}