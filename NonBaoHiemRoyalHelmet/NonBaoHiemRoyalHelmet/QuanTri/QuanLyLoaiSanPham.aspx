<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyLoaiSanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.QuanLyLoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <style>
        .container {
    display: flex;
    justify-content: center;
    align-items: center;
}
        .product-table {
            width: 50%;
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
                <li class="breadcrumb-item"><a href="ThongTinQuanTri.aspx">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="QuanLyLoaiSanPham.aspx" style="font-weight: bold; color: #F19828">Danh sách loại sản phẩm</a></li>
            </ol>
        </nav>
        <h2>Danh sách loại sản phẩm</h2>
        <%--<asp:Button CssClass="btn btn-outline-info" runat="server" Text="Thêm sản phẩm" OnClick="AddProduct" />--%>
        <asp:Button CssClass="btn btn-outline-info" runat="server" Text="Thêm sản phẩm" />
        <div class="container">

        <table class="product-table">
            <thead>
                <tr>
                    <th>Mã loại</th>
                    <th>Tên mã loại</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="adminShowProducts" runat="server" OnItemCommand="adminShowProducts_ItemCommand">
                    <ItemTemplate>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <tr>
                            

                            <td style="width: 110px"><%# Eval("MaLoaiSP") %></td>
                            <td style="width: 290px"><%# Eval("TenLoaiSP") %></td>

                           
                          <%--  <td>
                                <asp:Button CssClass="btn btn-outline-success" runat="server" Text="Sửa" OnClick="btnEdit_Click" CommandArgument='<%# Eval("MaSP") %>' />
                                <asp:Button CssClass="btn btn-outline-danger" runat="server" Text="Xoá" CommandName="DeleteProduct" CommandArgument='<%# Eval("MaSP") %>' OnClientClick="return confirm('Bạn có chắc chắn xóa sản phẩm này?');" PostBackUrl="~/QuanLySanPham.aspx" />
                            </td>--%>
                           <%-- <td>
                                <asp:Button CssClass="btn btn-outline-success" runat="server" Text="Sửa" CommandArgument='<%# Eval("MaSP") %>' />
                                <asp:Button CssClass="btn btn-outline-danger" runat="server" Text="Xoá" CommandName="DeleteProduct" CommandArgument='<%# Eval("MaSP") %>' OnClientClick="return confirm('Bạn có chắc chắn xóa sản phẩm này?');" PostBackUrl="~/QuanLySanPham.aspx" />
                            </td>--%>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        </div>

    </form>
</asp:Content>
