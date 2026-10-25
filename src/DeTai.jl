# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# Giảng viên hướng dẫn: Hồ Nhựt Minh
# ==============================================================================

module DeTai

export kiem_tra_dau_vao, tach_hai_dau, radix_khong_am, radix_co_am, giai_bai

"""
    kiem_tra_dau_vao(a)

Xác thực tính hợp lệ của dữ liệu đầu vào theo đúng hợp đồng trong phiếu giao đề tài:
- Kiểu dữ liệu: mảng các số nguyên `Vector{Int}`.
- Giới hạn kích thước mảng: 0 <= length(a) <= 5000.
- Giới hạn từng phần tử: -999999 <= a[i] <= 999999.

Ném ngoại lệ `ArgumentError` kèm thông báo chi tiết nếu vi phạm. Trả về `true` nếu hợp lệ.
"""
function kiem_tra_dau_vao(a)
    if !(a isa AbstractVector{<:Integer})
        throw(ArgumentError("Lỗi LOI01: Dau vao phai la mang mot chieu cac so nguyen."))
    end
    n = length(a)
    if n < 0 || n > 5000
        throw(ArgumentError("Lỗi LOI01: Kich thuoc mang ($n) vuot qua gioi han [0, 5000]."))
    end
    for (i, x) in enumerate(a)
        if x < -999999 || x > 999999
            throw(ArgumentError("Lỗi LOI01: Phan tu tai vi tri $i (gia tri $x) nam ngoai mien [-999999, 999999]."))
        end
    end
    return true
end

"""
    tach_hai_dau(a::AbstractVector{<:Integer})

Tách mảng `a` thành hai nhóm:
1. `do_lon_am`: Mảng chứa độ lớn (trị tuyệt đối) của các phần tử mang giá trị âm (< 0).
2. `khong_am`: Mảng chứa các phần tử không âm (>= 0), bao gồm cả số 0.

Trả về tuple `(do_lon_am, khong_am)`.
"""
function tach_hai_dau(a::AbstractVector{<:Integer})
    do_lon_am = Int[]
    khong_am = Int[]
    for x in a
        if x < 0
            push!(do_lon_am, abs(x))
        else
            push!(khong_am, x)
        end
    end
    return (do_lon_am, khong_am)
end

"""
    radix_khong_am(arr::AbstractVector{<:Integer})

Cài đặt thuật toán Radix Sort LSD (Least Significant Digit) cho mảng các số không âm.
Sử dụng Counting Sort ổn định (stable counting sort) duyệt từ cuối mảng về đầu cho từng hàng chữ số (cơ số 10).

Độ phức tạp: O(d * (n + 10)), bộ nhớ phụ O(n + 10).
"""
function radix_khong_am(arr::AbstractVector{<:Integer})
    n = length(arr)
    if n <= 1
        return copy(arr)
    end

    max_val = maximum(arr)
    if max_val == 0
        return copy(arr)
    end

    # Sao chép mảng để không làm biến đổi mảng gốc tại chỗ
    curr = copy(arr)
    exp = 1

    while div(max_val, exp) > 0
        # Mảng đếm tần suất cho 10 chữ số (0..9). Julia đánh chỉ số từ 1..10.
        count = zeros(Int, 10)
        output = similar(curr)

        # 1. Đếm tần suất chữ số tại hàng `exp`
        for x in curr
            digit = mod(div(x, exp), 10)
            count[digit + 1] += 1
        end

        # 2. Cộng dồn tần suất (prefix sum) để xác định vị trí biên của mỗi chữ số
        for i in 2:10
            count[i] += count[i - 1]
        end

        # 3. Duyệt ngược từ cuối về đầu để bảo đảm tính ổn định (stable sort)
        for i in n:-1:1
            x = curr[i]
            digit = mod(div(x, exp), 10)
            pos = count[digit + 1]
            output[pos] = x
            count[digit + 1] -= 1
        end

        curr = output
        exp *= 10
    end

    return curr
end

"""
    radix_co_am(a::AbstractVector{<:Integer}; in_trung_gian::Bool=false)

Thuật toán Radix Sort mở rộng cho mảng chứa cả số âm và số dương:
1. Xác thực dữ liệu vào bằng `kiem_tra_dau_vao(a)`.
2. Tách mảng thành `do_lon_am` và `khong_am`.
3. Sắp xếp độ lớn nhóm âm bằng `radix_khong_am`.
4. ĐẢO NGƯỢC mảng độ lớn nhóm âm rồi ĐỔI DẤU thành âm:
   Vì độ lớn càng lớn thì giá trị đại số thực tế càng nhỏ (ví dụ: | -10 | > | -5 | nhưng -10 < -5).
5. Sắp xếp nhóm không âm bằng `radix_khong_am`.
6. Ghép hai mảng đã sắp: `vcat(am_sorted, khong_am_sorted)`.
"""
function radix_co_am(a::AbstractVector{<:Integer}; in_trung_gian::Bool=false)
    kiem_tra_dau_vao(a)

    n = length(a)
    if n <= 1
        return copy(a)
    end

    # Bước 1: Tách nhóm
    (do_lon_am, khong_am) = tach_hai_dau(a)

    if in_trung_gian
        println("  -> Tách nhóm:")
        println("     + Nhóm âm (độ lớn |x|): ", do_lon_am)
        println("     + Nhóm không âm:         ", khong_am)
    end

    # Bước 2: Sắp xếp độ lớn nhóm âm bằng Radix Sort không âm
    do_lon_am_sorted = radix_khong_am(do_lon_am)

    # Bước 3: Đảo ngược mảng độ lớn rồi đổi dấu sang âm
    # Lưu ý: đảo ngược giúp số có độ lớn lớn hơn đứng trước (giá trị đại số nhỏ hơn đứng trước)
    am_sorted = [-x for x in reverse(do_lon_am_sorted)]

    # Bước 4: Sắp xếp nhóm không âm bằng Radix Sort không âm
    khong_am_sorted = radix_khong_am(khong_am)

    if in_trung_gian
        println("  -> Sau khi sắp xếp từng nhóm:")
        println("     + Nhóm âm sau sắp & đảo dấu: ", am_sorted)
        println("     + Nhóm không âm sau Radix:   ", khong_am_sorted)
    end

    # Bước 5: Ghép hai nhóm
    ket_qua = vcat(am_sorted, khong_am_sorted)

    if in_trung_gian
        println("  -> Kết quả ghép cuối cùng:       ", ket_qua)
    end

    return ket_qua
end

"""
    giai_bai(du_lieu; in_trung_gian::Bool=false)

Hàm điểm vào (entry point) chuẩn theo khung mẫu của môn học, gọi trực tiếp `radix_co_am`.
"""
function giai_bai(du_lieu; in_trung_gian::Bool=false)
    return radix_co_am(du_lieu; in_trung_gian=in_trung_gian)
end

end # module DeTai
