CREATE TABLE KHOA (
    MAKH VARCHAR(5) NOT NULL, 
    TENKH NVARCHAR(50),
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKH)
);
CREATE TABLE LOP (
    MALOP VARCHAR(10) NOT NULL,
    TENLOP NVARCHAR(50),
    SISO INT,
    LOPTRUONG VARCHAR(10),
    MAKH VARCHAR(5),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP),
    CONSTRAINT FK_LOP_KHOA FOREIGN KEY (MAKH) REFERENCES KHOA(MAKH)
);
CREATE TABLE SINHVIEN (
    MASV VARCHAR(10) NOT NULL,
    HOTEN NVARCHAR(50),
    NGSINH DATE,
    GTINH NVARCHAR(5),
    DCHI NVARCHAR(50),
    MALOP VARCHAR(10),
	CONSTRAINT PK_SINHVIEN PRIMARY KEY(MASV),
    CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
);
CREATE TABLE GIANGVIEN (
    MAGV VARCHAR(10) NOT NULL, 
    TENGV NVARCHAR(50),
    MAKH VARCHAR(5),
	CONSTRAINT PK_GIANGVIEN PRIMARY KEY(MAGV),
    CONSTRAINT FK_GIANGVIEN_KHOA FOREIGN KEY (MAKH) REFERENCES KHOA(MAKH)
);
CREATE TABLE MONHOC (
    MAMH VARCHAR(10) NOT NULL, 
    TENMH NVARCHAR(50),
    SOTC INT,
	CONSTRAINT PK_MONHOC PRIMARY KEY(MAMH)
);
CREATE TABLE DIEM (
    MASV VARCHAR(10) NOT NULL,
    MAMH VARCHAR(10) NOT NULL,
    LANTHI INT NOT NULL,
    DIEMTHI FLOAT,
    CONSTRAINT PK_DIEM PRIMARY KEY (MASV, MAMH, LANTHI),
    CONSTRAINT FK_DIEM_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
    CONSTRAINT FK_DIEM_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);
CREATE TABLE GIANGDAY (
    MAGV VARCHAR(10) NOT NULL,
    MAMH VARCHAR(10) NOT NULL,
    NAMHOC VARCHAR(10) NOT NULL,
    HOCKY INT NOT NULL,
    CONSTRAINT PK_GIANGDAY PRIMARY KEY (MAGV, MAMH, NAMHOC, HOCKY),
    CONSTRAINT FK_GIANGDAY_GIANGVIEN FOREIGN KEY (MAGV) REFERENCES GIANGVIEN(MAGV),
    CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);
CREATE TABLE THANNHAN (
    MATN VARCHAR(10) NOT NULL,
    HOTEN NVARCHAR(50),
    GIOITINH NVARCHAR(5),
	CONSTRAINT PK_THANNHAN PRIMARY KEY(MATN)
);
CREATE TABLE QUANHE (
    MATN VARCHAR(10) NOT NULL,
    MASV VARCHAR(10) NOT NULL,
    QUANHE NVARCHAR(20),
    CONSTRAINT PK_QUANHE PRIMARY KEY (MATN, MASV),
    CONSTRAINT FK_QUANHE_THANNHAN FOREIGN KEY (MATN) REFERENCES THANNHAN(MATN),
    CONSTRAINT FK_QUANHE_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV)
);

INSERT INTO KHOA 
VALUES 
	('SH', N'Công nghệ sinh học'),
	('TH', N'Công nghệ thông tin'),
	('TP', N'Công nghệ thực phẩm'),
	('QT', N'Quản trị kinh doanh'),
	('TC', N'Tài chính kế toán');


INSERT INTO LOP 
VALUES 
	('10DHSH1', N'10 Đại học Sinh học 1', 55, 'SV008', 'SH'),
	('10DHTH1', N'10 Đại học Tin học 1', 50, 'SV001', 'TH'),
	('11DHTH2', N'11 Đại học Tin học 2', 40, 'SV005', 'TH'),
	('12DHTC1', N'12 Đại học Tài chính 1', 75, 'SV009', 'TC'),
	('12DHTP1', N'12 Đại học Thực phẩm 1', 60, 'SV007', 'TP');


