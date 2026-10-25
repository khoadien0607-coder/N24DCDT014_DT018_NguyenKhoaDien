# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# KỊCH BẢN CHẠY DEMO (PYTHON 3)
# ==============================================================================

import sys
import os

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

# Thêm đường dẫn src vào hệ thống
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "src"))
from de_tai import radix_co_am

def main():
    print("=" * 75)
    print("BÁO CÁO TIẾN ĐỘ 1 - DEMO THUẬT TOÁN RADIX SORT CÓ SỐ ÂM VÀ SỐ DƯƠNG (PYTHON)")
    print("Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Đề tài: DT018")
    print("=" * 75)
    print()

    # 1. Chạy Ví dụ 1
    print("[1] CHẠY VÍ DỤ 1 TRÊN PHIẾU:")
    vd1_input = [-5, 2, -10, 0, 2]
    vd1_expected = [-10, -5, 0, 2, 2]
    print("  - Input:    ", vd1_input)
    print("  - Expected: ", vd1_expected)
    vd1_actual = radix_co_am(vd1_input, in_trung_gian=True)
    print("  - Actual:   ", vd1_actual)
    print("  - Trạng thái: ", "ĐẠT (PASS)" if vd1_actual == vd1_expected else "KHÔNG ĐẠT (FAIL)")
    print()

    # 2. Chạy Ví dụ 2
    print("[2] CHẠY VÍ DỤ 2 TRÊN PHIẾU (MẢNG TOÀN ÂM):")
    vd2_input = [-3, -1, -2]
    vd2_expected = [-3, -2, -1]
    print("  - Input:    ", vd2_input)
    print("  - Expected: ", vd2_expected)
    vd2_actual = radix_co_am(vd2_input, in_trung_gian=True)
    print("  - Actual:   ", vd2_actual)
    print("  - Trạng thái: ", "ĐẠT (PASS)" if vd2_actual == vd2_expected else "KHÔNG ĐẠT (FAIL)")
    print()

    # 3. Chạy ca kiểm tra input sai
    print("[3] CHẠY CA KIỂM TRA INPUT SAI (LOI01 - Phần tử vượt miền [-999999, 999999]):")
    loi_input = [10, -20, 1000000]
    print("  - Input: ", loi_input)
    try:
        radix_co_am(loi_input)
        print("  - Kết quả: Không phát hiện lỗi (FAIL)")
    except (ValueError, TypeError) as e:
        print("  - Bắt lỗi thành công (PASS):", e)
    print()

    print("=" * 75)
    print("HOÀN THÀNH CHẠY THỰC THI DEMO CÁC VÍ DỤ CƠ BẢN.")
    print("=" * 75)

if __name__ == "__main__":
    main()
