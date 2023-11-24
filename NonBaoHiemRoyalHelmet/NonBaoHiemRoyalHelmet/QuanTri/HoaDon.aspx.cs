using Org.BouncyCastle.Asn1.X509;
using PdfSharpCore.Drawing;
using PdfSharpCore.Pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace NonBaoHiemRoyalHelmet.QuanTri
{

    public partial class HoaDon : System.Web.UI.Page
    {
        private readonly QuanLyBanHangRoyalHelmetEntities context = new QuanLyBanHangRoyalHelmetEntities();

        private string connectionString = ConfigurationManager.ConnectionStrings["QuanLyBanHangRoyalHelmetConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // lỗi in pdf nếu không check postback
            if (!IsPostBack)
            {
                // Kiểm tra xem người dùng đã đăng nhập hay chưa
                if (Session["AdminName"] != null)
                {
                    // Nếu đã đăng nhập, hiển thị danh sách sản phẩm
                    HienThiDonHang();
                }
                else
                {
                    // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
                    Response.Redirect("/DangNhap.aspx");
                }
            }
        
        }
        private void HienThiDonHang()
        {
            using (var context = new QuanLyBanHangRoyalHelmetEntities())
            {
                try
                {
                    var donhangs = context.DonHangs.ToList();

                    adminShowProducts.DataSource = donhangs;
                    adminShowProducts.DataBind();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            string maDH = (sender as Button).CommandArgument;

            DonHang order = context.DonHangs.FirstOrDefault(x => x.MaDH == maDH);

            if (order != null)
            {
                KhachHang khachHang = context.KhachHangs.FirstOrDefault(x => x.MaKH == order.MaKH);

                using (MemoryStream ms = new MemoryStream())
                {
                    var document = new PdfDocument();
                    var page = document.AddPage();
                    var gfx = XGraphics.FromPdfPage(page);

                    XFont titleFont = new XFont("Arial", 18, XFontStyle.Bold);
                    XFont headingFont = new XFont("Arial", 14, XFontStyle.Bold);
                    XFont regularFont = new XFont("Arial", 12, XFontStyle.Regular);

                    // Title
                    gfx.DrawString("Hóa đơn thanh toán", titleFont, XBrushes.Black, new XRect(10, 10, page.Width, 20), XStringFormats.Center);

                    gfx.DrawString($"Mã hóa đơn: {order.MaDH}", headingFont, XBrushes.Black, new XRect(30, 40, page.Width, 20), XStringFormats.TopLeft);
                    gfx.DrawString($"Ngày đặt: {order.NgayDH.ToString("dd/MM/yyyy HH:mm")}", headingFont, XBrushes.Black, new XRect(50, 40, page.Width - 80, 20), XStringFormats.TopRight);

                    gfx.DrawString($"Tên khách hàng: {khachHang.TenKH}", headingFont, XBrushes.Black, new XRect(30, 60, page.Width, 20), XStringFormats.TopLeft);
                    gfx.DrawString($"Email: {khachHang.Email}", headingFont, XBrushes.Black, new XRect(30, 80, page.Width, 20), XStringFormats.TopLeft);
                    gfx.DrawString($"Số điện thoại: {khachHang.SoDT}", headingFont, XBrushes.Black, new XRect(30, 100, page.Width, 20), XStringFormats.TopLeft);

                    gfx.DrawString("Danh sách sản phẩm:", headingFont, XBrushes.Black, new XRect(30, 120, page.Width, 20), XStringFormats.TopLeft);
                    int yOffset = 140;
          
                    int tableX = 10;
                    int tableY = 140;
                    int cellPadding = 5;
                    int columnWidth = 100;

                    gfx.DrawString("Tên sản phẩm", headingFont, XBrushes.Black, new XRect(tableX + 30, tableY, columnWidth, 20), XStringFormats.TopLeft);
                    gfx.DrawString("Số lượng", headingFont, XBrushes.Black, new XRect(tableX + columnWidth + 200, tableY, columnWidth, 20), XStringFormats.TopLeft);
                    gfx.DrawString("Giá bán", headingFont, XBrushes.Black, new XRect(tableX + 2 * columnWidth + 300, tableY, columnWidth, 20), XStringFormats.TopLeft);

                    tableY += 20;

                    foreach (var item in order.CTDHs)
                    {
                        SanPham sanpham = context.SanPhams.FirstOrDefault(x => x.MaSP == item.MaSP);

                        gfx.DrawString(sanpham.TenSP, regularFont, XBrushes.Black, new XRect(tableX + 30, tableY, columnWidth, 20), XStringFormats.TopLeft);
                        gfx.DrawString(item.SoLuong.ToString(), regularFont, XBrushes.Black, new XRect(tableX + columnWidth + 230, tableY, columnWidth + 100, 20), XStringFormats.TopLeft);
                        gfx.DrawString(item.DonGia.ToString("N0") + " ₫", regularFont, XBrushes.Black, new XRect(tableX + 2 * columnWidth + 80, tableY, columnWidth + 200, 20), XStringFormats.TopRight);

                        tableY += 20;
                        yOffset += 20;
                    }


                    gfx.DrawString($"Tổng tiền: {order.TongTien.ToString("N0") + " ₫"}", headingFont, XBrushes.Red, new XRect(50, yOffset + 20, page.Width - 80, 20), XStringFormats.TopRight);

                    document.Save(ms);

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", $"attachment;filename=HoaDonThanhToan_{maDH}.pdf");
                    Response.BinaryWrite(ms.ToArray());
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}