INSERT INTO SINHVIEN 
VALUES 
	('SV001', N'Trần Lệ Quyên', '1995-01-21', N'Nữ', N'TPHCM', '10DHTH1'),
	('SV002', N'Nguyễn Thế Bình', '1996-06-04', N'Nam', N'Tây Ninh', '11DHTH2'),
	('SV003', N'Tô Ánh Nguyệt', '1995-05-02', N'Nữ', N'Vũng Tàu', '12DHTP1'),
	('SV004', N'Nguyễn Thế Anh', '1996-12-15', N'Nam', N'Đồng Nai', '11DHTH2'),
	('SV005', N'Lê Thanh Bình', '1994-12-09', N'Nam', N'Long An', '10DHTH1'),
	('SV006', N'Phạm Quang Hậu', '1995-10-12', N'Nam', N'Tây Ninh', '10DHTH1'),
	('SV007', N'Lê Cẩm Tú', '1989-02-13', N'Nữ', N'Bình Thuận', '12DHTP1'),
	('SV008', N'Trương Thế Sang', '1993-04-04', N'Nam', N'Bình Dương', '10DHSH1'),
	('SV009', N'Đậu Quang Ánh', '1994-12-03', N'Nam', N'Long An', '12DHTC1'),
	('SV010', N'Huỳnh Kim Chi', '1996-10-18', N'Nữ', N'TPHCM', '11DHTH2'),
	('SV011', N'Trịnh Đình Ánh', '1995-11-15', N'Nam', N'Bình Thuận', '10DHTH1');




ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_SINHVIEN FOREIGN KEY(LOPTRUONG) REFERENCES SINHVIEN(MASV);



INSERT INTO GIANGVIEN 
VALUES 
	('GV001', N'Phạm Thế Bảo', 'TH'),
	('GV002', N'Lê Thể Truyền', 'TH'),
	('GV003', N'Trương Anh Dũng', 'SH'),
	('GV004', N'Bùi Chí Anh', 'TC'),
	('GV005', N'Lê Công Hậu', 'QT'),
	('GV006', N'Lê Trung Thành', 'TP');


INSERT INTO MONHOC 
VALUES 
	('CSDL', N'Cơ sở dữ liệu', 3),
	('KTLT', N'Kỹ thuật lập trình', 3),
	('THVP', N'Tin học văn phòng', 3),
	('TRR', N'Toán rời rạc', 3),
	('TTNT', N'Trí tuệ nhân tạo', 2),
	('TTQT', N'Thanh toán quốc tế', 2);
INSERT INTO DIEM 
VALUES 
	('SV001', 'CSDL', 1, 9),
	('SV002', 'THVP', 1, 3),
	('SV002', 'THVP', 2, 7),
	('SV004', 'THVP', 1, 6),
	('SV004', 'TTQT', 1, 5),
	('SV005', 'CSDL', 1, 3),
	('SV005', 'CSDL', 2, 6),
	('SV006', 'KTLT', 1, 4),
	('SV009', 'TTQT', 1, 4),
	('SV010', 'THVP', 1, 8),
	('SV010', 'TRR', 1, 7);


INSERT INTO GIANGDAY 
VALUES 
	('GV001', 'CSDL', '2021-2022', 1),
	('GV001', 'KTLT', '2020-2021', 2),
	('GV001', 'TTNT', '2020-2021', 1),
	('GV002', 'CSDL', '2021-2022', 2),
	('GV002', 'KTLT', '2021-2022', 2);



INSERT INTO THANNHAN 
VALUES 
	('TN001', N'Nguyễn Thế Thành', N'Nam'),
	('TN002', N'Tô Ánh Hồng', N'Nữ'),
	('TN003', N'Lê Thanh An', N'Nam'),
	('TN004', N'Phạm Thanh Tiền', N'Nữ'),
	('TN006', N'Đậu Văn Thanh', N'Nam'),
	('TN007', N'Nguyễn Thị Ánh', N'Nữ'),
	('TN008', N'Lê Quang Định', N'Nam'),
	('TN009', N'Huỳnh Văn Tư', N'Nam');


INSERT INTO QUANHE  
VALUES 
	('TN001', 'SV002', N'Bố'),
	('TN004', 'SV005', N'Mẹ'),
	('TN004', 'SV007', N'Mẹ'),
	('TN006', 'SV009', N'Bố'),
	('TN007', 'SV002', N'Mẹ'),
	('TN008', 'SV005', N'Bố'),
	('TN008', 'SV007', N'Bố');



/*============================================================== Vd về hàm ======================================================================== */

/*===================================================== Hàm hệ thống: Các hàm có sẵn ============================================================== */

-- =================== Hàm xử lý ngày giờ ===============


/*== DATEDIFF ==*/

SELECT  SV.MASV,  SV.HOTEN, DATEDIFF(YEAR, SV.NGSINH, GETDATE()) AS TUOI
FROM  SINHVIEN SV
WHERE  SV.NGSINH IS NOT NULL;  

/*== DATEADD ==*/

