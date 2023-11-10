<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="VCT">
        <div class="VCT-title">
            <span><b>————————————————Sản phẩm————————————————</b></span>
            <br />
            <asp:Label ID="lbTenSp" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Repeater ID="rptDetailProd" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <img src='<%# Eval("HinhAnh") %>' alt='<%# Eval("TenSp") %>' />
                        <div class="card-body">
                            <h3 class="tenSp"><%# Eval("TenSp") %></h3>
                            <%--<p>Mô tả: <%# Eval("MoTa") %></p>--%>
                            <p><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</p>
                            <%--hiển thị tiền dạng việt nam--%>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>



</asp:Content>

