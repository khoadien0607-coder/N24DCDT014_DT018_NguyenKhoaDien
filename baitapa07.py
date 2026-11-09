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

def chay_a07():
    print("=" * 75)
    print("  [A07] - HÌNH 4.7: CA BIÊN 3 TRÊN PHIẾU - MẢNG RỖNG VÀ MẢNG 1 PHẦN TỬ")
    print("  Mục tiêu: Kiểm thử các trường hợp cơ sở n = 0 và n = 1")
    print("  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    print("=" * 75)
    
    print("  --- 1. MẢNG RỖNG (n = 0) ---")
    inp1 = []
    exp1 = []
    act1 = radix_co_am(inp1)
    print(f"  Input:    {inp1}")
    print(f"  Expected: {exp1}")
    print(f"  Actual:   {act1}")
    print(f"  Đánh giá: {'PASS' if act1 == exp1 else 'FAIL'}\n")
    
    print("  --- 2. MẢNG 1 PHẦN TỬ DƯƠNG (n = 1) ---")
    inp2 = [5]
    exp2 = [5]
    act2 = radix_co_am(inp2)
    print(f"  Input:    {inp2}")
    print(f"  Expected: {exp2}")
    print(f"  Actual:   {act2}")
    print(f"  Đánh giá: {'PASS' if act2 == exp2 else 'FAIL'}\n")
    
    print("  --- 3. MẢNG 1 PHẦN TỬ ÂM (n = 1) ---")
    inp3 = [-5]
    exp3 = [-5]
    act3 = radix_co_am(inp3)
    print(f"  Input:    {inp3}")
    print(f"  Expected: {exp3}")
    print(f"  Actual:   {act3}")
    print(f"  Đánh giá: {'PASS' if act3 == exp3 else 'FAIL'}")
    print("=" * 75)

if __name__ == "__main__":
    chay_a07()
