<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .cart-table {
            margin-top: 10px;
            width: 80%;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
        }

        .cart-table th {
            padding: 8px;
            text-align: center;
        }

        .cart-item img {
            width: 100px;
            height: 100px;
        }

        

        .buttons {
            margin-top: 10px;
            align-self: flex-end; /* góc dưới bên phải */
            margin-right: 150px;

        }
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <table class="cart-table">
            <tr>
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
            <asp:Repeater ID="rptCartItems" runat="server">
                <ItemTemplate>
                    <tr class="cart-item">
                        <td style="width: 150px">
                            <img src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' /></td>
                        <td>
                            <%# Eval("TenSp") %><br />
                            <asp:LinkButton ID="DelProFromCart" OnClick="btnXoaSanPham_Click" runat="server" CommandArgument='<%# Eval("MaSP") %>'>Xóa</asp:LinkButton>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server" ></asp:TextBox>
                        </td>
                        <td><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</td>
                    </tr>
                    <tr>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>

        <div class="buttons">
            <button>cap nhat</button>
            <asp:Button ID="btnDatHang" runat="server" Text="Đặt Hàng" OnClick="btnDatHang_Click" />
        </div>
    </div>
</asp:Content>
