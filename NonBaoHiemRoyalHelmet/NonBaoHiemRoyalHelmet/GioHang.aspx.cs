using NonBaoHiemRoyalHelmet.data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace NonBaoHiemRoyalHelmet
{
    public partial class GioHang : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context2 = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string maDH;
        int quantity;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem giỏ hàng có tồn tại trong Session không
                if (Session["Cart"] != null)
                {
                    List<SanPham> cart = (List<SanPham>)Session["Cart"];
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();
                }
            }
        }
        protected void btnXoaSanPham_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                List<SanPham> cart = (List<SanPham>)Session["Cart"];

                LinkButton btnXoaSanPham = (LinkButton)sender;
                string maSanPhamXoa = btnXoaSanPham.CommandArgument;

                // Tìm sản phẩm trong giỏ hàng và xóa nó
                SanPham sanPhamXoa = cart.FirstOrDefault(sp => sp.MaSP == maSanPhamXoa);

                if (sanPhamXoa != null)
                {
                    cart.Remove(sanPhamXoa);
                    Session["Cart"] = cart;

                    // Refresh lại repeater để hiển thị giỏ hàng mới
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();
                }
            }
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                if (Session["Cart"] != null && Session["UserID"] != null)
                {
                    // Lấy giỏ hàng từ Session
                    List<SanPham> cart = (List<SanPham>)Session["Cart"];

                    using (var connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string countQuery = "SELECT COUNT(*) FROM DonHang";
                        using (var countCommand = new SqlCommand(countQuery, connection))
                        {
                            int userCount = (int)countCommand.ExecuteScalar();

                            maDH = $"DH{userCount + 1:D2}"; // +1 tăng lên một đơn vị, D2 số nguyên 2 chữ số
                        }
                    }

                    // Tạo đối tượng Đơn Hàng
                    DonHang donHang = new DonHang
                    {
                        MaDH = maDH,
                        MaKH = Session["UserID"].ToString(),
                        MaQTV = "QTV01",
                        NgayDH = DateTime.Now,
                        NgayGH = DateTime.Now.AddDays(7),
                        PTTT = "online",
                        TrangThai = "Đang Xử Lý",

                        TongTien = Convert.ToInt32(Session["TongTien"])
                    };

                    using (var context = new QuanLyBanHangRoyalHelmetEntities())
                    {
                        context.DonHangs.Add(donHang);
                        context.SaveChanges();
                        // Lặp qua giỏ hàng và thêm từng sản phẩm vào chi tiết đơn hàng
                        foreach (var sanPham in cart)
                        {
                            TextBox txtQuantity = (TextBox)rptCartItems.Items[cart.IndexOf(sanPham)].FindControl("txtQuantity");

                            // Xử lý số lượngt tồn
                            int soLuongDat = Convert.ToInt32(txtQuantity.Text);
                            using (var connection = new SqlConnection(connectionString))
                            {
                                connection.Open();

                                string updateQuery = "UPDATE SanPham SET SoLuongTon = SoLuongTon - @SoLuongDatHang WHERE MaSP = @MaSP";

                                using (var updateCommand = new SqlCommand(updateQuery, connection))
                                {
                                    updateCommand.Parameters.AddWithValue("@SoLuongDatHang", soLuongDat);
                                    updateCommand.Parameters.AddWithValue("@MaSP", sanPham.MaSP);

                                    int row = updateCommand.ExecuteNonQuery();

                                    if (row == 0)
                                    {
                                        Response.Write($"Lỗi: Sản phẩm '{sanPham.TenSP}' không đủ số lượng tồn.");
                                        return;
                                    }
                                }
                            }


                            CTDH chiTietDonHang = new CTDH
                            {
                                MaDH = donHang.MaDH,
                                MaSP = sanPham.MaSP,
                                SoLuong = Convert.ToInt32(txtQuantity.Text.ToString()),
                                DonGia = sanPham.GiaBan
                            };

                            context.CTDHs.Add(chiTietDonHang);
                        }

                        context.SaveChanges();
                    }

                    // Xóa giỏ hàng sau khi đã đặt hàng
                    Session["Cart"] = null;

                    Response.Write("Đặt hàng thành công!");
                    SendMail(donHang);
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("Lỗi: Giỏ hàng trống!");
                    Response.Redirect("SanPham.aspx");
                }
            }

        }

        void SendMail(DonHang donHang)
        {
            List<SanPham> cart = (List<SanPham>)Session["Cart"];
            StringBuilder body = new StringBuilder();
            body.AppendLine("<html><head>");
            body.AppendLine("<style>");
            body.AppendLine("body { font-family: Arial, sans-serif; margin: 0; padding: 0; }");
            body.AppendLine(".container { width: 80%; margin: auto; overflow: hidden; }");
            body.AppendLine("header { background: #103151; color: white; padding-top: 30px; min-height: 70px; border-bottom: #D4BB72 4px solid; }");
            body.AppendLine("header a { color: white; text-decoration: none; text-transform: uppercase; font-size: 16px; }");
            body.AppendLine("header ul { padding: 0; margin: 0; float: right; margin-top: 20px; list-style: none; }");
            body.AppendLine("header #branding { float: left; margin: 0; padding: 0; }");
            body.AppendLine("header #branding img { height: 80px; }");
            body.AppendLine("header .highlight, header .current a { color: #E8BD72; font-weight: bold; }");
            body.AppendLine("header a:hover { color: #ffffff; font-weight: bold; }");
            body.AppendLine(".main { padding: 0; }");
            body.AppendLine(".main h2 { color: #333; }");
            body.AppendLine(".main p { font-size: 18px; color: #666; }");
            body.AppendLine("table { border-collapse: collapse; width: 100%; }");
            body.AppendLine("th, td { border: 1px solid #dddddd; text-align: left; padding: 12px; font-size: 16px; }");
            body.AppendLine("th { background-color: #f2f2f2; }");
            body.AppendLine("</style>");
            body.AppendLine("</head><body>");
            body.AppendLine("<header>");
            body.AppendLine("<div class=\"container\">");
            body.AppendLine("<div id=\"branding\">");
            // Thêm ảnh logo vào giữa header
            body.AppendLine("<img src=\"https://royalhelmet.com.vn/ckfinder/userfiles/images/logo.png\" alt=\"Logo\" />");
            body.AppendLine("<h1><span class=\"highlight\">Royal Helmet</span></h1>");
            body.AppendLine("</div>");
            body.AppendLine("</div>");
            body.AppendLine("</header>");
            body.AppendLine("<div class=\"container main\">");
            body.AppendLine("<h2>Chi tiết đơn hàng:</h2>");

            body.AppendLine($"<p><strong>Mã đơn hàng:</strong> {donHang.MaDH}</p>");
            body.AppendLine($"<p><strong>Người đặt hàng:</strong> {Session["FullName"].ToString()}</p>");
            body.AppendLine($"<p><strong>Số điện thoại:</strong> {Session["Phone"].ToString()}</p>");
            body.AppendLine($"<p><strong>Email:</strong> {Session["Email"].ToString()}</p>");
            body.AppendLine($"<p><strong>Địa chỉ:</strong> {Session["Address"].ToString()}</p>");

            body.AppendLine($"<p><strong>Ngày đặt hàng:</strong> {donHang.NgayDH.ToString("dd/MM/yyyy HH:mm")}</p>");
            body.AppendLine($"<p><strong>Sản phẩm:</strong></p>");


            body.AppendLine("<table>");
            body.AppendLine("<tr><th>Tên sản phẩm</th><th>Giá bán</th><th>Số lượng</th><th>Tổng giá</th></tr>");
            double tongTien = 0;
            List<CTDH> chiTietDonHang = context2.CTDHs.Include("SanPham")
                                              .Where(ct => ct.MaDH == donHang.MaDH)
                                              .ToList();
            foreach (CTDH item in chiTietDonHang)
            {
                body.AppendLine($"<tr>");
                body.AppendLine($"<td>{item.SanPham.TenSP}</td>");
                body.AppendLine($"<td>{item.DonGia.ToString("N0")} ₫</td>");
                body.AppendLine($"<td>{item.SoLuong}</td>");
                double tongGia = item.DonGia * item.SoLuong;
                body.AppendLine($"<td>{tongGia.ToString("N0")} ₫</td>");
                body.AppendLine($"</tr>");
                tongTien += item.DonGia * item.SoLuong;
            }
            body.AppendLine($"<tr><td colspan='3'><strong>Tổng tiền:</strong></td><td>{tongTien.ToString("N0")} ₫</td></tr>");
            body.AppendLine("</table>");

            body.AppendLine("</div>");

            body.AppendLine("<footer style=\"margin-top:20px;background: #262626; color: white; padding: 20px 0;\">");
            body.AppendLine("<div class=\"container\">");
            body.AppendLine("<p>&copy; 2023 Royal Helmet. </p>");
            body.AppendLine("</div>");
            body.AppendLine("</footer>");

            body.AppendLine("</body></html>");

            // Gửi email
            MailMessage mail = new MailMessage();
            mail.To.Add(Session["Email"].ToString());
            mail.From = new MailAddress("duatreodaiduongden@gmail.com");
            mail.Subject = "ROYAL HELMET - CHI TIẾT ĐƠN HÀNG TEST";
            mail.Body = body.ToString();
            mail.IsBodyHtml = true; // Bật chế độ HTML

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("duatreodaiduongden@gmail.com", "aiyt kzuj xpbq ygda");

            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                // Xử lý nếu có lỗi khi gửi mail
                Response.Write($"Lỗi khi gửi mail: {ex.Message}");
            }
        }




        double tongTien = 0;
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                List<SanPham> cart = (List<SanPham>)Session["Cart"];

                foreach (RepeaterItem item in rptCartItems.Items)
                {
                    TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
                    Label lblTongGia = (Label)item.FindControl("lblTongGia");


                    if (int.TryParse(txtQuantity.Text, out quantity))
                    {
                        // Lấy mã sản phẩm từ CommandArgument của LinkButton
                        string maSanPham = ((LinkButton)item.FindControl("DelProFromCart")).CommandArgument;

                        // Tìm sản phẩm trong giỏ hàng và cập nhật số lượng
                        SanPham sanPham = cart.FirstOrDefault(sp => sp.MaSP == maSanPham);
                        if (sanPham != null)
                        {
                            // Cập nhật Tổng Giá
                            lblTongGia.Text = (sanPham.GiaBan * quantity).ToString("N0") + " ₫";
                            txtQuantity.Text = quantity.ToString();
                            double tongGia = sanPham.GiaBan * quantity;
                            tongTien += tongGia;
                        }
                    }
                    Session["TongTien"] = tongTien;
                    lbTongTien.Text = "Tổng tiền: " + tongTien.ToString("N0") + " ₫";

                }
                if (!IsPostBack)
                {
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();
                }
                Session["Cart"] = cart;
            }
        }
    }
}