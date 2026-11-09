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

def chay_a02():
    print("=" * 75)
    print("  [A02] - HÌNH 4.2: VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (MẢNG TOÀN ÂM)")
    print("  Mục tiêu: Kiểm thử mảng toàn âm sắp xếp đúng theo thứ tự đại số thực")
    print("  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    print("=" * 75)
    
    inp = [-3, -1, -2]
    expected = [-3, -2, -1]
    
    print(f"  [INPUT ĐẦY ĐỦ]    : {inp}")
    print(f"  [KỲ VỌNG EXPECTED]: {expected}")
    print("-" * 75)
    
    actual = radix_co_am(inp, in_trung_gian=True)
    
    print("-" * 75)
    print(f"  [THỰC TẾ ACTUAL]  : {actual}")
    pass_ok = (actual == expected)
    print(f"  [ĐÁNH GIÁ]        : ===> {'PASS (KHỚP HOÀN TOÀN)' if pass_ok else 'FAIL'} <===")
    print("=" * 75)

if __name__ == "__main__":
    chay_a02()
