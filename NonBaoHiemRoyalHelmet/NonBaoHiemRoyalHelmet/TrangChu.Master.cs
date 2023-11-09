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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConnect_Click(object sender, EventArgs e)
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString;
            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    connection.Open();

            //    // Thực hiện truy vấn để lấy dữ liệu từ database
            //    string query = "SELECT * FROM QuanLyBanHangRoyalHelmet";
            //    SqlCommand command = new SqlCommand(query, connection);
            //    SqlDataReader reader = command.ExecuteReader();

            //    // Xử lý dữ liệu lấy được, ví dụ: hiển thị trong một label
            //    while (reader.Read())
            //    {
            //        string data = reader["TenCot"].ToString();
            //        // Hiển thị dữ liệu lấy được trên trang
            //        lbShow.Text = data;
            //    }

            //    // Đóng kết nối
            //    connection.Close();
            //}
            SqlDataSource1.DataBind();
        }
    }
}