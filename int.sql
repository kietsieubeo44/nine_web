CREATE DATABASE BanVe
USE BanVe
-- Tạo bảng KhachHang
CREATE TABLE KhachHang (
    MaKH CHAR(10) PRIMARY KEY,
    TenKH NVARCHAR(50),
    Email VARCHAR(15),
    SDT INT,
    DiaChi VARCHAR(100)
);


-- Thêm dữ liệu vào bảng KhachHang
INSERT INTO KhachHang (MaKH, TenKH, Email, SDT, DiaChi) VALUES
('KH0001', 'Nguyen A', 'nguyena@example.com', 123456789, '123 Nguyen Trai, HCM'),
('KH0002', 'Tran B', 'tranb@example.com', 234567890, '456 Le Lai, HN'),
('KH0003', 'Le C', 'lec@example.com', 345678901, '789 Nguyen Du, DN'),
('KH0004', 'Pham D', 'phamd@example.com', 456789012, '12 Le Thanh Ton, HCM'),
('KH0005', 'Hoang E', 'hoange@example.com', 567890123, '34 Hoang Hoa Tham, HN'),
('KH0006', 'Nguyen F', 'nguyenf@example.com', 678901234, '56 Nguyen Kiem, DN'),
('KH0007', 'Tran G', 'trang@example.com', 789012345, '78 Pham Ngoc Thach, HCM'),
('KH0008', 'Le H', 'leh@example.com', 890123456, '90 Hai Ba Trung, HN'),
('KH0009', 'Pham I', 'phami@example.com', 901234567, '101 Le Duan, DN'),
('KH0010', 'Hoang J', 'hoangj@example.com', 112345678, '112 Xuan Thuy, HCM');
-- Tạo bảng TaiKhoan
CREATE TABLE TaiKhoan (
    TenTaiKhoan NVARCHAR(50) PRIMARY KEY,
    MatKhau NVARCHAR(100),
    Role NVARCHAR(50)
);

-- Thêm dữ liệu
INSERT INTO TaiKhoan (TenTaiKhoan, MatKhau, Role) VALUES
('admin_user', 'Admin@123', N'Admin'),
('hr_user', 'HR@123', N'Quản lý nhân sự'),
('warehouse_user', 'Warehouse@123', N'Quản lý kho'),
('employee_user', 'Employee@123', N'Nhân viên'),
('customer_user', 'Customer@123', N'Khách hàng');
-- Tạo bảng SuKien
CREATE TABLE SuKien (
    MaSK CHAR(10) PRIMARY KEY,
    TenSK NVARCHAR(50),
    NgayTao DATE,
    NgayToChuc INT,
    DiaDiem VARCHAR(100),
    MaKH CHAR(10),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- Thêm dữ liệu vào bảng SuKien
INSERT INTO SuKien (MaSK, TenSK, NgayTao, NgayToChuc, DiaDiem, MaKH) VALUES
('SK0001', 'Event A', '2024-01-01', 20240101, 'HCM', 'KH0001'),
('SK0002', 'Event B', '2024-02-01', 20240201, 'HN', 'KH0002'),
('SK0003', 'Event C', '2024-03-01', 20240301, 'DN', 'KH0003'),
('SK0004', 'Event D', '2024-04-01', 20240401, 'HCM', 'KH0004'),
('SK0005', 'Event E', '2024-05-01', 20240501, 'HN', 'KH0005'),
('SK0006', 'Event F', '2024-06-01', 20240601, 'DN', 'KH0006'),
('SK0007', 'Event G', '2024-07-01', 20240701, 'HCM', 'KH0007'),
('SK0008', 'Event H', '2024-08-01', 20240801, 'HN', 'KH0008'),
('SK0009', 'Event I', '2024-09-01', 20240901, 'DN', 'KH0009'),
('SK0010', 'Event J', '2024-10-01', 20241001, 'HCM', 'KH0010');

-- Tạo bảng DichVu
CREATE TABLE DichVu (
    MaDV CHAR(10) PRIMARY KEY,
    TenDV NVARCHAR(50),
    MoTa VARCHAR(200),
    GiaTien INT
);

-- Thêm dữ liệu vào bảng DichVu
INSERT INTO DichVu (MaDV, TenDV, MoTa, GiaTien) VALUES
('DV0001', 'Dich Vu A', 'Mo ta dich vu A', 1000),
('DV0002', 'Dich Vu B', 'Mo ta dich vu B', 2000),
('DV0003', 'Dich Vu C', 'Mo ta dich vu C', 3000),
('DV0004', 'Dich Vu D', 'Mo ta dich vu D', 4000),
('DV0005', 'Dich Vu E', 'Mo ta dich vu E', 5000),
('DV0006', 'Dich Vu F', 'Mo ta dich vu F', 6000),
('DV0007', 'Dich Vu G', 'Mo ta dich vu G', 7000),
('DV0008', 'Dich Vu H', 'Mo ta dich vu H', 8000),
('DV0009', 'Dich Vu I', 'Mo ta dich vu I', 9000),
('DV0010', 'Dich Vu J', 'Mo ta dich vu J', 10000);

-- Tạo bảng SuKienDichVu
CREATE TABLE SuKienDichVu (
    MaSK CHAR(10),
    MaDV CHAR(10),
    SoLuong INT,
    PRIMARY KEY (MaSK, MaDV),
    FOREIGN KEY (MaSK) REFERENCES SuKien(MaSK),
    FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV)
);

