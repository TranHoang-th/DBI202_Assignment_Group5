# GIỚI THIỆU DỰ ÁN CƠ SỞ DỮ LIỆU - NHÓM 5 (LỚP SE2002)

## 1. Thông tin chung
- Dự án: Xây dựng hệ thống cơ sở dữ liệu cho Website Glitzy (Mỹ phẩm & Trang sức).
- Môn học: DBI202
- Mentor: NhungNTH69

## 2. Thành viên thực hiện
1. Phạm Thế Thịnh - CE200556
2. Trần Hoàng - CE200525
3. Lữ Chí Vỹ - CE200285
4. Vũ Đức Duy - CE200616
5. Đoàn Thị Quỳnh Anh - CE200905

## 3. Mô tả hệ thống (Business Description)
Hệ thống quản lý dữ liệu cho cửa hàng Glitzy bao gồm các chức năng chính:
- Quản lý Khách hàng (Customer) và thông tin liên lạc.
- Quản lý Nhà cung cấp (Supplier) và Danh mục sản phẩm (Category).
- Quản lý Kho hàng (Product) và các biến động tồn kho.
- Quản lý Đơn hàng (Orders) và chi tiết giao dịch (OrderDetail).
- Quản lý Phản hồi khách hàng (Review) và Nhân viên (Employee).

## 4. Cấu trúc Database (Physical Design)
Hệ thống được thiết kế với 8 bảng quan hệ, đảm bảo các ràng buộc:
- Khóa chính (Primary Key) và Khóa ngoại (Foreign Key) để duy trì tính toàn vẹn.
- Ràng buộc Check (Giá sản phẩm > 0, Tồn kho >= 0).
- Ràng buộc Unique cho Email và Số điện thoại.

## 5. Các tính năng kỹ thuật đã triển khai (SQL Techniques)
Dựa trên tệp Assignment.sql, nhóm đã hoàn thành:
- Views: Tạo các khung nhìn để thống kê doanh thu và báo cáo kho hàng.
- Stored Procedures: Xử lý logic tính tổng tiền đơn hàng (Sử dụng WITH ENCRYPTION để bảo mật).
- Functions: Hàm tính toán số lượng sản phẩm theo từng nhà cung cấp.
- Triggers: Tự động cập nhật số lượng hàng trong kho khi có phát sinh đơn hàng mới.
- CRUD & Alter: Các lệnh cập nhật dữ liệu và thay đổi cấu trúc bảng (sp_rename).

## 6. Hướng dẫn cài đặt
1. Mở SQL Server Management Studio (SSMS).
2. Chạy file 'Assignment.sql' để khởi tạo database 'ShopDB' và các bảng liên quan.
3. Toàn bộ dữ liệu mẫu (Sample Data) đã được chèn sẵn trong file script.
