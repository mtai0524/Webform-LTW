USE [QuanLyBanHangRoyalHelmet]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 11/17/2023 10:53:49 AM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/17/2023 10:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [nvarchar](5) NOT NULL,
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/17/2023 10:53:49 AM ******/
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
	[AnhDaiDien] [nvarchar](50) NOT NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 11/17/2023 10:53:49 AM ******/
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
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 11/17/2023 10:53:49 AM ******/
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
	[Email] [nvarchar](50) NOT NULL,
	[AnhDaiDien] [nvarchar](50) NOT NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuanTriVien] PRIMARY KEY CLUSTERED 
(
	[MaQTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/17/2023 10:53:49 AM ******/
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
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH02', N'Lê Văn Lương', N'Nam', CAST(N'1969-02-19' AS Date), N'41 Xóm Củi', N'02116584446', N'levanluongpropk1969@gmail.com', N' ', N'taikhoan1', N'matkhau1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH03', N'Bùi Hoàng Sơn', N'Nam', CAST(N'1968-10-15' AS Date), N'31 Nguyễn Xí', N'02116584447', N'BHShoctonducthang13@gmail.com', N' ', N'taikhoan2', N'matkhau2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH04', N'Nguyễn Đình Nguyên', N'Nam', CAST(N'1967-04-17' AS Date), N'1110 Phan Văn Trị', N'02116584448', N'Nguyenchuot2Gialai@gmail.com', N' ', N'taikhoan3', N'matkhau3')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH05', N'Nguyễn Hoàng Khánh Ngân', N'Nữ', CAST(N'1978-02-10' AS Date), N'91 Thống Nhất', N'02116584449', N'khanhngannek12@gmail.com', N' ', N'taikhoan4', N'matkhau4')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH06', N'Lâm Tâm Như', N'Nữ', CAST(N'1980-05-12' AS Date), N'71 Quang Trung', N'02116584441', N'beltnday@gmail.com', N' ', N'taikhoan5', N'matkhau5')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH07', N'Ngô Quốc Bảo', N'Nam', CAST(N'1990-06-02' AS Date), N'21 Chu Văn An', N'02116584442', N'wuocbao11@gmail.com', N' ', N'taikhoan6', N'matkhau6')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH08', N'Trương Nguyệt Nhi', N'Nữ', CAST(N'2002-07-13' AS Date), N'71 Huỳnh Thúc Kháng', N'02116584443', N'nhinhinhanh45@gmail.com', N' ', N'taikhoan7', N'matkhau7')
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
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'1P2', N'Mũ bảo hiểm 1/2 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'3P4', N'Mũ bảo hiểm 3/4 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'FF', N'Mũ bảo hiểm Fullface')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'KMBH', N'Kính Mũ Bảo Hiểm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LC', N'Mũ bảo hiểm Lật Cằm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'TE', N'Mũ bảo hiểm Trẻ Em')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'XD', N'Mũ bảo hiểm Xe Đạp')
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
