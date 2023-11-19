using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendMail();
        }
        void SendMail()
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("nguyentai24052002@gmail.com");
            mail.From = new MailAddress("duatreodaiduongden@gmail.com");
            mail.Subject = "demo";
            mail.Body = "demo";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("duatreodaiduongden@gmail.com", "aiyt kzuj xpbq ygda");
            smtp.Send(mail);

            // nguyentai: brti yino pggm lxct
            //smtp.Credentials = new NetworkCredential("nguyenminhtai67890@gmail.com", "wguq kwmw wmac avnw");

            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //mail.To.Add("duatreodaiduongden@gmail.com");
            //mail.From = new MailAddress("itachiyeuminhem01@gmail.com", "Email head", System.Text.Encoding.UTF8);
            //mail.Subject = "This mail is send from asp.net application";
            //mail.SubjectEncoding = System.Text.Encoding.UTF8;
            //mail.Body = "This is Email Body Text";
            //mail.BodyEncoding = System.Text.Encoding.UTF8;
            //mail.IsBodyHtml = true;
            //mail.Priority = MailPriority.High;
            //SmtpClient client = new SmtpClient();
            //client.Credentials = new System.Net.NetworkCredential("itachiyeuminhem01@gmail.com", "Tai12345678.");
            //client.Port = 587;
            //client.Host = "smtp.gmail.com";
            //client.EnableSsl = true;
            //try
            //{
            //    client.Send(mail);
            //    Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='Mail.aspx';}</script>");
            //}
            //catch (Exception ex)
            //{
            //    Exception ex2 = ex;
            //    string errorMessage = string.Empty;
            //    while (ex2 != null)
            //    {
            //        errorMessage += ex2.ToString();
            //        ex2 = ex2.InnerException;
            //    }
            //    Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='Mail.aspx';}</script>");
            //}
        }
    }
}