<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Thêm các style cho form đăng nhập */
        .login-form {
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

            .form-group input {
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-form">
        <div class="form-group">
            <label for="txtUsername">Tên đăng nhập:</label>
            <asp:TextBox ID="txtUsername" runat="server" />
        </div>
        <div class="form-group">
            <label for="txtPassword">Mật khẩu:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </div>
        <div class="form-group">
            <asp:Button CssClass="my-button" ID="btnLogin" runat="server" Text="Đăng Nhập" OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>
