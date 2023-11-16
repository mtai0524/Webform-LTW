<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="LoaiSanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.LoaiSanPham" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .product-list {
            list-style: none;
            padding: 0;
        }

        .product-list-item {
            border: 1px solid #ddd;
            margin: 5px;
            padding: 10px;
        }

        .container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .category, .card-container {
            box-sizing: border-box;
        }

        .category {
            text-align: left !important;
            flex-basis: 20%; /* Đặt chiều rộng của cột đầu tiên */
        }

        .card-container {
            flex-basis: 80%; /* Đặt chiều rộng của cột thứ hai */
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            border: 1px solid #ddd;
            padding-top: 15px;
            border-radius: 9px;
            margin: 10px;
            width: 400px;
            box-shadow: 3px 4px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

            .card img {
                width: 100%;
                height: auto;
                transition: transform 0.3s ease-in-out;
            }

                .card img:hover {
                    transform: scale(0.8);
                }

        .card-body {
            text-align: center;
            background-color: #E8BD72;
            padding-top: 15px;
            height: 90px;
            border-bottom-left-radius: 9px;
            border-end-end-radius: 9px;
        }

            .card-body:hover h3 {
                font-weight: 800;
                color: #FFFFFF;
            }

        .show-all-prod {
            display: inline-block;
            padding: 8px 12px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }


    </style>

    <div class="container">
        <div class="category">
            <h4 style="text-align: left!important; margin: 50px 70px 0px 80px; text-decoration: none;">
                <asp:LinkButton ID="lnkShowAllProducts" runat="server" Text="Hiển thị tất cả" OnClick="lnkShowAllProducts_Click" CssClass="show-all-prod"></asp:LinkButton>
            </h4>
            <asp:Repeater ID="rptLoaiSP" runat="server" OnItemCommand="rptLoaiSP_ItemCommand">
                <ItemTemplate>
                    <%--margin: top left bottom right--%>
                    <h4 class="btnShowProducts" style="text-align: left!important; margin: 50px 70px 0px 80px; text-decoration: none;">
                        <asp:LinkButton Style="text-decoration: none; color: black" ID="btnShowProducts" runat="server" CommandName="ShowProducts" CommandArgument='<%# Eval("MaLoaiSP") %>'><b><%# Eval("TenLoaiSP") %></b>
                        </asp:LinkButton></h4>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div class="card-container">

            <asp:Repeater ID="rptListSp" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <a href='<%# Eval("DetailUrl") %>'>
                            <img src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' />
                        </a>
                        <div class="card-body">
                            <h3 class="tenSp"><%# Eval("TenSp") %></h3>
                            <p><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
