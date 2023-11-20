<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 20vh;
            margin-bottom: 280px;
        }

        .card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin: 10px;
            width: 700px;
            text-align: left;
        }

            .card img {
                border: 1px solid #fff;
                border-radius: 9px;
                margin-top: 150px;
                padding: 40px;
                margin-right: 20px;
                width: 250px;
                height: auto;
                box-shadow: 3px 4px 8px 5px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

                .card img:hover {
                    transform: scale(1.1);
                }

        .card-body {
            margin-top: 40px;
            text-align: left;
        }

            .card-body h3 {
                text-align: left;
            }

        h15 {
            font-size: 14px;
        }

        .VCT-title {
            text-align: center;
            margin-top: -70px;
            margin-bottom: 120px;
        }

        h3.tenSp {
            font-weight: 900;
        }
    </style>
    <div class="VCT">

        <asp:Repeater ID="rptDetailProd" runat="server">

            <ItemTemplate>
                <span class="VCT-title"><b><%# Eval("TenSp") %></b></span>

                <div class="centered-container">

                    <div class="card">
                        <img src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' />
                        <div class="card-body">
                            <h3 style="font-weight: 900; color: #E8BD72"><%# Eval("TenSp") %></h3>
                            <br />
                            <span style="font-size: 13px">Mã sản phẩm:<span style="font-size: 13px; color: #E8BD72"> <%# Eval("TenSp") %></span></span><br />
                            <span style="font-size: 13px">Loại:<a href='<%# "LoaiSanPham.aspx?MaLoaiSanPham=" + Eval("LoaiSp.MaLoaiSP") %>' style="font-size: 13px; color: red; text-decoration:none">
                                <%# Eval("LoaiSp.TenLoaiSp") %>
                            </a></span>
                            <br />
                            <br />
                            <p style="color: red; font-weight: bolder"><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</p>
                            <br />
                            <h15>- <%# Eval("MoTa") %></h15><br />
                            <h15>- <%# Eval("TrongLuong") %></h15><br />
                            <h15 style="font-weight: bolder">- <%# Eval("KichCo") %></h15> <br />
                    <asp:LinkButton ID="btnAddToCart" runat="server" Text="Thêm vào giỏ hàng" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("MaSP") %>' />

                        </div>
                    </div>

                </div>

                <script>
                    $(document).ready(function () {
                        $('.card img').hover(
                            function () {
                                // Thay đổi đường dẫn ảnh trong database
                                var newImageUrl = '<%# Eval("Hinh2") %>';
                                 $(this).attr('src', newImageUrl);
                             },
                             function () {
                                 // Thay đổi đường dẫn ảnh về ban đầu
                                 var originalImageUrl = '<%# Eval("Hinh1") %>';
                                 $(this).attr('src', originalImageUrl);
                             }
                         );
                     });
                </script>
            </ItemTemplate>
        </asp:Repeater>
    </div>




</asp:Content>

