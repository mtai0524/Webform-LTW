<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ThongTinQuanTri.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.QuanTri.ThongTinQuanTri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Thêm các style cho form đăng ký */
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

        .circle-image {
            width: 150px;
            height: 150px;
            overflow: hidden;
            border-radius: 50%;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .circle-image img {
                max-width: 100%;
                height: auto;
                border-radius: 50%;
            }

        .diachi {
            width: 100%;
            height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <form id="formAdmin" runat="server">
        <div class="registration-form">
            <div class="form-group">
                <label for="txtTenKH">Tên quản trị:</label>
                <asp:TextBox ID="txtTenKH" runat="server" />
            </div>
            <div class="form-group">
                <label>Giới tính:</label>
                <div class="radio-group">
                    <asp:RadioButton ID="radNam" runat="server" GroupName="radGioiTinh" Text="Nam" />
                    <asp:RadioButton ID="radNu" runat="server" GroupName="radGioiTinh" Text="Nữ" />
                </div>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtSoDienThoai">Số điện thoại:</label>
                <asp:TextBox ID="txtSoDienThoai" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtDiaChi">Địa chỉ:</label>
                <asp:TextBox CssClass="diachi" ID="txtDiaChi" runat="server" TextMode="MultiLine" />
            </div>

            <div class="form-group">
                <label for="fileAnhDaiDien">Ảnh đại diện:</label>
                <asp:FileUpload ID="fileAnhDaiDien" runat="server" />
                <!-- Hiển thị ảnh đại diện -->
                <div class="circle-image">
                    <img id="imgAnhDaiDien" runat="server" src="" alt="Ảnh đại diện" />
                </div>
            </div>

            <div class="form-group">
                <asp:Button CssClass="my-button" ID="btnUpdateInfo" runat="server" Text="Cập nhật" OnClick="btnUpdateInfo_Click" />
            </div>
        </div>
    </form>
</asp:Content>
