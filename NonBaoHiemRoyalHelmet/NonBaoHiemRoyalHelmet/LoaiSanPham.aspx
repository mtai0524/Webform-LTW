<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="LoaiSanPham.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="VCT">

        <asp:Repeater ID="rptLoaiSP" runat="server">
            <ItemTemplate>
                <span class="VCT-title"><b><%# Eval("TenLoaiSp") %></b></span>

            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>

