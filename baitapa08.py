# -*- coding: utf-8 -*-
# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# ==============================================================================

import sys
import os

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "src"))
from de_tai import radix_co_am

def chay_a08():
    print("=" * 75)
    print("  [A08] - HÌNH 4.8: KIỂM TRA INPUT KHÔNG HỢP LỆ (VALIDATOR LOI01)")
    print("  Mục tiêu: Từ chối phần tử vi phạm miền giá trị [-999999, 999999]")
    print("  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    print("=" * 75)
    
    loi_input = [10, -20, 1000000]
    print(f"  [INPUT VI PHẠM BIÊN] : {loi_input} (giá trị 1000000 > 999999)")
    print(f"  [KỲ VỌNG EXPECTED]   : Ném ngoại lệ ValueError kèm mã LOI01")
    print("-" * 75)
    
    try:
        radix_co_am(loi_input)
        print("  [THỰC TẾ ACTUAL]     : Không phát hiện lỗi (FAIL)")
    except (ValueError, TypeError) as e:
        print("  [THỰC TẾ ACTUAL]     : Đã bắt ngoại lệ chặn lỗi thành công!")
        print(f"  [THÔNG BÁO TỪ HÀM]   : {e}")
        print("  [ĐÁNH GIÁ]           : ===> PASS (CHẶN ĐÚNG THEO HỢP ĐỒNG ĐỀ TÀI) <===")
    print("=" * 75)

if __name__ == "__main__":
    chay_a08()
