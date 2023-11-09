using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=QuanLyBanHangRoyalHelmet;Integrated Security=True";

                // Câu truy vấn SQL để lấy danh sách tên loại sản phẩm
                string query = "SELECT TenLoaiSP FROM LoaiSP";

                // Mở kết nối
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Thực hiện truy vấn
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Lặp và thêm tên loại sản phẩm vào danh sách
                            while (reader.Read())
                            {
                                string tenLoaiSP = reader["TenLoaiSP"].ToString();

                                // Tạo một ListItem và thêm vào danh sách
                                ListItem listItem = new ListItem(tenLoaiSP);
                                //listTenSP.Items.Add(listItem);
                            }
                        }
                    }
                }
            }
        }
    }
}