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
                    font-size: 8px;
                    text-decoration: none;
                    color: #103151;
                    font-weight: bold;
                }

                    .horizontal-list li a:hover {
                        color: #bf924a;
                    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="VCT-aspx" style="text-align: center">
        <p>Phan Đức Lê Nam - 2121001091</p>
        <div class="VCT-title">
            <span><b>———————————————— MŨ BẢO HIỂM ————————————————</b></span>
        </div>
        <h13 style="font-size: 12px">Chúng tôi lấy chất lượng sản phẩm làm kim chỉ nam trong mọi hoạt động góp phần bảo vệ con người.</h13>
        <%--nếu không có margin: auto thì nó kh ra giữa được--%>
        <%--      <div style="width: 50%; margin: auto;">
            
        <asp:BulletedList ID="listTenSP" runat="server" CssClass="horizontal-list">
        </asp:BulletedList>
    </div>  --%>

        <div style="width: 50%; margin: auto;">
            <ul class="horizontal-list">
                <li><a href="#">Mũ bảo hiểm 3/4 đầu</a></li>
                <li><a href="#">Mũ bảo hiểm Fullface</a></li>
                <li><a href="#">Kính Mũ Bảo Hiểm</a></li>
                <li><a href="#">Mũ bảo hiểm 1/2 đầu</a></li>
                <li><a href="#">Mũ bảo hiểm trẻ em</a></li>
                <li><a href="#">Mũ bảo hiểm xe đạp</a></li>
            </ul>
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="194px" Width="400px"></asp:DetailsView>
    </div>
</asp:Content>
