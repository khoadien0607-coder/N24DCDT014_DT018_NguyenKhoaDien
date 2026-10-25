# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# KỊCH BẢN CHẠY MINH CHỨNG 11 ẢNH A01 - A11
# ==============================================================================

include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

function in_tieu_de(ma_anh, hinh, tieu_de, muc_tieu)
    println("="^75)
    println("  [$ma_anh] - HÌNH $hinh: $tieu_de")
    println("  Mục tiêu: $muc_tieu")
    println("  Sinh viên: Nguyễn Khoa Điền | MSSV: N24DCDT014 | Lớp: D24CQDT01-N")
    println("="^75)
end

function chay_ca(ma_anh, hinh, ten_ca, input, expected, phan_tich)
    in_tieu_de(ma_anh, hinh, ten_ca, phan_tich)
    println("  [INPUT ĐẦY ĐỦ]    : ", input)
    println("  [KỲ VỌNG EXPECTED]: ", expected)
    println("-"^75)
    actual = radix_co_am(input; in_trung_gian=true)
    println("-"^75)
    println("  [THỰC TẾ ACTUAL]  : ", actual)
    pass = (actual == expected)
    println("  [ĐÁNH GIÁ]        : ", pass ? "===> PASS (KHỚP HOÀN TOÀN) <===" : "===> FAIL <===")
    println("="^75)
    println()
end

function chay_a01()
    chay_ca(
        "A01", "4.1", "VÍ DỤ 1 TRÊN PHIẾU GIAO ĐỀ TÀI",
        [-5, 2, -10, 0, 2],
        [-10, -5, 0, 2, 2],
        "Kiểm thử ví dụ 1 có đầy đủ số âm, số dương, số 0 và khóa lặp 2"
    )
end

function chay_a02()
    chay_ca(
        "A02", "4.2", "VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (TOÀN ÂM)",
        [-3, -1, -2],
        [-3, -2, -1],
        "Kiểm thử mảng toàn âm sắp xếp đúng theo thứ tự đại số thực"
    )
end

function chay_a03()
    chay_ca(
        "A03", "4.3", "CA TỰ THIẾT KẾ 1 - NHIỀU CHỮ SỐ ĐAN XEN",
        [15, -42, 0, 8, -7, 100, -99],
        [-99, -42, -7, 0, 8, 15, 100],
        "Kiểm thử mảng hỗn hợp âm dương có số chữ số khác nhau (1 chữ số đến 3 chữ số)"
    )
end

function chay_a04()
    chay_ca(
        "A04", "4.4", "CA TỰ THIẾT KẾ 2 - CẬN BIÊN MIỀN SỐ LỚN",
        [999999, -999999, 123456, -654321, 0],
        [-999999, -654321, 0, 123456, 999999],
        "Kiểm thử dữ liệu chạm cận biên tối đa miền hợp lệ [-999999, 999999]"
    )
end

function chay_a05()
    chay_ca(
        "A05", "4.5", "CA BIÊN 1 - TOÀN SỐ 0",
        [0, 0],
        [0, 0],
        "Kiểm thử tính đúng đắn khi mảng chỉ chứa các số 0 trùng lặp"
    )
end

function chay_a06()
    chay_ca(
        "A06", "4.6", "CA BIÊN 2 - KHÓA TRÙNG LẶP CẢ ÂM VÀ DƯƠNG",
        [-1, -1, 1],
        [-1, -1, 1],
        "Kiểm thử tính bảo toàn số lần xuất hiện của các phần tử trùng lặp"
    )
end

function chay_a07()
    in_tieu_de("A07", "4.7", "CA BIÊN 3 - MẢNG RỖNG VÀ MẢNG 1 PHẦN TỬ", "Kiểm thử các trường hợp cơ sở n=0 và n=1")
    # Ca 1: Mảng rỗng
    println("  --- 1. MẢNG RỖNG (n = 0) ---")
    inp1 = Int[]
    exp1 = Int[]
    println("  Input:    ", inp1)
    act1 = radix_co_am(inp1)
    println("  Actual:   ", act1)
    println("  Đánh giá: ", (act1 == exp1 ? "PASS" : "FAIL"))
    println()
    # Ca 2: Mảng 1 phần tử
    println("  --- 2. MẢNG 1 PHẦN TỬ (n = 1) ---")
    inp2 = [5]
    exp2 = [5]
    println("  Input:    ", inp2)
    act2 = radix_co_am(inp2)
    println("  Actual:   ", act2)
    println("  Đánh giá: ", (act2 == exp2 ? "PASS" : "FAIL"))
    println("="^75)
    println()
end

function chay_a08()
    in_tieu_de("A08", "4.8", "KIỂM TRA INPUT SAI (VALIDATOR LOI01)", "Từ chối phần tử vi phạm miền [-999999, 999999]")
    loi_input = [10, -20, 1000000]
    println("  [INPUT VI PHẠM BIÊN] : ", loi_input, " (1000000 > 999999)")
    println("  [KỲ VỌNG EXPECTED]   : Ném ngoại lệ ArgumentError kèm mã LOI01")
    println("-"^75)
    try
        radix_co_am(loi_input)
        println("  [THỰC TẾ ACTUAL]     : Không phát hiện lỗi (FAIL)")
    catch e
        println("  [THỰC TẾ ACTUAL]     : Đã bắt lỗi ngoại lệ thành công!")
        println("  [THÔNG BÁO TỪ HÀM]   : ", e)
        println("  [ĐÁNH GIÁ]           : ===> PASS (CHẶN ĐÚNG THEO HỢP ĐỒNG ĐỀ TÀI) <===")
    end
    println("="^75)
    println()
end

# ------------------------------------------------------------------------------
# Điều phối chạy theo tham số dòng lệnh
# ------------------------------------------------------------------------------
chon = length(ARGS) > 0 ? uppercase(ARGS[1]) : "ALL"

if chon == "A01"
    chay_a01()
elseif chon == "A02"
    chay_a02()
elseif chon == "A03"
    chay_a03()
elseif chon == "A04"
    chay_a04()
elseif chon == "A05"
    chay_a05()
elseif chon == "A06"
    chay_a06()
elseif chon == "A07"
    chay_a07()
elseif chon == "A08"
    chay_a08()
else
    chay_a01()
    chay_a02()
    chay_a03()
    chay_a04()
    chay_a05()
    chay_a06()
    chay_a07()
    chay_a08()
end
