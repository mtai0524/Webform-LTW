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

namespace NonBaoHiemRoyalHelmet
{
    public partial class GioHang : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities(); // có thể thay bằng QuanLyBanHangRoyalHelmetEntities do ADO tự tạo trước


        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        string maDH;
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
            if (Session["Cart"] != null)
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
                    MaKH = "KH01",
                    MaQTV = "QTV01",
                    NgayDH = DateTime.Now,
                    NgayGH = DateTime.Now.AddDays(7),
                    PTTT = "online",
                    TrangThai = "Đang Xử Lý",
                    TongTien = cart.Sum(item => item.GiaBan)
                };

                using (var context = new QuanLyBanHangRoyalHelmetEntities())
                {
                    context.DonHangs.Add(donHang);
                    context.SaveChanges();

                    // Lặp qua giỏ hàng và thêm từng sản phẩm vào chi tiết đơn hàng
                    foreach (var sanPham in cart)
                    {
                        CTDH chiTietDonHang = new CTDH
                        {
                            MaDH = donHang.MaDH,
                            MaSP = sanPham.MaSP,
                            SoLuong = 1,
                            DonGia = sanPham.GiaBan
                        };

                        context.CTDHs.Add(chiTietDonHang);
                    }

                    context.SaveChanges();
                }

                // Xóa giỏ hàng sau khi đã đặt hàng
                Session["Cart"] = null;

                Response.Write("Đặt hàng thành công!");
                SendMail();
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("Lỗi: Giỏ hàng trống!");
                Response.Redirect("SanPham.aspx");
            }
        }
        void SendMail()
        {
            // Lấy thông tin chi tiết đơn hàng từ cơ sở dữ liệu
            List<DonHang> donHangs = context.DonHangs.ToList();
            List<CTDH> ctdh = context.CTDHs.Include("SanPham").ToList();

            // Xây dựng nội dung email
            StringBuilder body = new StringBuilder();
            body.AppendLine("Chi tiết đơn hàng:");

            foreach (DonHang donHang in donHangs)
            {
                body.AppendLine($"Mã đơn hàng: {donHang.MaDH}");
                body.AppendLine($"Ngày đặt hàng: {donHang.NgayDH.ToString("dd/MM/yyyy HH:mm:ss")}");
                body.AppendLine("Sản phẩm:");

                List<CTDH> chiTietDonHang = ctdh.Where(ct => ct.MaDH == donHang.MaDH).ToList();

                foreach (CTDH item in chiTietDonHang)
                {
                    body.AppendLine($"- {item.SanPham.TenSP}, Số lượng: {item.SoLuong}, Giá: {item.DonGia}");
                }

                body.AppendLine("--------------");
            }

            // Gửi email
            MailMessage mail = new MailMessage();
            mail.To.Add("nguyentai24052002@gmail.com");
            mail.From = new MailAddress("duatreodaiduongden@gmail.com");
            mail.Subject = "ROYAL HELMET - CHI TIẾT ĐƠN HÀNG TEST";
            mail.Body = body.ToString();

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
    }
}