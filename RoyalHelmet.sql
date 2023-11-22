USE [QuanLyBanHangRoyalHelmet]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[MaDH] [nvarchar](5) NOT NULL,
	[MaSP] [nvarchar](6) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [nvarchar](5) NOT NULL,
	[MaKH] [nvarchar](4) NOT NULL,
	[MaQTV] [nvarchar](5) NOT NULL,
	[NgayDH] [datetime] NULL,
	[NgayGH] [date] NULL,
	[PTTT] [nvarchar](20) NULL,
	[TrangThai] [nvarchar](20) NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](4) NOT NULL,
	[TenKH] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDT] [nvarchar](15) NULL,
	[Email] [varchar](50) NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [nvarchar](4) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[MaQTV] [nvarchar](5) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuanTriVien] PRIMARY KEY CLUSTERED 
(
	[MaQTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/22/2023 10:26:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](6) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[Hinh1] [nvarchar](200) NULL,
	[Hinh2] [nvarchar](200) NULL,
	[MoTa] [nvarchar](50) NOT NULL,
	[TrongLuong] [nvarchar](50) NOT NULL,
	[KichCo] [nvarchar](100) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[GiaBan] [int] NOT NULL,
	[MaLoaiSP] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'123', N'1P202', 1, 1145000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH02', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH03', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH03', N'3P405', 1, 630000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH03', N'FF01', 1, 1210000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH04', N'3P402', 1, 730000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH05', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH05', N'3P405', 1, 630000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH05', N'FF03', 1, 975000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH05', N'FF04', 1, 760000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH06', N'1P201', 1, 1140000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH06', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH06', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH07', N'1P203', 1, 1845000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH07', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH07', N'3P402', 1, 730000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH07', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH07', N'3P405', 1, 630000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH08', N'1P203', 1, 1845000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH09', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH10', N'3P401', 1, 780000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH10', N'FF04', 1, 760000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH11', N'3P401', 1, 780000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH11', N'3P404', 1, 640000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH11', N'3P405', 1, 630000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH12', N'1P203', 1, 1845000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH12', N'FF02', 1, 1130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH13', N'1P202', 1, 1145000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH13', N'3P402', 1, 730000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH13', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH14', N'1P203', 1, 1845000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH14', N'3P402', 1, 730000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH14', N'FF02', 1, 1130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH15', N'3P401', 1, 780000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH15', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH16', N'3P402', 1, 730000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH16', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH16', N'3P405', 1, 630000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH17', N'1P202', 1, 1145000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH17', N'FF02', 1, 1130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH17', N'FF04', 1, 760000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH18', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH19', N'3P403', 1, 700000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH20', N'1P204', 1, 1287000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH21', N'1P205', 1, 1165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH21', N'FF02', 1, 1130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH22', N'FF01', 1, 1210000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH23', N'FF03', 1, 975000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (N'DH23', N'FF04', 1, 760000)
GO
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'123', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 1145000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH02', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 1165000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH03', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 2540000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH04', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 730000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH05', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 3065000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH06', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 3005000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH07', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 5070000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH08', N'KH01', N'QTV01', CAST(N'2023-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 1845000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH09', N'KH01', N'QTV01', CAST(N'2023-11-20T17:15:47.927' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 1165000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH10', N'KH01', N'QTV01', CAST(N'2023-11-20T20:08:14.437' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 1540000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH11', N'KH01', N'QTV01', CAST(N'2023-11-20T20:11:30.363' AS DateTime), CAST(N'2023-11-27' AS Date), N'online', N'Đang Xử Lý', 2050000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH12', N'KH05', N'QTV01', CAST(N'2023-11-22T09:01:08.073' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 2975000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH13', N'KH05', N'QTV01', CAST(N'2023-11-22T09:02:56.350' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 2575000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH14', N'KH04', N'QTV01', CAST(N'2023-11-22T09:10:17.823' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 3705000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH15', N'KH03', N'QTV01', CAST(N'2023-11-22T09:34:41.257' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 1480000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH16', N'KH03', N'QTV01', CAST(N'2023-11-22T09:41:43.593' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 2060000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH17', N'KH03', N'QTV01', CAST(N'2023-11-22T09:42:45.833' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 3035000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH18', N'KH03', N'QTV01', CAST(N'2023-11-22T09:44:57.337' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 1165000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH19', N'KH03', N'QTV01', CAST(N'2023-11-22T09:45:30.320' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 700000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH20', N'KH03', N'QTV01', CAST(N'2023-11-22T09:45:57.760' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 1287000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH21', N'KH06', N'QTV01', CAST(N'2023-11-22T09:53:18.777' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 2295000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH22', N'KH06', N'QTV01', CAST(N'2023-11-22T09:53:55.710' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 1210000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES (N'DH23', N'KH06', N'QTV01', CAST(N'2023-11-22T09:57:44.897' AS DateTime), CAST(N'2023-11-29' AS Date), N'online', N'Đang Xử Lý', 1735000)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH01', N'Lê Văn Lương', N'Nam', CAST(N'1969-02-19' AS Date), N'41 Xóm Củi', N'02116584446', N'levanluongpropk1969@gmail.com', NULL, N'taikhoan20', N'matkhau20')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH02', N'Lê Văn Lương', N'Nam', CAST(N'1969-02-19' AS Date), N'41 Xóm Củi', N'02116584446', N'levanluongpropk1969@gmail.com', N'/image/AnhDaiDien/u1.png', N'taikhoan1', N'matkhau1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH03', N'Bùi Hoàng Sơn', N'Nam', CAST(N'1968-10-15' AS Date), N'31 Nguyễn Xí', N'02116584447', N'minhnguyen20020524@gmail.com', N'/image/AnhDaiDien/u1.png', N'taikhoan2', N'matkhau2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH04', N'Nguyễn Đình Nguyên', N'Nam', CAST(N'1967-04-17' AS Date), N'1110 Phan Văn Trị', N'02116584448', N'Nguyenchuot2Gialai@gmail.com', N'/image/AnhDaiDien/a4.jpg', N'taikhoan3', N'matkhau3')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH05', N'Nguyễn Hoàng Khánh Ngân', N'Nữ', CAST(N'1978-02-10' AS Date), N'91 Thống Nhất', N'02116584449', N'khanhngannek12@gmail.com', N'/image/AnhDaiDien/cat (4).png', N'taikhoan4', N'matkhau4')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH06', N'Lâm Tâm Như Cute Đó Nha', N'Nữ', CAST(N'1980-05-12' AS Date), N'71 Quang Trung', N'02116584441', N'itachiyeuminhem01@gmail.com', N'/image/AnhDaiDien/cat5.jpg', N'taikhoan5', N'matkhau5')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH07', N'Ngô Quốc Bảo', N'Nam', CAST(N'1990-06-02' AS Date), N'21 Chu Văn An', N'02116584442', N'wuocbao11@gmail.com', N' ', N'taikhoan6', N'matkhau6')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH08', N'Trương Nguyệt Nhi', N'Nữ', CAST(N'2002-07-13' AS Date), N'71 Huỳnh Thúc Kháng', N'02116584443', N'nhinhinhanh45@gmail.com', N'/image/AnhDaiDien/cat7.jpg', N'taikhoan7', N'matkhau7')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH09', N'Phạm Minh Tâm', N'Nam', CAST(N'1993-10-26' AS Date), N'93 Quốc lộ 13', N'02116584444', N'tamthancasau@gmail.com', N' ', N'taikhoan8', N'matkhau8')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH10', N'Đoàn Công Khải', N'Nam', CAST(N'1965-08-17' AS Date), N'455 Xô Viết Nghệ Tĩnh', N'02116584450', N'noledongtien@gmail.com', N' ', N'taikhoan9', N'matkhau9')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH11', N'Trương An Nhiên', N'Nữ', CAST(N'2003-06-17' AS Date), N'445 Linh Đông', N'02116524452', N'NhienKimChi76@gmail.com', N' ', N'taikhoan10', N'matkhau10')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH12', N'Trần Cao Huy', N'Nam', CAST(N'1997-03-20' AS Date), N'416 Cộng Hòa', N'02116584440', N'HuyNhong18c@gmail.com', N' ', N'taikhoan11', N'matkhau11')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH13', N'Đinh Cao Thắng', N'Nam', CAST(N'1999-05-02' AS Date), N'43 Bùi Thị Xuân', N'02116673450', N'dripinurarea@gmail.com', N' ', N'taikhoan12', N'matkhau12')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH14', N'Lê Thị Thúy Vi', N'Nữ', CAST(N'1998-04-23' AS Date), N'23 Phạm Văn Đồng', N'02116586789', N'mariaThuyVy@gmail.com', N' ', N'taikhoan13', N'matkhau13')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH15', N'Trịnh Thu Ngân', N'Nữ', CAST(N'1975-04-30' AS Date), N'21 Hoàng Văn Thụ', N'02116585424', N'NganTrinhToiChoi@gmail.com', N' ', N'taikhoan14', N'matkhau14')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH16', N'Trương Bách', N'Nam', CAST(N'1994-05-03' AS Date), N'45 Chu Văn An', N'02116585643', N'QuanYLaSo1@gmail.com', N' ', N'taikhoan15', N'matkhau15')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH17', N'Hoàng Quang Vương', N'Nam', CAST(N'2000-07-26' AS Date), N'29 Lã Xuân Oai', N'02116588567', N'DoctorVuong81@gmail.com', N' ', N'taikhoan16', N'matkhau16')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH18', N'Trần Tấn Phát', N'Nam', CAST(N'1998-04-09' AS Date), N'34 Nguyễn Xuyến', N'02116580987', N'PhatLA@gmail.com', N' ', N'taikhoan17', N'matkhau17')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH19', N'Nguyễn Xuân Tính', N'Nam', CAST(N'1995-06-28' AS Date), N'456 Nguyễn Văn Tăng', N'02116582543', N'CoGaiPhuYen@gmail.com', N' ', N'taikhoan18', N'matkhau18')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH20', N'Nguyễn Thị Thanh Hằng', N'Nữ', CAST(N'2001-03-15' AS Date), N'324 Quang Trung', N'02116584873', N'HangThanhGiaLai@gmail.com', N' ', N'taikhoan19', N'matkhau19')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'demo', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'demo user', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH23', NULL, N'Nữ', CAST(N'2023-11-04' AS Date), NULL, N'123', N'123', N'', N'213', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH24', N'tai', N'Nam', CAST(N'2023-11-03' AS Date), NULL, N'123', N'tai@yahoo.com', N'', N'tai', N'tai')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH25', N'111', N'Nữ', CAST(N'2023-11-25' AS Date), NULL, N'111', N'111', N'/image/AnhDaiDien/mybear.jpg', N'111', N'111')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH26', N'2222', N'Nam', CAST(N'2023-11-04' AS Date), N'2222', N'2222', N'222@gmail.com', N'/image/AnhDaiDien/a2.jpg', N'222', N'222')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'1P2', N'Mũ bảo hiểm 1/2 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'3P4', N'Mũ bảo hiểm 3/4 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'FF', N'Mũ bảo hiểm Fullface')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'KMBH', N'Kính Mũ Bảo Hiểm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LC', N'Mũ bảo hiểm Lật Cằm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'TE', N'Mũ bảo hiểm Trẻ Em')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'XD', N'Mũ bảo hiểm Xe Đạp')
GO
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV01', N'Phan Thành Duy', N'Nam', N'5 Dương Quảng hàm - GV - TPHCM', N'08858454182', N'PhanThanhDuy123@gmail.com', N'/image/AnhDaiDien/u1.png', N'admin1', N'adpass1')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV02', N'Lâm Đại Ngọc', N'Nam', N'2/1A Quang Trung - p.10 - GV - TP.HCM', N'08354362205', N'LDNpropk@gmail.com', N' ', N'admin2', N'adpass2')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV03', N'Trần Châu Khoa', N'Nam', N'10 QL 1A - p.11 - q.12 - TP.HCM', N'09181833333', N'Khoaquan12@gmail.com', N'/image/AnhDaiDien/250075007.png', N'admin3', N'adpass3')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV04', N'Lê Chí Kiên', N'Nam', N'564/1/3F Nguyễn Xí - Bình Thạnh - TP.HCM', N'09131620000', N'ChiKienBT@gmail.com', N'/image/AnhDaiDien/man.png', N'admin4', N'adpass4')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV05', N'Phan Thanh Tâm', N'Nữ', N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM', N'09186223333', N'Tamoilatam@gmail.com', N' ', N'admin5', N'adpass5')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV06', N'Mai Thị Lựu', N'Nữ', N'256/96/4 Phan Đăng Lưu - Bình Thạnh - HCM', N'09181831444', N'Luudanne@gmail.com', N'/image/AnhDaiDien/rabbit.png', N'admin6', N'adpass6')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV07', N'Đào Thị Hồng', N'Nữ', N'764/94 Phạm Văn Chiêu - p.13 - GV - HCM', N'09754322222', N'DaoThiHong@gmail.com', N' ', N'admin7', N'adpass7')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV08', N'Phan Thành Nhân', N'Nam', N'152 Nguyễn Trọng Tuyển - Tân Bình - HCM', N'09135332332', N'NhanThanh113@gmail.com', N' ', N'admin8', N'adpass8')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV09', N'Phan Ánh Dương', N'Nữ', N'65 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM', N'09812127678', N'AnhDuong65@gmail.com', N' ', N'admin9', N'adpass9')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV10', N'Phan Ánh Nguyệt', N'Nữ', N'32/65/9 Trần Cao Vân - Phú Nhuận - HCM', N'09812342356', N'TrangNguyet12@gmail.com', N' ', N'admin10', N'adpass10')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV11', N'Nguyễn Kim Ngân', N'Nữ', N'32/60/8 Trần Cao Anh - Phú Nhuận - HCM', N'09812344567', N'KimNganNg@gmail.com', N' ', N'admin11', N'adpass11')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV12', N'Nguyễn Kiều My', N'Nữ', N'32/65/9 Võ Cao Vân - GV - HCM', N'09812344789', N'KieuMyVCV@gmail.com', N' ', N'admin12', N'adpass12')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV13', N'Trần Đăng Khoa', N'Nam', N'7 Cao Bá Quát - Phú Nhuận - HCM', N'09812342398', N'DKTran@gamil.com', N' ', N'admin13', N'adpass13')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV14', N'Nguyễn Hùng Cường', N'Nam', N'87 Võ Tùng - Tân Bình - HCM', N'09812345543', N'CuongHCM@gmail.com', N' ', N'admin14', N'adpass14')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV15', N'Lê Quốc Chí', N'Nam', N'12 Hoàng Hoa Thám - Phú Nhuận - HCM', N'09812342211', N'QuocChi12@gmail.com', N' ', N'admin15', N'adpass15')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV16', N'Nguyễn Minh Thư', N'Nữ', N'12 Hùng Vương - q.2 - HCM', N'09812349999', N'MinhThunek@gmail.com', N' ', N'admin16', N'adpass16')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV17', N'Nguyễn Hoàng Linh Đan', N'Nữ', N'112 Chu Văn An - Phú Nhuận - HCM', N'09812342244', N'DanDancute@gmail.com', N' ', N'admin17', N'adpass17')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV18', N'Nguyễn Văn Chiến', N'Nam', N'17 Linh Trung - q.4 - HCM', N'09812343478', N'Chiencacom@gmail.com', N' ', N'admin18', N'adpass18')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV19', N'La Văn Cầu', N'Nam', N'16 Phan Đình Phùng - Phú Nhuận - HCM', N'09812344532', N'CauLa@gmail.com', N' ', N'admin19', N'adpass19')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV20', N'Trương An Nhiên', N'Nữ', N'429 Trần Phú - q.12 - HCM', N'09812346554', N'NhienHocGioi@gmail.com', N' ', N'admin20', N'adpass20')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV21', NULL, NULL, NULL, NULL, NULL, NULL, N'213213', N'3123')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV22', NULL, NULL, NULL, NULL, NULL, NULL, N'demo', N'123')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'1P201', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M152K', N' /image/NonBaoHiem/M152K.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 1140000, N'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'1P202', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M153K', N'/image/NonBaoHiem/M153K.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'752g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 38, 1145000, N'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'1P203', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M156K', N'/image/NonBaoHiem/M156K.jpg', N'/image/a1.jpg', N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 56, 1845000, N'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'1P204', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M379', N'/image/NonBaoHiem/M379.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'540g ± 50g', N'size L: 55 - 58cm ', 11, 1287000, N'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'1P205', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M158', N'/image/NonBaoHiem/M158.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'590g ± 50g', N'Freesize (Vòng đầu 54-58 cm)', 96, 1165000, N'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'3P401', N'MŨ BẢO HIỂM 3/4 ROYAL M20D', N'/image/NonBaoHiem/M20D.jpg', N'/image/NonBaoHiemHinh2/M20D_white.jpg', N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 20, 780000, N'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'3P402', N'MŨ BẢO HIỂM 3/4 ROYAL M139 KÍNH ÂM DESIGN', N'/image/NonBaoHiem/M139_Tron_KinhAm_Design.jpg', NULL, N'Thiết kế kính âm đột phá, nhiều mẫu tem độc đáo', N'950g', N' size M:54-55 cm, size L:55-57 cm, size XL:57-59 cm', 50, 730000, N'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'3P403', N'MŨ BẢO HIỂM 3/4 ROYAL M139-TRƠN-KÍNH ÂM', N'/image/NonBaoHiem/M139_Tron_KinhAm.jpg', NULL, N'Thiết kế kính âm đột phá, màu sắc đa dạng', N'950g', N'size M: 54-55 cm, size L: 55-57 cm, size XL: 57-59 cm', 53, 700000, N'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'3P404', N'MŨ BẢO HIỂM 3/4 ROYAL M268 TRƠN - 2 KÍNH', N'/image/NonBaoHiem/M268.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'876g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 640000, N'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'3P405', N'MŨ BẢO HIỂM 3/4 ROYAL M20C DESIGN', N'/image/NonBaoHiem/M20C_Design.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 67, 630000, N'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'add2', N'add2', N'/image/NonBaoHiem/a2.jpg', N'/image/NonBaoHiem/a3.jpg', N'add2', N'add2', N'add2', 123, 123, N'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'FF01', N'MŨ BẢO HIỂM FULLFACE ROYAL M141K', N'/image/NonBaoHiem/M141K.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 45, 1210000, N'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'FF02', N'MŨ BẢO HIỂM FULLFACE ROYAL M141', N'/image/NonBaoHiem/M141.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 70, 1130000, N'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'FF03', N'MŨ BẢO HIỂM FULLFACE ROYAL H01', N'/image/NonBaoHiem/H01.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 30, 975000, N'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'FF04', N'MŨ BẢO HIỂM FULLFACE ROYAL M138B', N'/image/NonBaoHiem/M138B.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size M, size L: 56 - 57cm, size XL: 58 - 59cm', 20, 760000, N'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'FF05', N'MŨ BẢO HIỂM FULLFACE 2 KÍNH ROYAL M266 DESIGN', N'image/NonBaoHiem/M266_DESIGN.jpg', NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1111g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 50, 760000, N'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'kính3', N'kính3', N'/image/NonBaoHiem/M20D_white.jpg', N'dasdas', N'kính3', N'TrongLuong', N'KichCo', 1, 10, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'KMBH02', N'KÍNH MŨ BẢO HIỂM BO', NULL, NULL, N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 55, 130000, N'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'KMBH03', N'KÍNH MŨ BẢO HIỂM THẲNG', NULL, NULL, N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 58, 120000, N'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'KMBH04', N'KÍNH MŨ BẢO HIỂM DÂY BẠC', NULL, NULL, N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 78, 140000, N'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'KMBH05', N'KÍNH MŨ BẢO HIỂM DÂY', NULL, NULL, N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 45, 125000, N'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'LC01', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08 DESIGN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 1050000, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'LC02', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 990000, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'LC03', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179 DESIGN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 40, 745000, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'LC04', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 79, 710000, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'LC05', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M2703', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 26, 680000, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'met', N'met', N'/image/6ov.gif', N'/image/FB_IMG_1694432164883.jpg', N'met', N'met ha', N'met', 13231, 2123213, N'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'TE01', N'MŨ BẢO HIỂM TRẺ EM M139 KID - KÍNH ÂM', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 337000, N'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'TE02', N'MŨ BẢO HIỂM TRẺ EM ROYAL M20KS', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 330000, N'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'TE03', N'MŨ BẢO HIỂM TRẺ EM ROYAL M270 DESIGN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 58, 496000, N'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'TE04', N'MŨ BẢO HIỂM TRẺ EM M260K', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 440000, N'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'TE05', N'MŨ BẢO HIỂM TRẺ EM M234K', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 45, 550000, N'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'XD01', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-15 DESIGN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh, Xốp EPS', N'460 ± 50g', N'Freesize (Vòng đầu 58-60 cm)', 78, 1337000, N'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'XD02', N'MŨ BẢO HIỂM XE ĐẠP MD-15 TRƠN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'440 ± 50g', 55, 1130000, N'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'XD03', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 TRƠN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'480 ± 50g', 58, 1496000, N'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'XD04', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 DESIGN', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'465 ± 50g', 38, 1040000, N'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES (N'XD05', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-17', NULL, NULL, N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'472 ± 50g', 45, 1250000, N'XD')
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (NULL) FOR [Hinh1]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (NULL) FOR [Hinh2]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [PK_CTDH_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [PK_CTDH_DonHang]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [PK_CTDH_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [PK_CTDH_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_QuanTriVien] FOREIGN KEY([MaQTV])
REFERENCES [dbo].[QuanTriVien] ([MaQTV])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_QuanTriVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
