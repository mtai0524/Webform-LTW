using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonBaoHiemRoyalHelmet
{
    public partial class GioHang : System.Web.UI.Page
    {
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

        public decimal CalculateTotal(decimal price, int quantity)
        {
            return price * quantity;
        }


    }
}