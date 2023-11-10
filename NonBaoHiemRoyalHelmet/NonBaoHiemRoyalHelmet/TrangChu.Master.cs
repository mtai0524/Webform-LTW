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
                        GridView1.DataSource = reader;
                        GridView1.DataBind();

                        GridView1.HeaderRow.Cells[0].Text = "Mã Loại SP";
                        GridView1.HeaderRow.Cells[1].Text = "Tên Loại SP";
                    }
                }

                // Đóng kết nối
                connection.Close();
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
    }
}