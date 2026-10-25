# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# KỊCH BẢN CHẠY MINH CHỨNG 11 ẢNH A01 - A11 (PYTHON 3)
# ==============================================================================

import sys
import os

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "src"))
from de_tai import radix_co_am

def in_tieu_de(ma_anh, hinh, tieu_de, muc_tieu):
    print("=" * 75)
    print(f"  [{ma_anh}] - HÌNH {hinh}: {tieu_de}")
    print(f"  Mục tiêu: {muc_tieu}")
    print(f"  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    print("=" * 75)

def chay_ca(ma_anh, hinh, ten_ca, inp, expected, phan_tich):
    in_tieu_de(ma_anh, hinh, ten_ca, phan_tich)
    print(f"  [INPUT ĐẦY ĐỦ]    : {inp}")
    print(f"  [KỲ VỌNG EXPECTED]: {expected}")
    print("-" * 75)
    actual = radix_co_am(inp, in_trung_gian=True)
    print("-" * 75)
    print(f"  [THỰC TẾ ACTUAL]  : {actual}")
    pass_ok = (actual == expected)
    print(f"  [ĐÁNH GIÁ]        : ===> {'PASS (KHỚP HOÀN TOÀN)' if pass_ok else 'FAIL'} <===")
    print("=" * 75)
    print()

def chay_a01():
    chay_ca("A01", "4.1", "VÍ DỤ 1 TRÊN PHIẾU GIAO ĐỀ TÀI",
            [-5, 2, -10, 0, 2], [-10, -5, 0, 2, 2],
            "Kiểm thử ví dụ 1 có đầy đủ số âm, số dương, số 0 và khóa lặp 2")

def chay_a02():
    chay_ca("A02", "4.2", "VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (TOÀN ÂM)",
            [-3, -1, -2], [-3, -2, -1],
            "Kiểm thử mảng toàn âm sắp xếp đúng theo thứ tự đại số thực")

def chay_a03():
    chay_ca("A03", "4.3", "CA TỰ THIẾT KẾ 1 - NHIỀU CHỮ SỐ ĐAN XEN",
            [15, -42, 0, 8, -7, 100, -99], [-99, -42, -7, 0, 8, 15, 100],
            "Kiểm thử mảng hỗn hợp âm dương có số chữ số khác nhau (1 chữ số đến 3 chữ số)")

def chay_a04():
    chay_ca("A04", "4.4", "CA TỰ THIẾT KẾ 2 - CẬN BIÊN MIỀN SỐ LỚN",
            [999999, -999999, 123456, -654321, 0], [-999999, -654321, 0, 123456, 999999],
            "Kiểm thử dữ liệu chạm cận biên tối đa miền hợp lệ [-999999, 999999]")

def chay_a05():
    chay_ca("A05", "4.5", "CA BIÊN 1 - TOÀN SỐ 0",
            [0, 0], [0, 0],
            "Kiểm thử tính đúng đắn khi mảng chỉ chứa các số 0 trùng lặp")

def chay_a06():
    chay_ca("A06", "4.6", "CA BIÊN 2 - KHÓA TRÙNG LẶP CẢ ÂM VÀ DƯƠNG",
            [-1, -1, 1], [-1, -1, 1],
            "Kiểm thử tính bảo toàn số lần xuất hiện của các phần tử trùng lặp")

def chay_a07():
    in_tieu_de("A07", "4.7", "CA BIÊN 3 - MẢNG RỖNG VÀ MẢNG 1 PHẦN TỬ", "Kiểm thử các trường hợp cơ sở n=0 và n=1")
    print("  --- 1. MẢNG RỖNG (n = 0) ---")
    inp1 = []
    exp1 = []
    print("  Input:    ", inp1)
    act1 = radix_co_am(inp1)
    print("  Actual:   ", act1)
    print("  Đánh giá: ", "PASS" if act1 == exp1 else "FAIL")
    print()
    print("  --- 2. MẢNG 1 PHẦN TỬ (n = 1) ---")
    inp2 = [5]
    exp2 = [5]
    print("  Input:    ", inp2)
    act2 = radix_co_am(inp2)
    print("  Actual:   ", act2)
    print("  Đánh giá: ", "PASS" if act2 == exp2 else "FAIL")
    print("=" * 75)
    print()

def chay_a08():
    in_tieu_de("A08", "4.8", "KIỂM TRA INPUT SAI (VALIDATOR LOI01)", "Từ chối phần tử vi phạm miền [-999999, 999999]")
    loi_input = [10, -20, 1000000]
    print("  [INPUT VI PHẠM BIÊN] : ", loi_input, " (1000000 > 999999)")
    print("  [KỲ VỌNG EXPECTED]   : Ném ngoại lệ ValueError kèm mã LOI01")
    print("-" * 75)
    try:
        radix_co_am(loi_input)
        print("  [THỰC TẾ ACTUAL]     : Không phát hiện lỗi (FAIL)")
    except (ValueError, TypeError) as e:
        print("  [THỰC TẾ ACTUAL]     : Đã bắt lỗi ngoại lệ thành công!")
        print("  [THÔNG BÁO TỪ HÀM]   : ", e)
        print("  [ĐÁNH GIÁ]           : ===> PASS (CHẶN ĐÚNG THEO HỢP ĐỒNG ĐỀ TÀI) <===")
    print("=" * 75)
    print()

if __name__ == "__main__":
    chon = sys.argv[1].upper() if len(sys.argv) > 1 else "ALL"
    dispatch = {
        "A01": chay_a01, "A02": chay_a02, "A03": chay_a03, "A04": chay_a04,
        "A05": chay_a05, "A06": chay_a06, "A07": chay_a07, "A08": chay_a08
    }
    if chon in dispatch:
        dispatch[chon]()
    else:
        for f in dispatch.values():
            f()
