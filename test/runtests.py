# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# BỘ 14 CA KIỂM THỬ TỰ ĐỘNG (PYTHON 3)
# ==============================================================================

import unittest
import sys
import os

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "src"))
from de_tai import radix_co_am

class TestRadixCoAm(unittest.TestCase):

    # --- Nhóm 1: Hai ví dụ trên phiếu (A01, A02) ---
    def test_tc01_vi_du_1(self):
        """TC01 (A01) - Ví dụ 1 trên phiếu"""
        inp = [-5, 2, -10, 0, 2]
        exp = [-10, -5, 0, 2, 2]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc02_vi_du_2(self):
        """TC02 (A02) - Ví dụ 2 trên phiếu (Toàn âm)"""
        inp = [-3, -1, -2]
        exp = [-3, -2, -1]
        self.assertEqual(radix_co_am(inp), exp)

    # --- Nhóm 2: Hai ca tự thiết kế (A03, A04) ---
    def test_tc03_tu_thiet_ke_1(self):
        """TC03 (A03) - Ca tự thiết kế 1 (Nhiều chữ số âm dương)"""
        inp = [15, -42, 0, 8, -7, 100, -99]
        exp = [-99, -42, -7, 0, 8, 15, 100]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc04_tu_thiet_ke_2(self):
        """TC04 (A04) - Ca tự thiết kế 2 (Chạm cận biên miền số lớn)"""
        inp = [999999, -999999, 123456, -654321, 0]
        exp = [-999999, -654321, 0, 123456, 999999]
        self.assertEqual(radix_co_am(inp), exp)

    # --- Nhóm 3: Các ca biên trên phiếu & đặc biệt (A05, A06, A07) ---
    def test_tc05_bien_toan_0(self):
        """TC05 (A05 / Ca 3 phiếu) - Toàn số 0"""
        inp = [0, 0]
        exp = [0, 0]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc06_bien_khoa_lap(self):
        """TC06 (A06 / Ca 4 phiếu) - Khóa lặp âm dương"""
        inp = [-1, -1, 1]
        exp = [-1, -1, 1]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc07_bien_mang_rong(self):
        """TC07 (A07a / Ca 5 phiếu) - Mảng rỗng"""
        inp = []
        exp = []
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc08_bien_mot_duong(self):
        """TC08 (A07b / Ca 5 phiếu) - Mảng 1 phần tử dương"""
        inp = [5]
        exp = [5]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc09_bien_mot_am(self):
        """TC09 (A07c) - Mảng 1 phần tử âm"""
        inp = [-5]
        exp = [-5]
        self.assertEqual(radix_co_am(inp), exp)

    # --- Nhóm 4: Các ca kiểm thử bổ sung cấu trúc đặc thù ---
    def test_tc10_toan_am_giam_dan(self):
        """TC10 - Mảng giảm dần toàn âm"""
        inp = [-10, -20, -30, -40]
        exp = [-40, -30, -20, -10]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc11_toan_duong_tang_dan(self):
        """TC11 - Mảng tăng dần toàn dương"""
        inp = [1, 2, 3, 4, 5]
        exp = [1, 2, 3, 4, 5]
        self.assertEqual(radix_co_am(inp), exp)

    def test_tc12_doi_xung_nhieu_cap_lap(self):
        """TC12 - Mảng đối xứng nhiều cặp khóa trùng"""
        inp = [-500, 500, -500, 500, 0, 0]
        exp = [-500, -500, 0, 0, 500, 500]
        self.assertEqual(radix_co_am(inp), exp)

    # --- Nhóm 5: Ca kiểm tra input sai qua validator (A08 / LOI01) ---
    def test_tc13_loi01_vuot_can_tren(self):
        """TC13 (A08 / LOI01) - Phần tử vượt giới hạn trên [999999]"""
        inp = [10, -20, 1000000]
        with self.assertRaises(ValueError):
            radix_co_am(inp)

    def test_tc14_loi01_vuot_can_duoi(self):
        """TC14 (LOI01) - Phần tử vượt giới hạn dưới [-999999]"""
        inp = [-1000000, 0, 5]
        with self.assertRaises(ValueError):
            radix_co_am(inp)

if __name__ == "__main__":
    print("=" * 75)
    print("BỘ KIỂM THỬ TỰ ĐỘNG BÁO CÁO TIẾN ĐỘ 1 - ĐỀ TÀI DT018 (PYTHON 3)")
    print("=" * 75)
    unittest.main(verbosity=2)
