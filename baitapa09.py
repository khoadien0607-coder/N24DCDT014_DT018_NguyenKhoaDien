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
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

def chay_a09():
    print("=" * 75)
    print("  [A09] - HÌNH 4.9: TỔNG KẾT BỘ KIỂM THỬ TỰ ĐỘNG 14 CA TEST")
    print("  Mục tiêu: Chạy toàn bộ 14 ca test bao phủ biên, khóa lặp và lỗi")
    print("  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    print("=" * 75)
    sys.stdout.flush()
    
    test_file = os.path.join(os.path.dirname(__file__), "test", "runtests.py")
    os.system(f'python "{test_file}"')

if __name__ == "__main__":
    chay_a09()
