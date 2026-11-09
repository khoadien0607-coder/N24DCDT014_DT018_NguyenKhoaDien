<<<<<<< HEAD
# DT018 — Radix Sort cho mảng có số âm và số dương

Báo cáo tiến độ 1 & Mã nguồn đồ án môn học Cấu trúc dữ liệu và Giải thuật (INT13185 - Nhóm 03).

## Thông tin sinh viên và đề tài

- **Họ và tên:** Nguyễn Khoa Điền
- **MSSV:** `N24DCDT014`
- **Lớp:** `D24CQDT01-N`
- **Mã đề tài:** `DT018`
- **Tên đề tài:** Radix Sort cho mảng có số âm và số dương
- **Giảng viên hướng dẫn:** ThS. Hồ Nhựt Minh
- **Giáo trình căn cứ:** `Giao-trinh-Cau-truc-du-lieu-va-Giai-thuat-INT1306.pdf`, Chương 2, Mục 2.4; mục 2.8 bài 30; trang in 45–48, 62; trang PDF 57–60, 74.

---

## Hợp đồng Dữ liệu (I/O Contract)

- **Đầu vào (Input):**
  - Mảng 1 chiều các số nguyên `a::Vector{Int}`.
  - Số lượng phần tử: $0 \le n \le 5000$.
  - Miền giá trị mỗi phần tử: $-999999 \le a[i] \le 999999$.
  - Phương thức: Nhập trực tiếp trong chương trình hoặc qua bàn phím.
- **Đầu ra (Output):**
  - Mảng đã sắp xếp tăng dần theo giá trị đại số thực, in thông tin các nhóm trước khi ghép.
  - Không làm mất phần tử âm, khóa lặp hoặc số 0.
- **Xử lý ngoại lệ / Lỗi:**
  - Nếu dữ liệu vi phạm kiểu hoặc vượt ngoài miền giá trị cho phép, chương trình ném ngoại lệ `ArgumentError` kèm thông báo lỗi `LOI01`.

---

## Hướng dẫn chạy chương trình

Mở terminal/PowerShell tại thư mục `N24DCDT014_DT018_NguyenKhoaDien`:

```powershell
# 1. Chạy demo ví dụ 1, ví dụ 2 và bước trung gian:
julia demo.jl

# 2. Chạy toàn bộ bộ kiểm thử tự động (14 ca kiểm thử):
julia test/runtests.jl
```

---

## Cấu trúc thư mục

```text
N24DCDT014_DT018_NguyenKhoaDien/
├── .gitignore
├── README.md
├── demo.jl                     # Kịch bản chạy demo ví dụ 1, 2 và trung gian
├── src/
│   └── DeTai.jl               # Module chính cài đặt thuật toán và validator
├── test/
│   └── runtests.jl            # Bộ 14 ca kiểm thử tự động
└── docs/
    ├── anh_ket_qua/           # Thư mục lưu 11 ảnh minh chứng A01-A11
    └── logs/                  # Thư mục lưu log thực thi
```
=======
# N24DCDT014_DT018_NguyenKhoaDien
>>>>>>> e85d5af9f1dbe0c9269ca0c3a90ebaa8b68aa691