SELECT  MASV,  HOTEN,   NGSINH,  DATEADD(DAY, 30, NGSINH) AS NGSINH_PLUS_30_DAYS
FROM  SINHVIEN;

/*=== DATENAME ==*/

PRINT DATENAME(DW,'2024-05-20')  -- Lấy thứ
PRINT DATENAME(DD,'2024-05-20')  -- Lấy ngày
PRINT DATENAME(MM,'2024-05-20')  -- Lấy tháng
PRINT DATENAME(YY,'2024-05-20')  -- Lấy năm



-- =================== hàm xử lý chuỗi =======================

/*== LOWER ><  UPPER ==*/
SELECT  MASV,  LOWER(HOTEN) AS HOTEN_LOWERCASE
FROM SINHVIEN

SELECT  MASV,  UPPER(HOTEN) AS HOTEN_LOWERCASE
FROM SINHVIEN

/*== SUBSTRING ==*/

SELECT  MAMH, SUBSTRING(MAMH, 1, 2) AS MA_MH
FROM  MONHOC


/*== LEFT >< RIGHT ==*/

SELECT  MASV, LEFT(HOTEN, 2) AS HOTEN_LEFT
FROM  SINHVIEN

/*== REPLACE ==*/
-- Hàm thay thế chuỗi ---
SELECT  MAMH, REPLACE(TENMH, N'Cơ sở', N'Cơ sở mới') AS TENMH_MODIFIED, SOTC
FROM  MONHOC;

/*==  REVERSE  ==*/
-- Hàm đảo ngược chuỗi --
SELECT  MASV, REVERSE(MASV) AS HOTEN_LEFT
FROM  SINHVIEN

/*== CHARINDEX ==*/

INSERT INTO SINHVIEN
VALUES ('SV012', N'Trịnh Nguyễn Kim', '1995-11-15', N'Nam', N'Bình Thuận', '10DHTH1');

SELECT  MASV,  HOTEN, CHARINDEX(N'Nguyễn', HOTEN) AS POSITION_NGUYEN
FROM SINHVIEN;
/*=== LEN === */
-- Hàm lấy độ dài chuỗi ---

SELECT  MASV, LEN(MASV) AS DODAI_CHUOI
FROM  SINHVIEN


/*==== LTRIM ====== */
--Hàm trả về chuỗi đã cắt bỏ khoảng trống ở đầu chuỗi ----

PRINT ('    HAM XU LY CHUOI   ')

PRINT LTRIM('    HAM XU LY CHUOI   ')


/*==== LTRIM ====== */
--Hàm trả về chuỗi đã cắt bỏ khoảng trống ở cuối chuỗi  ----

PRINT ('    HAM XU LY CHUOI   ')
PRINT RTRIM('    HAM XU LY CHUOI   ')

-- =================== hàm toán học =======================

/*== ROUND ==*/

PRINT ROUND(21.567,2) 


/*== FLOOR ==*/
-- trả về giá trị nguyên lớn nhất nhưng nhỏ hơn hoặc bằng biểu thức số đã truyền---
PRINT FLOOR(20.8) 

/*== CEILING ==*/
-- trả về giá trị nguyên nhot nhất nhưng lớn hơn hoặc bằng biểu thức số đã truyền---
PRINT CEILING(20.8) 

-- =================== Hàm chuyển kiểu dữ liệu ===============

/*== CAST ==*/
--chuyển đổi một giá trị từ kiểu dữ liệu này sang kiểu dữ liệu khác -- 
PRINT N'Số là: ' +  123

PRINT N'Số là: ' +  CAST(123 AS NVARCHAR(20)) 

/*== CONVERT ==*/
--chuyển đổi một giá trị từ kiểu dữ liệu này sang kiểu dữ liệu khác -- 

PRINT N'Số là: ' +  123 

PRINT N'Số là: ' +  CONVERT(NVARCHAR(20), 123) 

/*== STR ==*/
--Lấy kí tự bắt đầu từ vị trí, và tổng vị trí cần lấy ---

SELECT  SINHVIEN.MASV, HOTEN, STR(DIEMTHI,4,1)  AS DIEM
FROM SINHVIEN
JOIN DIEM ON SINHVIEN.MASV = DIEM.MASV 

/*============================================================== Hàm người dùng: Hàm tự định nghĩa  ====================================================== */

                 ------------------------------------------ Scalar Valued Fuction --(Hàm vô hướng )--------------------------------------------------
                                              /*=== Hàm trả về duy nhất 1 giá trị bằng lệnh RETURN === */


