/*1. Tạo CSDL */
create database QuanLyBanHangRoyalHelmet
go
/*2.Chọn CSDL*/
use QuanLyBanHangRoyalHelmet
go
/*3.Tạo bảng Khách Hàng */
CREATE TABLE KhachHang (
	MaKH nvarchar(4) not null,
	TenKH nvarchar(30) not null,
	GioiTinh nvarchar(4),
	NgaySinh date,
	DiaChi nvarchar(50) not null,
	SoDT nvarchar(15) not null,
	Email varchar(50) not null,
	AnhDaiDien nvarchar(50) not null,
	TaiKhoan nvarchar(50) not null,
	MatKhau nvarchar(50) not null,
	CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH)
)
go
/*4.Tạo bảng Quản Trị Viên*/
CREATE TABLE QuanTriVien(
	MaQTV nvarchar(5) not null,
	HoTen nvarchar(30) not null,
	GioiTinh nvarchar(4)not null,
	NgaySinh date not null,
	DiaChi nvarchar(50) not null,
	DienThoai nvarchar(15) not null,
	Email nvarchar(50) not null,
	AnhDaiDien nvarchar(50) not null,
	TaiKhoan nvarchar(50) not null,
	MatKhau nvarchar(50) not null,	
	CONSTRAINT PK_QuanTriVien PRIMARY KEY (MaQTV)
)
go
/*5.Tạo bảng Loại Hàng*/
CREATE TABLE LoaiSP(
	MaLoaiSP nvarchar (4) not null,
    TenLoaiSP nvarchar (50) not null,
	CONSTRAINT PK_LoaiSP PRIMARY KEY (MaLoaiSP)
)
go
/*6. Tạo bảng Sản Phẩm*/
CREATE TABLE SanPham(
	MaSP nvarchar (6) not null,
    TenSP nvarchar(50) not null,
	Hinh1 nvarchar(200) not null,
	Hinh2 nvarchar(200) not null,
	MoTa nvarchar(50) not null,
	TrongLuong nvarchar(50) not null,
	KichCo nvarchar(50) not null,
	SoLuongTon int not null,
	GiaBan int not null,
	MaLoaiSP nvarchar(4) not null,
	CONSTRAINT PK_SanPham PRIMARY KEY (MaSP),
	CONSTRAINT FK_SanPham_LoaiSP FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSP(MaLoaiSP),
)
go
/*7. Tạo bảng Đơn Hàng*/
CREATE TABLE DonHang 
(
    MaDH nvarchar (5) not null,
	MaKH nvarchar(4) not null,
	MaQTV nvarchar(5) not null,
	NgayDH date not null,
	NgayGH date not null,
	PTTT nvarchar(20) not null,
	TrangThai nvarchar(20) not null,
	TongTien int not null,
	CONSTRAINT PK_DonHang PRIMARY KEY(MaDH),
	CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	CONSTRAINT FK_DonHang_QuanTriVien FOREIGN KEY (MaQTV) REFERENCES QuanTriVien(MaQTV),
)
go
/*8. Tạo bảng Chi Tiết Đơn Hàng*/
CREATE TABLE CTDH
(
    MaDH nvarchar(5) NOT NULL,
	MaSP nvarchar(6) NOT NULL,
	SoLuong int NOT NULL,
	DonGia int NOT NULL,
	CONSTRAINT PK_CTHD PRIMARY KEY(MaDH, MaSP),
	CONSTRAINT PK_CTDH_DonHang FOREIGN KEY (MaDH) REFERENCES DonHang (MaDH),
	CONSTRAINT PK_CTDH_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP),
)
go
/*12.Thêm các khóa ngoại*/
					/*SanPham - LoaiSP
MaLoaiSP trong SanPham tham chiếu tới MaLoaiSP trong LoaiSP*/
ALTER TABLE SanPham ADD 
	CONSTRAINT FK_SanPham_MaLoaiSP FOREIGN KEY(MaLoaiSP) REFERENCES LoaiSP(MaLoaiSP)

					/*DonHang - KhachHang
MaKH trong DonHang tham chiếu tới MaKH trong KhachHang
					  DonHang - QuanTriVien
MaQTV trong DonHang tham chieu toi MaQTV trong NhanVien*/
ALTER TABLE DonHang ADD
	CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	CONSTRAINT FK_DonHang_QuanTriVien FOREIGN KEY (MaQTV) REFERENCES QuanTriVien(MaQTV)
					
					/*CTDH - DonHang
MaHD trong CTDH tham chiếu tới MaHD trong HoaDon
					  CTDH - SanPham
MaSP trong CTDH tham chiếu tới CTHD trong SanPham*/
ALTER TABLE CTDH ADD
	CONSTRAINT FK_CTHD_MaHD FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD),
    CONSTRAINT FK_CTHD_MaSP FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP)
