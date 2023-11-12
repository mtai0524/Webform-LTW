<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div>
        <h2>Thêm Sản Phẩm</h2>
        <form id="themSanPham" runat="server">

            <table>
                <tr>
                    <td>Mã sản phẩm:</td>
                    <td>
                        <asp:TextBox ID="txtMaSP" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên sản phẩm:</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox></td>
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
                    <td colspan="2">
                        <asp:Button ID="btnThemSanPham" runat="server" Text="Thêm sản phẩm" OnClick="btnThemSanPham_Click" />
                        <%--OnClick="btnThemSanPham_Click"--%>
                    </td>
                </tr>


            </table>
        </form>

    </div>
</asp:Content>
