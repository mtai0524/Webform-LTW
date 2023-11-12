<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.QuanLySanPham" %>

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
    <form id="form1"  runat="server">
        <nav aria-label="breadcrumb">
            <ol style="background-color:#F9FBFD" class="breadcrumb">
                <li class="breadcrumb-item"><a >Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="QuanLySanPham.aspx" style="font-weight:bold; color:#F19828" >Danh sách sản phẩm</a></li>
            </ol>
        </nav>
        <h2>Danh sách sản phẩm</h2>
        <asp:Button CssClass="btn btn-outline-info" runat="server" Text="Thêm sản phẩm" OnClick="AddProduct" />

        <table class="product-table">
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Mô tả</th>
                    <th>Trọng lượng</th>
                    <th>Kích cỡ</th>
                    <th>Số lượng tồn</th>
                    <th>Giá bán</th>
                    <th>Mã loại</th>
                    <th>Tên mã loại</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="adminShowProducts" runat="server" OnItemCommand="adminShowProducts_ItemCommand">
                    <ItemTemplate>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <tr>
                            <td style="width: 110px">
                                <img height="88px" src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' /></td>

                            <td style="width: 110px"><%# Eval("MaSp") %></td>
                            <td style="width: 290px"><%# Eval("TenSp") %></td>

                            <td style="width: 110px"><%# Eval("MoTa") %></td>
                            <td style="width: 110px"><%# Eval("TrongLuong") %></td>
                            <td style="width: 210px"><%# Eval("KichCo") %></td>
                            <td style="width: 110px"><%# Eval("SoLuongTon") %></td>
                            <td style="width: 110px"><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</td>
                            <td style="width: 110px"><%# Eval("MaLoaiSP") %></td>
                            <td style="width: 110px"><%# Eval("LoaiSp.TenLoaiSp") %></td>
                            <td>
                                <asp:Button CssClass="btn btn-outline-success" runat="server" Text="Sửa" OnClick="btnEdit_Click" CommandArgument='<%# Eval("MaSP") %>' />
                                <asp:Button CssClass="btn btn-outline-danger" runat="server" Text="Xoá" CommandName="DeleteProduct" CommandArgument='<%# Eval("MaSP") %>' OnClientClick="return confirm('Bạn có chắc chắn xóa sản phẩm này?');" PostBackUrl="~/QuanLySanPham.aspx" />
                            </td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </form>
</asp:Content>