/*13.Thêm dữ liệu*/
--Dữ liệu bảng KhachHang
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH01', N'Khách hàng vãng lai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH02', N'Lê Văn Lương', N'Nam', N'1969-02-19', N'41 Xóm Củi', N'02116584446', N'levanluongpropk1969@gmail.com', N' ', N'taikhoan1', N'matkhau1')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH03', N'Bùi Hoàng Sơn', N'Nam', N'1968-10-15', N'31 Nguyễn Xí', N'02116584447', N'BHShoctonducthang13@gmail.com', N' ', N'taikhoan2', N'matkhau2')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH04', N'Nguyễn Đình Nguyên', N'Nam', N'1967-04-17', N'1110 Phan Văn Trị', N'02116584448', N'Nguyenchuot2Gialai@gmail.com', N' ', N'taikhoan3', N'matkhau3')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH05', N'Nguyễn Hoàng Khánh Ngân', N'Nữ', N'1978-02-10', N'91 Thống Nhất', N'02116584449', N'khanhngannek12@gmail.com', N' ', N'taikhoan4', N'matkhau4')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH06', N'Lâm Tâm Như', N'Nữ', N'1980-05-12', N'71 Quang Trung', N'02116584441', N'beltnday@gmail.com', N' ', N'taikhoan5', N'matkhau5')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH07', N'Ngô Quốc Bảo', N'Nam', N'1990-06-02', N'21 Chu Văn An', N'02116584442', N'wuocbao11@gmail.com', N' ', N'taikhoan6', N'matkhau6')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH08', N'Trương Nguyệt Nhi', N'Nữ', N'2002-07-13', N'71 Huỳnh Thúc Kháng', N'02116584443', N'nhinhinhanh45@gmail.com', N' ', N'taikhoan7', N'matkhau7')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH09', N'Phạm Minh Tâm', N'Nam', N'1993-10-26', N'93 Quốc lộ 13', N'02116584444', N'tamthancasau@gmail.com', N' ', N'taikhoan8', N'matkhau8')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH10', N'Đoàn Công Khải', N'Nam', N'1965-08-17', N'455 Xô Viết Nghệ Tĩnh', N'02116584450', N'noledongtien@gmail.com', N' ', N'taikhoan9', N'matkhau9')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH11', N'Trương An Nhiên', N'Nữ', N'2003-06-17', N'445 Linh Đông', N'02116524452', N'NhienKimChi76@gmail.com', N' ', N'taikhoan10', N'matkhau10')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH12', N'Trần Cao Huy', N'Nam', N'1997-03-20', N'416 Cộng Hòa', N'02116584440', N'HuyNhong18c@gmail.com', N' ', N'taikhoan11', N'matkhau11')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH13', N'Đinh Cao Thắng', N'Nam', N'1999-05-02', N'43 Bùi Thị Xuân', N'02116673450', N'dripinurarea@gmail.com', N' ', N'taikhoan12', N'matkhau12')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH14', N'Lê Thị Thúy Vi', N'Nữ', N'1998-04-23', N'23 Phạm Văn Đồng', N'02116586789', N'mariaThuyVy@gmail.com', N' ', N'taikhoan13', N'matkhau13')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH15', N'Trịnh Thu Ngân', N'Nữ', N'1975- 04-30', N'21 Hoàng Văn Thụ', N'02116585424', N'NganTrinhToiChoi@gmail.com', N' ', N'taikhoan14', N'matkhau14')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH16', N'Trương Bách', N'Nam', N'1994-05-03', N'45 Chu Văn An', N'02116585643', N'QuanYLaSo1@gmail.com', N' ', N'taikhoan15', N'matkhau15')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH17', N'Hoàng Quang Vương', N'Nam', N'2000-07-26', N'29 Lã Xuân Oai', N'02116588567', N'DoctorVuong81@gmail.com', N' ', N'taikhoan16', N'matkhau16')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH18', N'Trần Tấn Phát', N'Nam', N'1998-04-09', N'34 Nguyễn Xuyến', N'02116580987', N'PhatLA@gmail.com', N' ', N'taikhoan17', N'matkhau17')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH19', N'Nguyễn Xuân Tính', N'Nam', N'1995-06-28', N'456 Nguyễn Văn Tăng', N'02116582543', N'CoGaiPhuYen@gmail.com', N' ', N'taikhoan18', N'matkhau18')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [NgaySinh], [DiaChi], [SoDT], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'KH20', N'Nguyễn Thị Thanh Hằng', N'Nữ', N'2001-03-15', N'324 Quang Trung', N'02116584873', N'HangThanhGiaLai@gmail.com', N' ', N'taikhoan19', N'matkhau19')
--Dữ liệu bảng QuanTriVien
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV01', N'Phan Thành Duy', N'Nam', N'5 Dương Quảng hàm - GV - TPHCM', N'08858454182', N'PhanThanhDuy123@gmail.com', N' ', N'admin1', N'adpass1')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV02', N'Lâm Đại Ngọc', N'Nam', N'2/1A Quang Trung - p.10 - GV - TP.HCM', N'08354362205', N'LDNpropk@gmail.com', N' ', N'admin2', N'adpass2')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV03', N'Trần Châu Khoa', N'Nam', N'10 QL 1A - p.11 - q.12 - TP.HCM', N'09181833333', N'Khoaquan12@gmail.com', N' ', N'admin3', N'adpass3')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV04', N'Lê Chí Kiên', N'Nam', N'564/1/3F Nguyễn Xí - Bình Thạnh - TP.HCM', N'09131620000', N'ChiKienBT@gmail.com', N' ', N'admin4', N'adpass4')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV05', N'Phan Thanh Tâm', N'Nữ', N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM', N'09186223333', N'Tamoilatam@gmail.com', N' ', N'admin5', N'adpass5')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV06', N'Mai Thị Lựu', N'Nữ', N'256/96/4 Phan Đăng Lưu - Bình Thạnh - HCM', N'09181831444', N'Luudanne@gmail.com', N' ', N'admin6', N'adpass6')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV07', N'Đào Thị Hồng', N'Nữ', N'764/94 Phạm Văn Chiêu - p.13 - GV - HCM', N'09754322222', N'DaoThiHong@gmail.com', N' ', N'admin7', N'adpass7')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV08', N'Phan Thành Nhân', N'Nam', N'152 Nguyễn Trọng Tuyển - Tân Bình - HCM', N'09135332332', N'NhanThanh113@gmail.com', N' ', N'admin8', N'adpass8')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV09', N'Phan Ánh Dương', N'Nữ', N'65 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM', N'09812127678', N'AnhDuong65@gmail.com', N' ', N'admin9', N'adpass9')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV10', N'Phan Ánh Nguyệt', N'Nữ', N'32/65/9 Trần Cao Vân - Phú Nhuận - HCM', N'09812342356', N'TrangNguyet12@gmail.com', N' ', N'admin10', N'adpass10')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV11', N'Nguyễn Kim Ngân', N'Nữ', N'32/60/8 Trần Cao Anh - Phú Nhuận - HCM', N'09812344567', N'KimNganNg@gmail.com', N' ', N'admin11', N'adpass11')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV12', N'Nguyễn Kiều My', N'Nữ', N'32/65/9 Võ Cao Vân - GV - HCM', N'09812344789', N'KieuMyVCV@gmail.com', N' ', N'admin12', N'adpass12')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV13', N'Trần Đăng Khoa', N'Nam', N'7 Cao Bá Quát - Phú Nhuận - HCM', N'09812342398', N'DKTran@gamil.com', N' ', N'admin13', N'adpass13')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV14', N'Nguyễn Hùng Cường', N'Nam', N'87 Võ Tùng - Tân Bình - HCM', N'09812345543', N'CuongHCM@gmail.com', N' ', N'admin14', N'adpass14')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV15', N'Lê Quốc Chí', N'Nam', N'12 Hoàng Hoa Thám - Phú Nhuận - HCM', N'09812342211', N'QuocChi12@gmail.com', N' ', N'admin15', N'adpass15')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV16', N'Nguyễn Minh Thư', N'Nữ', N'12 Hùng Vương - q.2 - HCM', N'09812349999', N'MinhThunek@gmail.com', N' ', N'admin16', N'adpass16')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV17', N'Nguyễn Hoàng Linh Đan', N'Nữ', N'112 Chu Văn An - Phú Nhuận - HCM', N'09812342244', N'DanDancute@gmail.com', N' ', N'admin17', N'adpass17')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV18', N'Nguyễn Văn Chiến', N'Nam', N'17 Linh Trung - q.4 - HCM', N'09812343478', N'Chiencacom@gmail.com', N' ', N'admin18', N'adpass18')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV19', N'La Văn Cầu', N'Nam', N'16 Phan Đình Phùng - Phú Nhuận - HCM', N'09812344532', N'CauLa@gmail.com', N' ', N'admin19', N'adpass19')
INSERT [dbo].[QuanTriVien] ([MaQTV], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [AnhDaiDien], [TaiKhoan], [MatKhau]) VALUES (N'QTV20', N'Trương An Nhiên', N'Nữ', N'429 Trần Phú - q.12 - HCM', N'09812346554', N'NhienHocGioi@gmail.com', N' ', N'admin20', N'adpass20')
--Dữ liệu bảng LoaiSP
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('3P4', N'Mũ bảo hiểm 3/4 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('FF', N'Mũ bảo hiểm Fullface')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('LC', N'Mũ bảo hiểm Lật Cằm')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('1P2', N'Mũ bảo hiểm 1/2 Đầu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('XD', N'Mũ bảo hiểm Xe Đạp')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('TE', N'Mũ bảo hiểm Trẻ Em')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES ('KMBH', N'Kính Mũ Bảo Hiểm')
--Dữ liệu bảng SanPham
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('3P401', N'MŨ BẢO HIỂM 3/4 ROYAL M20D', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 20, 780000,'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('3P402', N'MŨ BẢO HIỂM 3/4 ROYAL M139 KÍNH ÂM DESIGN', N' ', N' ', N'Thiết kế kính âm đột phá, nhiều mẫu tem độc đáo', N'950g', N' size M:54-55 cm, size L:55-57 cm, size XL:57-59 cm',50, 730000,'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('3P403', N'MŨ BẢO HIỂM 3/4 ROYAL M139-TRƠN-KÍNH ÂM', N' ', N' ', N'Thiết kế kính âm đột phá, màu sắc đa dạng', N'950g', N'size M: 54-55 cm, size L: 55-57 cm, size XL: 57-59 cm', 53, 700000,'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('3P404', N'MŨ BẢO HIỂM 3/4 ROYAL M268 TRƠN - 2 KÍNH', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'876g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 640000,'3P4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('3P405', N'MŨ BẢO HIỂM 3/4 ROYAL M20C DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'850g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 67, 630000,'3P4')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('FF01', N'MŨ BẢO HIỂM FULLFACE ROYAL M141K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 45, 1210000,'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('FF02', N'MŨ BẢO HIỂM FULLFACE ROYAL M141', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 70, 1130000,'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('FF03', N'MŨ BẢO HIỂM FULLFACE ROYAL H01', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh',N'1200g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 30, 975000,'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('FF04', N'MŨ BẢO HIỂM FULLFACE ROYAL M138B', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size M, size L: 56 - 57cm, size XL: 58 - 59cm', 20, 760000,'FF')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('FF05', N'MŨ BẢO HIỂM FULLFACE 2 KÍNH ROYAL M266 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1111g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 50, 760000,'FF')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('LC01', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 1050000,'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('LC02', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M08', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 50, 990000,'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('LC03', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 40, 745000,'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('LC04', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M179', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 79, 710000,'LC')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('LC05', N'MŨ BẢO HIỂM LẬT CẰM ROYAL M2703', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'1050g ± 50g', N'size L: 56 - 57cm, size XL: 58 - 59cm', 26, 680000,'LC')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('1P201', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M152K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 40, 1140000,'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('1P202', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M153K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'752g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 38, 1145000,'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('1P203', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M156K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'573g ± 50g', N'size L: 55 - 57cm, size XL: 57 - 59cm', 56, 1845000,'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('1P204', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M379', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'540g ± 50g', N'size L: 55 - 58cm ', 11, 1287000,'1P2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('1P205', N'MŨ BẢO HIỂM LẬT 1/2 ĐẦU ROYAL M158', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'590g ± 50g', N'Freesize (Vòng đầu 54-58 cm)', 96, 1165000,'1P2')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('XD01', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-15 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh, Xốp EPS', N'460 ± 50g', N'Freesize (Vòng đầu 58-60 cm)', 78, 1337000,'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('XD02', N'MŨ BẢO HIỂM XE ĐẠP MD-15 TRƠN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'440 ± 50g', 55, 1130000,'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('XD03', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 TRƠN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'480 ± 50g', 58, 1496000,'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('XD04', N'MŨ BẢO HIỂM XE ĐẠP KÍNH HÍT ROYAL MD-16 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'465 ± 50g', 38, 1040000,'XD')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('XD05', N'MŨ BẢO HIỂM XE ĐẠP ROYAL MD-17', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Freesize (Vòng đầu 58-60 cm)', N'472 ± 50g', 45, 1250000,'XD')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('TE01', N'MŨ BẢO HIỂM TRẺ EM M139 KID - KÍNH ÂM', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 337000,'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('TE02', N'MŨ BẢO HIỂM TRẺ EM ROYAL M20KS', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 330000,'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('TE03', N'MŨ BẢO HIỂM TRẺ EM ROYAL M270 DESIGN', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g',58, 496000,'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('TE04', N'MŨ BẢO HIỂM TRẺ EM M260K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 78, 440000,'TE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('TE05', N'MŨ BẢO HIỂM TRẺ EM M234K', N' ', N' ', N'Vỏ bằng nhựa ABS nguyên sinh', N'Vòng đầu 52cm-54cm', N'560 ± 50g', 45, 550000,'TE')

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('KMBH01', N'KÍNH MŨ BẢO HIỂM BO GƯƠNG', N' ', N' ', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 78, 180000,'KMNH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('KMBH02', N'KÍNH MŨ BẢO HIỂM BO', N' ', N' ', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 55, 130000,'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('KMBH03', N'KÍNH MŨ BẢO HIỂM THẲNG', N' ', N' ', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g',58, 120000,'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('KMBH04', N'KÍNH MŨ BẢO HIỂM DÂY BẠC', N' ', N' ', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 78, 140000,'KMBH')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Hinh1], [Hinh2], [MoTa], [TrongLuong], [KichCo], [SoLuongTon], [GiaBan], [MaLoaiSP]) VALUES ('KMBH05', N'KÍNH MŨ BẢO HIỂM DÂY', N' ', N' ', N'Chất liệu PolyCacbonat', N'FreeSize', N'180g', 45, 125000,'KMBH')
--Dữ liệu bảng DonHang
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH01','KH01','QTV02','2022-03-02',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH02','KH02','QTV02','2022-03-02',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH03','KH03','QTV03','2023-02-04',' ',N'Chuyển khoản')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH04','KH04','QTV04','2022-03-05',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH05','KH05','QTV01','2022-02-05',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH06','KH06','QTV05','2022-02-06',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH07','KH07','QTV06','2022-03-04',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH08','KH08','QTV07','2022-03-07',' ',N'Chuyển Khoản')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH09','KH09','QTV08','2022-02-07',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH10','KH10','QTV08','2022-03-08',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH11','KH11','QTV07','2022-02-08',' ',N'Chuyển khoản')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH12','KH12','QTV04','2022-03-10',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH13','KH13','QTV01','2022-02-09',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH14','KH14','QTV06','2022-03-09',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH15','KH15','QTV01','2022-03-10',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH16','KH16','QTV06','2022-03-09',' ',N'Chuyển Khoản')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH17','KH17','QTV03','2022-02-10',' ',N'Chuyển khoản')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH18','KH18','QTV07','2022-03-10',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH19','KH19','QTV02','2022-02-11',' ',N'Tiền mặt')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaQTV], [NgayDH], [NgayGH], [PTTT], [TrangThai], [TongTien]) VALUES ('DH20','KH20','QTV05','2022-03-11',' ',N'Tiền mặt')
--Dữ liệu bảng CTHD
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH01','KMBH01',3,200000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH01','TE02',15,222000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH02','3P402',8,790000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH02','1P204',1,130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH03','FF03',2,145000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH03','LC01',3,1845000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH03','LC01',2,130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH04','XD03',4,325000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH05','XD01',2,1496000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH05','XD02',3,140000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH05','LC05',30,45000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH06','FF04',4,68000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH06','LC01',3,210000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH07','TE03',2,265000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH08','TE02',1,165000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH08','KMBH03',1,1250000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH09','KMBH05',2,337000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH10','LC03',3,140000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH10','FF01',3,140000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH10','1P204',2,189000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH11','3P402',1,160000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH12','LC02',1,1040000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH12','XD01',3,78000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH13','TE03',2,380000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH13','TE01',1,287000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH14','XD05',5,145000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH14','FF05',3,138000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH15','TE02',2,68000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH16','XD04',10,140000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH16','TE04',8,130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH17','3P402',9,160000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH17','3P405',12,265000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH17','KMBH05',43,45000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH17','1P201',10,78000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH17','1P203',6,7500000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH18','3P401',2,1496000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH18','LC02',2,1040000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH18','KMBH03',2,1250000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH19','FF04',1,130000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH20','TE01',3,78000)
INSERT [dbo].[CTDH] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES('DH20','TE02',1,140000)
