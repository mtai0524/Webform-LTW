USE [QuanLyBanHangRoyalHelmet]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[MaDH] [nchar](5) NOT NULL,
	[MaSP] [nchar](6) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [nchar](5) NOT NULL,
	[MaKH] [nvarchar](4) NOT NULL,
	[MaQTV] [nvarchar](5) NOT NULL,
	[NgayDH] [date] NOT NULL,
	[NgayGH] [date] NOT NULL,
	[PTTT] [nvarchar](20) NOT NULL,
	[TrangThai] [nvarchar](20) NOT NULL,
	[TongTien] [int] NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](4) NOT NULL,
	[TenKH] [nvarchar](30) NOT NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[AnhDaiDien] [varchar](50) NOT NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [nchar](4) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[MaQTV] [nvarchar](5) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[GioiTinh] [nvarchar](4) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[AnhDaiDien] [varchar](50) NOT NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuanTriVien] PRIMARY KEY CLUSTERED 
(
	[MaQTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/10/2023 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](6) NOT NULL,
	[TenSP] [nvarchar](200) NOT NULL,
	[MoTa] [nvarchar](200) NOT NULL,
	[TrongLuong] [nvarchar](200) NOT NULL,
	[KichCo] [nvarchar](200) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[GiaBan] [int] NOT NULL,
	[MaLoaiSP] [nchar](4) NOT NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'1P2 ', N'Mũ bảo hiểm 1/2 đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'3P4 ', N'Mũ bảo hiểm 3/4 đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'FF  ', N'Mũ bảo hiểm Fullface')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'KMBH', N'Kính Mũ Bảo Hiểm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LC  ', N'Mũ bảo hiểm 1/2 đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'TE  ', N'Mũ bảo hiểm trẻ em')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'XD  ', N'Mũ bảo hiểm xe đạp')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'1P201 ', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M152K', N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 1140000, N'1P2 ', N'image/NonBaoHiem/M152K.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'1P202 ', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M153K', N'Vỏ bằng nhựa ABS nguyên sinh', N'752g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 38, 1145000, N'1P2 ', N'image/NonBaoHiem/M153K.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'1P203 ', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M156K', N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 56, 1845000, N'1P2 ', N'image/NonBaoHiem/M156K.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'1P204 ', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M379', N'Vỏ bằng nhựa ABS nguyên sinh', N'540g ± 50g', N'size L: 55 - 58cm ', 11, 1287000, N'1P2 ', N'image/NonBaoHiem/M379.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'1P205 ', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M158', N'Vỏ bằng nhựa ABS nguyên sinh', N'590g ± 50g', N'Freesize (Vòng đầu 54-58 cm)', 96, 1165000, N'1P2 ', N'image/NonBaoHiem/M158.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'3P401 ', N'MŨ BẢO HIỂM 3/4 ROYAL M20D', N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 20, 780000, N'3P4 ', N'image/NonBaoHiem/M20D.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'3P402 ', N'MŨ BẢO HIỂM 3/4 ROYAL M139 KÍNH ÂM DESIGN', N'Thiết kế kính âm đột phá, nhiều mẫu tem độc đáo', N'950g', N' size M:54-55 cm, size L:55-57 cm, size XL:57-59 cm', 50, 730000, N'3P4 ', N'image/NonBaoHiem/M139_Tron_KinhAm_Design.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'3P403 ', N'MŨ BẢO HIỂM 3/4 ROYAL M139-TRƠN-KÍNH ÂM', N'Thiết kế kính âm đột phá, màu sắc đa dạng', N'950g', N'size M: 54-55 cm, size L: 55-57 cm, size XL: 57-59 cm', 53, 700000, N'3P4 ', N'image/NonBaoHiem/M139_Tron_KinhAm.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'3P404 ', N'MŨ BẢO HIỂM 3/4 ROYAL M268 TRƠN - 2 KÍNH', N'Vỏ bằng nhựa ABS nguyên sinh', N'876g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 640000, N'3P4 ', N'image/NonBaoHiem/M268.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'3P405 ', N'MŨ BẢO HIỂM 3/4 ROYAL M20C DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 67, 630000, N'3P4 ', N'image/NonBaoHiem/M20C_Design.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'FF01  ', N'MŨ BẢO HIỂM FULLFACE ROYAL M141K', N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 45, 1210000, N'FF  ', N'image/NonBaoHiem/M141K.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'FF02  ', N'MŨ BẢO HIỂM FULLFACE ROYAL M141', N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 70, 1130000, N'FF  ', N'image/NonBaoHiem/M141.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'FF03  ', N'MŨ BẢO HIỂM FULLFACE ROYAL H01', N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 30, 975000, N'FF  ', N'image/NonBaoHiem/H01.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'FF04  ', N'MŨ BẢO HIỂM FULLFACE ROYAL M138B', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size M, size L: 56 - 57cm, size XL: 58 - 59cm', 20, 760000, N'FF  ', N'image/NonBaoHiem/M138B.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'FF05  ', N'MŨ BẢO HIỂM FULLFACE 2 KÍNH ROYAL M266 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'1111g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 50, 760000, N'FF  ', N'image/NonBaoHiem/M266_DESIGN.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'KMBH02', N'KÍNH MŨ BẢO HIỂM BO', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 55, 130000, N'KMBH', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'KMBH03', N'KÍNH MŨ BẢO HIỂM THẲNG', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 58, 120000, N'KMBH', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'KMBH04', N'KÍNH MŨ BẢO HIỂM DÂY BẠC', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 78, 140000, N'KMBH', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'KMBH05', N'KÍNH MŨ BẢO HIỂM DÂY', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 45, 125000, N'KMBH', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'LC01  ', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 1050000, N'LC  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'LC02  ', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 990000, N'LC  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'LC03  ', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 40, 745000, N'LC  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'LC04  ', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 79, 710000, N'LC  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'LC05  ', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M2703', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 26, 680000, N'LC  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'TE01  ', N'MŨ BẢO HIỂM TRẺ EM M139 KID - KÍNH ÂM', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 337000, N'TE  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'TE02  ', N'MŨ BẢO HIỂM TRẺ EM ROYAL M20KS', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 330000, N'TE  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'TE03  ', N'MŨ BẢO HIỂM TRẺ EM ROYAL M270 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 58, 496000, N'TE  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'TE04  ', N'MŨ BẢO HIỂM TRẺ EM M260K', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 440000, N'TE  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'TE05  ', N'MŨ BẢO HIỂM TRẺ EM M234K', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 45, 550000, N'TE  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'XD01  ', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-15 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh, Xốp EPS', N'460 ± 50g', N'Freesize (Vòng đầu 58-60 cm)', 78, 1337000, N'XD  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'XD02  ', N'MŨ BẢO HIỂM XE ĐẠP MD-15 TRƠN', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'440 ± 50g', 55, 1130000, N'XD  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'XD03  ', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 TRƠN', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'480 ± 50g', 58, 1496000, N'XD  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'XD04  ', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 DESIGN', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'465 ± 50g', 38, 1040000, N'XD  ', NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP], [HinhAnh]) VALUES (N'XD05  ', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-17', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'472 ± 50g', 45, 1250000, N'XD  ', NULL)
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
