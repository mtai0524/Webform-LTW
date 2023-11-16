<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <style>
        #themSanPham {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td, th {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            margin: 4px 0;
            box-sizing: border-box;
        }
    </style>
    <div>
        <nav aria-label="breadcrumb">
            <ol style="background-color: #F9FBFD" class="breadcrumb">
                <li class="breadcrumb-item"><a>Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="QuanLySanPham.aspx">Danh sách sản phẩm</a></li>
                <li class="breadcrumb-item"><a href="ThemSanPham.aspx" style="font-weight: bold; color: #F19828" class="my-active-link">Thêm sản phẩm</a></li>
            </ol>
        </nav>
        <h2>Thêm Sản Phẩm</h2>
        <form id="themSanPham" runat="server">

            <table>
                <tr>
                    <td>Mã sản phẩm:</td>
                    <td>
                        <asp:TextBox ID="txtMaSP" runat="server" Text="Nhập 5 ký tự"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên sản phẩm:</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Trọng lượng:</td>
                    <td>
                        <asp:TextBox ID="txtTrongLuong" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Kích cỡ:</td>
                    <td>
                        <asp:TextBox ID="txtKichCo" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Số lượng tồn:</td>
                    <td>
                        <asp:TextBox ID="txtSoLuongTon" runat="server" Text="Nhập số nguyên"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Giá bán:</td>
                    <td>
                        <asp:TextBox ID="txtGiaBan" runat="server" Text="Nhập số nguyên"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mô tả:</td>
                    <td>
                        <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mã loại:</td>
                    <td>
                        <asp:DropDownList ID="ddlMaLoaiSP" runat="server" AutoPostBack="false">
                            <asp:ListItem Text="- Select -" Value="" />
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>Upload hình ảnh:</td>
                    <td>
                        <asp:FileUpload ID="fileUpload" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Upload hình ảnh 2:</td>
                    <td>
                        <asp:FileUpload ID="fileUpload2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button CssClass="btn btn-outline-primary" ID="btnThemSanPham" runat="server" Text="Thêm sản phẩm" OnClick="btnThemSanPham_Click" />
                        <%--OnClick="btnThemSanPham_Click"--%>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</asp:Content>