<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DangKi.aspx.cs" Inherits="NonBaoHiemRoyalHelmet.DangKi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtNewUsername" runat="server" />
    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" />
    <asp:Button ID="btnRegister" runat="server" Text="Đăng Ký" OnClick="btnRegister_Click" />


</asp:Content>
