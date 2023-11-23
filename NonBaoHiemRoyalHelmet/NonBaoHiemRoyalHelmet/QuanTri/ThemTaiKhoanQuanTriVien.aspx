<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThemTaiKhoanQuanTriVien.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.ThemTaiKhoanQuanTriVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .registration-form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-group input,
            .form-group select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                margin-bottom: 10px;
                border: 1px solid black;
                border-radius: 6px;
            }

        .my-button {
            background-color: #E8BD72;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            border: 4px solid black;
        }

            .my-button:hover {
                background-color: #242424;
                border: 1px solid #E8BD72;
            }

        .radio-group {
            display: flex;
            align-items: center;
        }

            .radio-group input[type="radio"] {
                margin-right: -100px;
            }

        .diachi {
            width: 100%;
            height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <nav aria-label="breadcrumb">
        <ol style="background-color: #F9FBFD" class="breadcrumb">
            <li class="breadcrumb-item"><a>Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="ThemTaiKhoanQuanTriVien.aspx" style="font-weight: bold; color: #F19828">Thông tin quản trị</a></li>
        </ol>
    </nav>
    <h2>Cấp thêm tài khoản quản trị viên</h2>
    <form id="formAdmin" runat="server">

        <div class="registration-form">
            <div class="form-group">
                <label for="txtNewUsername">Tên đăng nhập:</label>
                <asp:TextBox ID="txtNewUsername" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtNewPassword">Mật khẩu:</label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" />
            </div>
            <div class="form-group">
                <label for="txtTenKH">Tên quản trị viên:</label>
                <asp:TextBox ID="txtTenKH" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>

            <div class="form-group">
                <label for="fileAnhDaiDien">Ảnh đại diện:</label>
                <asp:FileUpload ID="fileAnhDaiDien" runat="server" />
            </div>

            <div class="form-group">
                <asp:Button CssClass="my-button" ID="btnRegister" runat="server" Text="Đăng Ký" OnClick="btnRegister_Click" />
            </div>
        </div>
    </form>
</asp:Content>
