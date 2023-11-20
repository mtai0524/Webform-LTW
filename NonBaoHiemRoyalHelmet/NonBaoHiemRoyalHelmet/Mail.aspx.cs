using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;

namespace NonBaoHiemRoyalHelmet
{
    public partial class Mail : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities();
        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SendMail();
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
                body.AppendLine($"Ngày đặt hàng: {donHang.NgayDH}");
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
            mail.Subject = "ROYAL HELMET - CHI TIẾT ĐƠN HÀNG";
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
