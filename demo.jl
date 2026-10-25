# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# ==============================================================================

include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

println("="^70)
println("BÁO CÁO TIẾN ĐỘ 1 - DEMO THUẬT TOÁN RADIX SORT CÓ SỐ ÂM VÀ SỐ DƯƠNG")
println("Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Đề tài: DT018")
println("="^70)
println()

# ------------------------------------------------------------------------------
# 1. Chạy Ví dụ 1 trên phiếu giao
# ------------------------------------------------------------------------------
println("[1] CHẠY VÍ DỤ 1:")
vd1_input = [-5, 2, -10, 0, 2]
vd1_expected = [-10, -5, 0, 2, 2]
println("  - Input:    ", vd1_input)
println("  - Expected: ", vd1_expected)
vd1_actual = radix_co_am(vd1_input; in_trung_gian=true)
println("  - Actual:   ", vd1_actual)
println("  - Trạng thái: ", (vd1_actual == vd1_expected ? "ĐẠT (PASS)" : "KHÔNG ĐẠT (FAIL)"))
println()

# ------------------------------------------------------------------------------
# 2. Chạy Ví dụ 2 trên phiếu giao
# ------------------------------------------------------------------------------
println("[2] CHẠY VÍ DỤ 2:")
vd2_input = [-3, -1, -2]
vd2_expected = [-3, -2, -1]
println("  - Input:    ", vd2_input)
println("  - Expected: ", vd2_expected)
vd2_actual = radix_co_am(vd2_input; in_trung_gian=true)
println("  - Actual:   ", vd2_actual)
println("  - Trạng thái: ", (vd2_actual == vd2_expected ? "ĐẠT (PASS)" : "KHÔNG ĐẠT (FAIL)"))
println()

# ------------------------------------------------------------------------------
# 3. Chạy ca kiểm thử input sai (Validator)
# ------------------------------------------------------------------------------
println("[3] CHẠY CA KIỂM TRA INPUT SAI (LOI01 - Phần tử vượt miền [-999999, 999999]):")
loi_input = [10, -20, 1000000]
println("  - Input: ", loi_input)
try
    radix_co_am(loi_input)
    println("  - Kết quả: Không phát hiện lỗi (FAIL)")
catch e
    println("  - Bắt lỗi thành công (PASS): ", e)
end
println()

println("="^70)
println("HOÀN THÀNH CHẠY THỰC THI DEMO CÁC VÍ DỤ CƠ BẢN.")
println("="^70)
