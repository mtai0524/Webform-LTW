<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .VCT-aspx {
            background-color: #ffffff;
        }

        .horizontal-list {
            list-style-type: none;
        }

            .horizontal-list li {
                display: inline-flex;
                justify-content: center; /*căng giữa nội dung*/
                margin-right: 10px;
                margin-top: 10px;
                border: 1px solid gray;
                padding: 5px;
                border-radius: 5px;
                transition: 0.4s ease-in;
            }

                .horizontal-list li:hover {
                    transform: scale(1.1);
                }

                .horizontal-list li a {
                    text-transform: uppercase;
                    font-size: 12px;
                    text-decoration: none;
                    color: #103151;
                    font-weight: bold;
                }

                    .horizontal-list li a:hover {
                        color: #bf924a;
                    }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Đưa danh sách vào giữa */
        }

        .card {
            border: 1px solid #ddd;
            padding-top: 15px;
            border-radius: 9px;
            margin: 10px;
            width: 200px;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: -27px; background-color: #0F1A2C; width: 100%; height: 250px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
        <div class="VCT-title">
            <span style="font-size: 18px; margin-top: -100px"><b>———————————————— SẢN PHẨM NỔI BẬT ————————————————</b></span>
        </div>
        <div style="display: flex; width: 100%; justify-content: center; align-items: center; height: 200px; margin-top: -40px">
            <img style="width: 350px; height: 150px; margin: 0 10px;" src="image/Home/spnb2.jpg" />
            <img style="width: 350px; height: 150px; margin: 0 10px;" src="image/Home/spnb1.jpg" />
        </div>
    </div>
    <div class="VCT-aspx" style="text-align: center">

        <p>Phan Đức Lê Nam - 2121001091</p>
        <div class="VCT-title">

            <span><b>———————————————— MŨ BẢO HIỂM ————————————————</b></span>
        </div>
        <h13 style="font-size: 12px">Chúng tôi lấy chất lượng sản phẩm làm kim chỉ nam trong mọi hoạt động góp phần bảo vệ con người.</h13>
        <div style="margin-top:20px" class="card-container">

            <asp:Repeater ID="listLoaiSp" runat="server">
                <ItemTemplate>
                    <div>
                        <ul class="horizontal-list">
                            <li><a href='<%# Eval("URLLoaiSP") %>'><%# Eval("TenLoaiSP") %></a></li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <br />
        <div class="card-container">
            <asp:Repeater ID="rptListProd" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <a href='<%# Eval("DetailUrl") %>'>
                            <img src='<%# Eval("Hinh1") %>' alt='<%# Eval("TenSp") %>' />
                        </a>
                        <div class="card-body">
                            <h3 class="tenSp"><%# Eval("TenSp") %></h3>
                            <%--<p>Mô tả: <%# Eval("MoTa") %></p>--%>
                            <p><%# Convert.ToDecimal(Eval("GiaBan")).ToString("N0") %> ₫</p>
                            <%--hiển thị tiền dạng việt nam--%>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
