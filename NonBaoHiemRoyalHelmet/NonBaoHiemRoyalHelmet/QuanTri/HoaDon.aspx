<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HoaDon.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.HoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
        <style>
        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .product-table th, .product-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .product-table th {
                background-color: #f2f2f2;
            }
    </style>

    <form id="form1" runat="server">
    <nav aria-label="breadcrumb">
        <ol style="background-color: #F9FBFD" class="breadcrumb">
            <li class="breadcrumb-item"><a>Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="HoaDon.aspx" style="font-weight: bold; color: #F19828">Danh sách đơn hàng</a></li>
        </ol>
    </nav>
    <h2>Danh sách đơn hàng</h2>

    <table class="product-table">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Mã khách hàng</th>
                <th>Mã quản trị viên</th>
                <th>Ngày đặt hàng</th>
                <th>Ngày giao hàng</th>
                <th>Phương thức thanh toán</th>
                <th>Trạng thái</th>
                <th>Tổng tiền</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="adminShowProducts" runat="server">
                <ItemTemplate>
                    <!-- Hiển thị thông tin sản phẩm -->
                    <tr>

                        <td style="width: 80px"><%# Eval("MaDH") %></td>
                        <td style="width: 80px"><%# Eval("MaKH") %></td>

                        <td style="width: 80px"><%# Eval("MaQTV") %></td>
                        <td style="width: 110px"><%# Eval("NgayDH") %></td>
                        <td style="width: 100px"><%# Convert.ToDateTime(Eval("NgayGH")).ToString("dd/MM/yyyy") %></td>

                        <td style="width: 110px"><%# Eval("PTTT") %></td>
                        <td style="width: 110px"><%# Eval("TrangThai") %></td>
                        <td style="width: 110px"><%# Convert.ToDecimal(Eval("TongTien")).ToString("N0") %> ₫</td>
                
                        <td style="width: 110px">
                <asp:Button CssClass="btn btn-outline-info" runat="server" Text="In hóa đơn" OnClick="btnPDF_Click" CommandArgument='<%# Eval("MaDH") %>' />
            </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</form>
</asp:Content>
