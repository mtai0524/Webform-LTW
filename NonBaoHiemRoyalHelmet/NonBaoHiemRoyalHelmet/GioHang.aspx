<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rptCartItems" runat="server">
    <ItemTemplate>
        <div class="cart-item">
            <img src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' />
            <div class="item-details">
                <h3><%# Eval("TenSp") %></h3>
                <p>Giá: <%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</p>
               <%-- <p>
                    Số lượng:
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                </p>--%>
                <%--<p>Tổng tiền: <%# CalculateTotal(Convert.ToDecimal(Eval("GiaBan")), Convert.ToInt32(Eval("Quantity"))).ToString("N0") %> ₫</p>--%>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>