-------------------------------------------
CREATE FUNCTION DIEM_CAO()
RETURNS INT
AS
BEGIN 
  DECLARE @DIEM INT
  SET @DIEM = ( SELECT  MAX(DIEMTHI ) AS DIEMCAO_LANTHI
				 FROM DIEM
				)
				
  RETURN @DIEM
END




--==========
DECLARE @DIEM NVARCHAR(20)
SELECT @DIEM = dbo.DIEM_CAO()
PRINT N'Điểm thi cao nhất là: ' + @DIEM


-------------------------------------------------
CREATE FUNCTION DIEMMAX_LANTHI(@LanThi INT)
RETURNS INT
AS
BEGIN 
    DECLARE @DIEM INT;

    SET @DIEM = (
        SELECT MAX(DIEMTHI)
        FROM DIEM
        WHERE DIEM.LANTHI = @LanThi
    );

    RETURN @DIEM;
END;

--==========
GO
DECLARE @LTHI INT;  
SET @LTHI = 1;     

DECLARE @DIEM2 INT;  
SELECT @DIEM2 = dbo.DIEMMAX_LANTHI(@LTHI); 

PRINT N'Điểm thi cao nhất lần ' + CAST(@LTHI AS NVARCHAR(10)) + N' là: ' + 
      CAST(ISNULL(@DIEM2, 0) AS NVARCHAR(20));  


------------------------------------------  Table  Valued Fuction --(Hàm vô hướng )--------------------------------------------------
                                         /*=== Hàm trả về bảng bằng lệnh RETURN === */

--Viết kiểm tra sinh viên đó có Thân nhân là bố không
-------------Hàm đọc bảng 1-----------------

GO
CREATE FUNCTION dbo.KiemTraThanNhan()
RETURNS TABLE
AS
RETURN
(
    SELECT  S.MASV as Masv,
		S.HOTEN AS TenSV,
        T.HOTEN AS Ten_Bố_SV
        
    FROM   QUANHE Q
    JOIN  THANNHAN T ON Q.MATN = T.MATN
    JOIN  SINHVIEN S ON Q.MASV = S.MASV
    WHERE Q.QUANHE = N'Bố'
);

--=====

SELECT *
FROM  dbo.KiemTraThanNhan()

-------------Hàm đọc bảng 2-----------------
GO
CREATE FUNCTION KiemTra_Diem()
RETURNS TABLE
AS
RETURN
(
    SELECT  S.HOTEN, D.Diemthi,
        CASE 
            WHEN D.DIEMTHI > 7 THEN N'Đạt'
            ELSE N'Chưa đạt'
        END AS TrangThai
    FROM  SINHVIEN S
    JOIN  DIEM D ON S.MASV = D.MASV 
);


--=====

SELECT * FROM dbo.KiemTra_Diem();



-------------Hàm tạo bảng  1-----------------

GO
CREATE FUNCTION SINHVIEN_TT()
RETURNS @SVTABLE TABLE
(
    SVId NVARCHAR(40),
    SVName NVARCHAR(50),
    MALOP NVARCHAR(10),
    DIEMTHI FLOAT
)
AS
BEGIN
    INSERT INTO @SVTABLE
    SELECT 
        S.MASV, 
        S.HOTEN, 
        L.MALOP,
        D.DIEMTHI
    FROM 
        SINHVIEN S
    JOIN 
        LOP L ON S.MALOP = L.MALOP
    LEFT JOIN 
        DIEM D ON S.MASV = D.MASV;

    RETURN
END

---=====

GO
SELECT *
FROM  dbo.SINHVIEN_TT()


----------------Hàm tạo bảng 2---------------------

GO
CREATE FUNCTION KiemTraSinhVien_ThiMon (
    @TenMon NVARCHAR(50)
)
RETURNS @SVTABLE TABLE (
    MASV NVARCHAR(40),
    HOTEN NVARCHAR(50),
    MAMH NVARCHAR(50)
)
AS
BEGIN 
    IF EXISTS (
        SELECT 1 
        FROM DIEM D
        WHERE D.MAMH = @TenMon
    )
    BEGIN
        INSERT INTO @SVTABLE 
        SELECT S.MASV, S.HOTEN, D.MAMH
        FROM SINHVIEN S
        JOIN DIEM D ON S.MASV = D.MASV
        WHERE D.MAMH = @TenMon;
    END
    ELSE
    BEGIN
        INSERT INTO @SVTABLE 
        VALUES ('0', N'Không có sinh viên nào học môn ' + @TenMon, NULL);
    END

    RETURN;
END


---=========


INSERT INTO MONHOC 
VALUES 	('TOAN', N'Toán', 3),

SELECT * FROM dbo.KiemTraSinhVien_ThiMon('TOAN');