-- Thêm dữ liệu vào bảng SuKienDichVu
INSERT INTO SuKienDichVu (MaSK, MaDV, SoLuong) VALUES
('SK0001', 'DV0001', 10),
('SK0002', 'DV0002', 20),
('SK0003', 'DV0003', 30),
('SK0004', 'DV0004', 40),
('SK0005', 'DV0005', 50),
('SK0006', 'DV0006', 60),
('SK0007', 'DV0007', 70),
('SK0008', 'DV0008', 80),
('SK0009', 'DV0009', 90),
('SK0010', 'DV0010', 100);

-- Tạo bảng NhanVien
CREATE TABLE NhanVien (
    MaNV CHAR(10) PRIMARY KEY,
    TenNV NVARCHAR(50),
    VaiTro VARCHAR(20),
    SDT INT
);

-- Thêm dữ liệu vào bảng NhanVien
INSERT INTO NhanVien (MaNV, TenNV, VaiTro, SDT) VALUES
('NV0001', 'Nguyen V', 'Manager', 123456789),
('NV0002', 'Tran W', 'Employee', 234567890),
('NV0003', 'Le X', 'Employee', 345678901),
('NV0004', 'Pham Y', 'Manager', 456789012),
('NV0005', 'Hoang Z', 'Employee', 567890123),
('NV0006', 'Nguyen AA', 'Manager', 678901234),
('NV0007', 'Tran BB', 'Employee', 789012345),
('NV0008', 'Le CC', 'Employee', 890123456),
('NV0009', 'Pham DD', 'Manager', 901234567),
('NV0010', 'Hoang EE', 'Employee', 112345678);

-- Tạo bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNCC CHAR(10) PRIMARY KEY,
    TenNCC NVARCHAR(50),
    DiaChi VARCHAR(20),
    SDT INT,
    Email VARCHAR(20)
);

-- Thêm dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES
('NCC0001', 'NCC A', '123 Nguyen Kiem', 123456789, 'ncca@example.com'),
('NCC0002', 'NCC B', '456 Le Lai', 234567890, 'nccb@example.com'),
('NCC0003', 'NCC C', '789 Nguyen Du', 345678901, 'nccc@example.com'),
('NCC0004', 'NCC D', '12 Le Thanh Ton', 456789012, 'nccd@example.com'),
('NCC0005', 'NCC E', '34 Hoang Hoa Tham', 567890123, 'ncce@example.com'),
('NCC0006', 'NCC F', '56 Nguyen Kiem', 678901234, 'nccf@example.com'),
('NCC0007', 'NCC G', '78 Pham Ngoc Thach', 789012345, 'nccg@example.com'),
('NCC0008', 'NCC H', '90 Hai Ba Trung', 890123456, 'ncch@example.com'),
('NCC0009', 'NCC I', '101 Le Duan', 901234567, 'ncci@example.com'),
('NCC0010', 'NCC J', '112 Xuan Thuy', 112345678, 'nccj@example.com');

-- Tạo bảng DvNcc
CREATE TABLE DvNcc (
    MaDV CHAR(10),
    MaNCC VARCHAR(10),
    PRIMARY KEY (MaDV, MaNCC),
);
-- Thêm dữ liệu vào bảng DvNcc
INSERT INTO DvNcc (MaDV, MaNCC) VALUES
('DV0001', 'NCC0001'),
('DV0002', 'NCC0002'),
('DV0003', 'NCC0003'),
('DV0004', 'NCC0004'),
('DV0005', 'NCC0005'),
('DV0006', 'NCC0006'),
('DV0007', 'NCC0007'),
('DV0008', 'NCC0008'),
('DV0009', 'NCC0009'),
('DV0010', 'NCC0010');

