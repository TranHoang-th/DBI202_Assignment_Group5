# DBI202_Assignment_Group5
# Building a Database System for the Glitzy Cosmetics & Jewelry Website

## 1. Project Overview (Giới thiệu dự án)
Dự án tập trung vào việc thiết kế và triển khai hệ thống cơ sở dữ liệu cho **Glitzy** - một nền tảng website chuyên kinh doanh mỹ phẩm và trang sức. Hệ thống quản lý các thực thể chính như Khách hàng, Nhà cung cấp, Sản phẩm, Đơn hàng và các phản hồi từ người dùng.

## 2. Team Members (Nhóm 5 - SE2002)
- **Phạm Thế Thịnh** - CE200556
- **Trần Hoàng** - CE200525
- **Lữ Chí Vỹ** - CE200285
- **Vũ Đức Duy** - CE200616
- **Đoàn Thị Quỳnh Anh** - CE200905
- **Mentor:** NhungNTH69

## 3. Database Design (Thiết kế Cơ sở dữ liệu)

### 3.1. Entity Relationship Diagram (ERD)
Sơ đồ thực thể mối quan hệ giúp hình dung cấu trúc dữ liệu của Glitzy:
![ERD Diagram](images/image_3341d6.png) 
*(Lưu ý: Thay tên file ảnh ERD của bạn vào đây nếu khác)*

### 3.2. Relational Model
Mô hình quan hệ chi tiết các khóa chính (PK) và khóa ngoại (FK):
![Relational Model](images/image_334497.png)

## 4. Implementation (Triển khai SQL)
Hệ thống bao gồm 8 bảng chính với đầy đủ các ràng buộc dữ liệu:
- `Customer`, `Supplier`, `Category`, `Product`
- `Orders`, `OrderDetail`, `Review`, `Employee`

### Kỹ thuật nâng cao đã áp dụng:
- **Views:** Thống kê doanh thu và quản lý kho hàng.
- **Stored Procedures:** Xử lý tính toán tổng tiền đơn hàng (có áp dụng **Encryption** để bảo mật code).
- **Functions:** Hỗ trợ truy vấn nhanh số lượng sản phẩm theo nhà cung cấp.
- **Triggers:** Tự động hóa việc cập nhật số lượng tồn kho khi có đơn hàng mới.

## 5. Sample Queries & Results (Kết quả truy vấn)
Dưới đây là một số hình ảnh minh họa kết quả thực thi các câu lệnh SQL trong hệ thống:

**Thống kê sản phẩm và Review:**
![Query Result 1](images/image_33449e.png)

**Quản lý đơn hàng và doanh thu:**
![Query Result 2](images/image_3344ba.png)

**Kiểm tra tính năng nâng cao (Trigger/Proc):**
![Query Result 3](images/image_3344d7.png)

## 6. Conclusion
Hệ thống đã hoàn thiện các yêu cầu cơ bản về lưu trữ, truy vấn và đảm bảo tính toàn vẹn dữ liệu cho mô hình kinh doanh của Glitzy.
