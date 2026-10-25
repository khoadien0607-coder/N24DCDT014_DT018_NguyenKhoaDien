# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# ==============================================================================

using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println("="^70)
println("BỘ KIỂM THỬ TỰ ĐỘNG BÁO CÁO TIẾN ĐỘ 1 - ĐỀ TÀI DT018")
println("="^70)

@testset "KIỂM THỬ ĐỀ TÀI DT018 - NGUYỄN KHOA ĐIỀN" begin

    # --- Nhóm 1: Hai ví dụ trên phiếu (A01, A02) ---
    @testset "TC01 (A01) - Ví dụ 1 trên phiếu" begin
        inp = [-5, 2, -10, 0, 2]
        exp = [-10, -5, 0, 2, 2]
        @test radix_co_am(inp) == exp
    end

    @testset "TC02 (A02) - Ví dụ 2 trên phiếu (Toàn âm)" begin
        inp = [-3, -1, -2]
        exp = [-3, -2, -1]
        @test radix_co_am(inp) == exp
    end

    # --- Nhóm 2: Hai ca tự thiết kế (A03, A04) ---
    @testset "TC03 (A03) - Ca tự thiết kế 1 (Nhiều chữ số âm dương)" begin
        inp = [15, -42, 0, 8, -7, 100, -99]
        exp = [-99, -42, -7, 0, 8, 15, 100]
        @test radix_co_am(inp) == exp
    end

    @testset "TC04 (A04) - Ca tự thiết kế 2 (Chạm cận biên miền số lớn)" begin
        inp = [999999, -999999, 123456, -654321, 0]
        exp = [-999999, -654321, 0, 123456, 999999]
        @test radix_co_am(inp) == exp
    end

    # --- Nhóm 3: Các ca biên trên phiếu & đặc biệt (A05, A06, A07) ---
    @testset "TC05 (A05 / Ca 3 phiếu) - Toàn số 0" begin
        inp = [0, 0]
        exp = [0, 0]
        @test radix_co_am(inp) == exp
    end

    @testset "TC06 (A06 / Ca 4 phiếu) - Khóa lặp âm dương" begin
        inp = [-1, -1, 1]
        exp = [-1, -1, 1]
        @test radix_co_am(inp) == exp
    end

    @testset "TC07 (A07a / Ca 5 phiếu) - Mảng rỗng" begin
        inp = Int[]
        exp = Int[]
        @test radix_co_am(inp) == exp
    end

    @testset "TC08 (A07b / Ca 5 phiếu) - Mảng 1 phần tử dương" begin
        inp = [5]
        exp = [5]
        @test radix_co_am(inp) == exp
    end

    @testset "TC09 (A07c) - Mảng 1 phần tử âm" begin
        inp = [-5]
        exp = [-5]
        @test radix_co_am(inp) == exp
    end

    # --- Nhóm 4: Các ca kiểm thử bổ sung cấu trúc đặc thù ---
    @testset "TC10 - Mảng giảm dần toàn âm" begin
        inp = [-10, -20, -30, -40]
        exp = [-40, -30, -20, -10]
        @test radix_co_am(inp) == exp
    end

    @testset "TC11 - Mảng tăng dần toàn dương" begin
        inp = [1, 2, 3, 4, 5]
        exp = [1, 2, 3, 4, 5]
        @test radix_co_am(inp) == exp
    end

    @testset "TC12 - Mảng đối xứng nhiều cặp khóa trùng" begin
        inp = [-500, 500, -500, 500, 0, 0]
        exp = [-500, -500, 0, 0, 500, 500]
        @test radix_co_am(inp) == exp
    end

    # --- Nhóm 5: Ca kiểm tra input sai qua validator (A08 / LOI01) ---
    @testset "TC13 (A08 / LOI01) - Phần tử vượt giới hạn trên [999999]" begin
        inp = [10, -20, 1000000]
        @test_throws ArgumentError radix_co_am(inp)
    end

    @testset "TC14 (LOI01) - Phần tử vượt giới hạn dưới [-999999]" begin
        inp = [-1000000, 0, 5]
        @test_throws ArgumentError radix_co_am(inp)
    end
end

println("="^70)
println("HOÀN TẤT TẤT CẢ 14 CA KIỂM THỬ: ĐẠT 100%!")
println("="^70)