-- Tạo bảng ThanhToan
CREATE TABLE ThanhToan (
    MaTT CHAR(10) PRIMARY KEY,
    MaSK NVARCHAR(50),
    SoTien FLOAT,
    NgayTT DATE,
    HinhThucTT VARCHAR(50)
);

-- Thêm dữ liệu vào bảng ThanhToan
INSERT INTO ThanhToan (MaTT, MaSK, SoTien, NgayTT, HinhThucTT) VALUES
('TT0001', 'SK0001', 100000, '2024-01-01', 'Cash'),
('TT0002', 'SK0002', 200000, '2024-02-01', 'Card'),
('TT0003', 'SK0003', 300000, '2024-03-01', 'Transfer'),
('TT0004', 'SK0004', 400000, '2024-04-01', 'Cash'),
('TT0005', 'SK0005', 500000, '2024-05-01', 'Card'),
('TT0006', 'SK0006', 600000, '2024-06-01', 'Transfer'),
('TT0007', 'SK0007', 700000, '2024-07-01', 'Cash'),
('TT0008', 'SK0008', 800000, '2024-08-01', 'Card'),
('TT0009', 'SK0009', 900000, '2024-09-01', 'Transfer'),
('TT0010', 'SK0010', 1000000, '2024-10-01', 'Cash');
-- Tạo Login
CREATE LOGIN AdminLogin WITH PASSWORD = 'Admin@123';
CREATE LOGIN HRLogin WITH PASSWORD = 'HR@123';
CREATE LOGIN WarehouseLogin WITH PASSWORD = 'Warehouse@123';
CREATE LOGIN CustomerLogin WITH PASSWORD = 'Customer@123';
CREATE LOGIN EmployeeLogin WITH PASSWORD = 'Employee@123';


-- User cho từng nhóm quyền
CREATE USER AdminUser FOR LOGIN AdminLogin;
CREATE USER HRUser FOR LOGIN HRLogin;
CREATE USER WarehouseUser FOR LOGIN WarehouseLogin;
CREATE USER CustomerUser FOR LOGIN CustomerLogin;
CREATE USER EmployeeUser FOR LOGIN EmployeeLogin;

-- Tạo nhóm quyền cho Admin
CREATE ROLE AdminRole;
GRANT CONTROL ON DATABASE::BanVe TO AdminRole;

-- Tạo nhóm quyền cho Quản lý nhân sự (HR)
CREATE ROLE HRRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.NhanVien TO HRRole;

-- Tạo nhóm quyền cho Quản lý kho (Warehouse)
CREATE ROLE WarehouseRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.NhaCungCap TO WarehouseRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Dvncc TO WarehouseRole;

-- Tạo nhóm quyền cho Khách hàng (Customer)
CREATE ROLE CustomerRole;
GRANT SELECT ON dbo.KhachHang TO CustomerRole;

-- Tạo nhóm quyền cho Nhân viên (Employee)
CREATE ROLE EmployeeRole;
GRANT SELECT ON dbo.SuKien TO EmployeeRole;
GRANT SELECT ON dbo.DichVu TO EmployeeRole;
--Tạo login và user từ các cho tất cả tài khoản trong bảng TaiKhoan
BEGIN TRY
    DECLARE @TenTaiKhoan NVARCHAR(50);
    DECLARE @MatKhau NVARCHAR(100);
    DECLARE @VaiTro NVARCHAR(50);

    -- Khai báo con trỏ để duyệt qua các tài khoản trong bảng TaiKhoan
    DECLARE account_cursor CURSOR FOR
    SELECT TenTaiKhoan, MatKhau, Role
    FROM TaiKhoan;

    -- Mở con trỏ
    OPEN account_cursor;

    -- Lấy dòng đầu tiên
    FETCH NEXT FROM account_cursor INTO @TenTaiKhoan, @MatKhau, @VaiTro;

    -- Duyệt qua từng dòng trong bảng TaiKhoan
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Kiểm tra nếu login đã tồn tại
        IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = @TenTaiKhoan)
        BEGIN
            -- Tạo login
            EXEC('CREATE LOGIN [' + @TenTaiKhoan + '] WITH PASSWORD = ''' + @MatKhau + '''');
            -- Tạo user trong cơ sở dữ liệu hiện tại
            EXEC('CREATE USER [' + @TenTaiKhoan + '] FOR LOGIN [' + @TenTaiKhoan + ']');

            -- Gán quyền dựa trên vai trò
            IF @VaiTro = N'Admin'
                EXEC sp_addrolemember 'AdminRole', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Quản lý nhân sự'
                EXEC sp_addrolemember 'HRRole', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Quản lý kho'
                EXEC sp_addrolemember 'WarehouseRole', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Nhân viên'
                EXEC sp_addrolemember 'EmployeeRole', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Khách hàng'
                EXEC sp_addrolemember 'CustomerRole', @TenTaiKhoan;
            ELSE
                PRINT N'Vai trò không xác định. Không gán quyền cho tài khoản: ' + @TenTaiKhoan;

            PRINT N'Login và User đã được tạo thành công cho: ' + @TenTaiKhoan;
        END
        ELSE
        BEGIN
            PRINT N'Tài khoản đã tồn tại: ' + @TenTaiKhoan;
        END

        -- Lấy dòng tiếp theo
        FETCH NEXT FROM account_cursor INTO @TenTaiKhoan, @MatKhau, @VaiTro;
    END

    -- Đóng và giải phóng con trỏ
    CLOSE account_cursor;
    DEALLOCATE account_cursor;
END TRY
BEGIN CATCH
    PRINT N'Lỗi xảy ra: ' + ERROR_MESSAGE();
END CATCH;


-- Thủ tục tạo tài khoản mới
IF OBJECT_ID('sp_CreateNewAccount', 'P') IS NOT NULL
    DROP PROCEDURE sp_CreateNewAccount;
GO

-- Tạo thủ tục
CREATE PROCEDURE sp_CreateNewAccount
    @TenTaiKhoan NVARCHAR(50),
    @MatKhau NVARCHAR(100),
    @VaiTro NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        -- Kiểm tra nếu login đã tồn tại
        IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = @TenTaiKhoan)
        BEGIN
            -- Tạo login
            DECLARE @sql NVARCHAR(MAX);
            SET @sql = N'CREATE LOGIN [' + @TenTaiKhoan + '] WITH PASSWORD = ''' + @MatKhau + '''';
            EXEC sp_executesql @sql;

            -- Tạo user trong cơ sở dữ liệu hiện tại
            SET @sql = N'CREATE USER [' + @TenTaiKhoan + '] FOR LOGIN [' + @TenTaiKhoan + ']';
            EXEC sp_executesql @sql;

            -- Gán quyền dựa trên vai trò
            IF @VaiTro = N'Admin'
                EXEC sp_addrolemember 'admin_role', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Quản lý nhân sự'
                EXEC sp_addrolemember 'personnelmanagement_role', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Quản lý kho'
                EXEC sp_addrolemember 'warehousemanagement_role', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Nhân viên'
                EXEC sp_addrolemember 'employee_role', @TenTaiKhoan;
            ELSE IF @VaiTro = N'Khách hàng'
                EXEC sp_addrolemember 'customer_role', @TenTaiKhoan;
            ELSE
                PRINT N'Vai trò không xác định. Không gán quyền cho tài khoản: ' + @TenTaiKhoan;

            -- Thông báo tạo thành công
            PRINT N'Login và User đã được tạo thành công cho: ' + @TenTaiKhoan;
        END
        ELSE
        BEGIN
            PRINT N'Tài khoản đã tồn tại: ' + @TenTaiKhoan;
        END
    END TRY
    BEGIN CATCH
        -- Xử lý lỗi
        PRINT N'Lỗi xảy ra: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Thủ tục đổi mật khẩu
-- Xóa thủ tục nếu đã tồn tại
IF OBJECT_ID('sp_ChangePassword', 'P') IS NOT NULL
    DROP PROCEDURE sp_ChangePassword;
GO

-- Tạo thủ tục
CREATE PROCEDURE sp_ChangePassword
    @TenTaiKhoan NVARCHAR(50),
    @MatKhauCu NVARCHAR(100),
    @MatKhauMoi NVARCHAR(100),
    @Result INT OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra mật khẩu cũ
        IF EXISTS (SELECT * 
                   FROM TaiKhoan 
                   WHERE TenTaiKhoan = @TenTaiKhoan AND MatKhau = @MatKhauCu)
        BEGIN
            -- Cập nhật mật khẩu trong bảng TaiKhoan
            UPDATE TaiKhoan
            SET MatKhau = @MatKhauMoi
            WHERE TenTaiKhoan = @TenTaiKhoan;

            -- Cập nhật mật khẩu cho Login
            DECLARE @sql NVARCHAR(MAX);
            SET @sql = N'ALTER LOGIN [' + @TenTaiKhoan + '] WITH PASSWORD = ''' + @MatKhauMoi + '''';
            EXEC sp_executesql @sql;

            -- Đặt kết quả thành công
            SET @Result = 0;

            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- Rollback nếu mật khẩu cũ không đúng
            ROLLBACK TRANSACTION;
            SET @Result = 1; -- Mật khẩu cũ không đúng
        END
    END TRY
    BEGIN CATCH
        -- Rollback nếu xảy ra lỗi
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @Result = 1; -- Thất bại
        PRINT N'Lỗi xảy ra: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

--Trigger kiểm tra dữ liệu khi tạo tài khoản mới
-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckNewCustomer', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckNewCustomer;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckNewCustomer
ON KhachHang
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra điều kiện: Số điện thoại hợp lệ (Kiểm tra số nguyên có 10 chữ số)
    IF EXISTS (
        SELECT 1 
        FROM Inserted 
        WHERE LEN(CAST(SDT AS VARCHAR)) != 10 -- Phải có đúng 10 chữ số
              OR CAST(SDT AS VARCHAR) LIKE '%[^0-9]%' -- Không chứa ký tự không phải số
    )
    BEGIN
        RAISERROR (N'Số điện thoại không hợp lệ. Phải là số có 10 chữ số.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Kiểm tra điều kiện: Email hợp lệ (Phải có dạng cơ bản email)
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE Email NOT LIKE '%@%.%' -- Phải chứa ký tự @ và dấu chấm
    )
    BEGIN
        RAISERROR (N'Email không hợp lệ.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Kiểm tra điều kiện: Tên khách hàng không được để trống
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE TenKH IS NULL OR LTRIM(RTRIM(TenKH)) = ''
    )
    BEGIN
        RAISERROR (N'Tên khách hàng không được để trống.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Thêm khách hàng mới thành công.';
END;
GO

--Trigger kiểm tra ngày tổ chức sự kiện
-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckEventDate', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckEventDate;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckEventDate
ON SuKien
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra ngày tổ chức sự kiện phải lớn hơn hoặc bằng ngày tạo sự kiện
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE CONVERT(DATE, CONVERT(VARCHAR, NgayToChuc)) < NgayTao
    )
    BEGIN
        RAISERROR (N'Ngày tổ chức sự kiện phải lớn hơn hoặc bằng ngày tạo sự kiện.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Sự kiện đã được thêm hoặc cập nhật thành công.';
END;
GO
--Trigger kiểm tra số lượng dịch vụ
-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckServiceQuantity', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckServiceQuantity;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckServiceQuantity
ON SuKienDichVu
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra số lượng dịch vụ phải là một số dương
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE SoLuong <= 0
    )
    BEGIN
        RAISERROR (N'Số lượng dịch vụ phải là một số dương.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Số lượng dịch vụ hợp lệ đã được thêm vào sự kiện.';
END;
GO

--Trigger kiểm tra dịch vụ khi thêm vào sự kiện
-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckServiceExist', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckServiceExist;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckServiceExist
ON SuKienDichVu
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra dịch vụ có tồn tại trong bảng DichVu
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE MaDV NOT IN (SELECT MaDV FROM DichVu)
    )
    BEGIN
        RAISERROR (N'Dịch vụ không tồn tại trong hệ thống.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Dịch vụ đã được thêm thành công vào sự kiện.';
END;
GO
--Trigger kiểm tra sự kiện có tồn tại hay không
-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckEventExist', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckEventExist;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckEventExist
ON SuKienDichVu
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra sự kiện có tồn tại trong bảng SuKien
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE MaSK NOT IN (SELECT MaSK FROM SuKien)
    )
    BEGIN
        RAISERROR (N'Sự kiện không tồn tại trong hệ thống.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Dịch vụ đã được thêm vào sự kiện thành công.';
END;
GO

--Kiểm tra khách hàng tồn tại khi thêm sự kiện

-- Xóa trigger nếu đã tồn tại
IF OBJECT_ID('tr_CheckCustomerExist', 'TR') IS NOT NULL
    DROP TRIGGER tr_CheckCustomerExist;
GO

-- Tạo trigger
CREATE TRIGGER tr_CheckCustomerExist
ON SuKien
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra khách hàng có tồn tại trong bảng KhachHang
    IF EXISTS (
        SELECT 1
        FROM Inserted
        WHERE MaKH NOT IN (SELECT MaKH FROM KhachHang)
    )
    BEGIN
        RAISERROR (N'Khách hàng không tồn tại trong hệ thống.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    PRINT N'Sự kiện đã được thêm thành công với khách hàng hợp lệ.';
END;
GO
