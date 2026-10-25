# ==============================================================================
# HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - CƠ SỞ TẠI TP. HỒ CHÍ MINH
# HỌC PHẦN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - Nhóm 03)
# ĐỀ TÀI DT018: Radix Sort cho mảng có số âm và số dương
# Sinh viên: Nguyễn Khoa Điền - MSSV: N24DCDT014 - Lớp: D24CQDT01-N
# Giảng viên hướng dẫn: ThS. Hồ Nhựt Minh
# ==============================================================================

from typing import List, Tuple

def kiem_tra_dau_vao(a: List[int]) -> bool:
    """
    Xác thực tính hợp lệ của dữ liệu đầu vào:
    - Kiểu dữ liệu: list các số nguyên.
    - Kích thước: 0 <= len(a) <= 5000.
    - Miền giá trị từng phần tử: -999999 <= a[i] <= 999999.
    Ném ngoại lệ ValueError kèm tiền tố LOI01 nếu vi phạm.
    """
    if not isinstance(a, list):
        raise TypeError("Lỗi LOI01: Đầu vào phải là danh sách (list) các số nguyên.")
    n = len(a)
    if n < 0 or n > 5000:
        raise ValueError(f"Lỗi LOI01: Kích thước mảng ({n}) vượt quá giới hạn [0, 5000].")
    for i, x in enumerate(a):
        if not isinstance(x, int):
            raise TypeError(f"Lỗi LOI01: Phần tử tại vị trí {i} không phải số nguyên.")
        if x < -999999 or x > 999999:
            raise ValueError(f"Lỗi LOI01: Phần tử tại vị trí {i} (giá trị {x}) nằm ngoài miền [-999999, 999999].")
    return True

def tach_hai_dau(a: List[int]) -> Tuple[List[int], List[int]]:
    """
    Tách mảng a thành hai nhóm:
    1. do_lon_am: Danh sách độ lớn |x| của các số âm (x < 0).
    2. khong_am: Danh sách các số không âm (x >= 0), bao gồm số 0.
    """
    do_lon_am = []
    khong_am = []
    for x in a:
        if x < 0:
            do_lon_am.append(abs(x))
        else:
            khong_am.append(x)
    return do_lon_am, khong_am

def radix_khong_am(arr: List[int]) -> List[int]:
    """
    Thuật toán Radix Sort LSD (Least Significant Digit) cho mảng các số không âm.
    Sử dụng Counting Sort ổn định theo từng hàng chữ số cơ số 10 (exp = 1, 10, 100, ...).
    Độ phức tạp thời gian: O(d * (n + 10)), bộ nhớ phụ: O(n + 10).
    """
    n = len(arr)
    if n <= 1:
        return list(arr)
    
    max_val = max(arr)
    if max_val == 0:
        return list(arr)
    
    curr = list(arr)
    exp = 1
    
    while max_val // exp > 0:
        count = [0] * 10
        output = [0] * n
        
        # 1. Đếm tần suất chữ số tại hàng exp
        for x in curr:
            digit = (x // exp) % 10
            count[digit] += 1
            
        # 2. Cộng dồn tần suất (prefix sum)
        for i in range(1, 10):
            count[i] += count[i - 1]
            
        # 3. Duyệt ngược từ cuối về đầu để đảm bảo tính ổn định (stable sort)
        for i in range(n - 1, -1, -1):
            x = curr[i]
            digit = (x // exp) % 10
            pos = count[digit] - 1
            output[pos] = x
            count[digit] -= 1
            
        curr = output
        exp *= 10
        
    return curr

def radix_co_am(a: List[int], in_trung_gian: bool = False) -> List[int]:
    """
    Thuật toán Radix Sort mở rộng cho mảng chứa cả số âm và số dương:
    1. Xác thực dữ liệu đầu vào bằng kiem_tra_dau_vao(a).
    2. Tách nhóm âm (lấy độ lớn |x|) và nhóm không âm.
    3. Sắp xếp độ lớn nhóm âm bằng radix_khong_am.
    4. ĐẢO NGƯỢC mảng độ lớn rồi ĐỔI DẤU thành âm:
       Số có độ lớn lớn hơn đứng trước -> giá trị đại số nhỏ hơn đứng trước -> dãy tăng dần.
    5. Sắp xếp nhóm không âm bằng radix_khong_am.
    6. Ghép hai mảng đã sắp: am_sorted + khong_am_sorted.
    """
    kiem_tra_dau_vao(a)
    n = len(a)
    if n <= 1:
        return list(a)
    
    do_lon_am, khong_am = tach_hai_dau(a)
    if in_trung_gian:
        print(f"  -> Tách nhóm:")
        print(f"     + Nhóm âm (độ lớn |x|): {do_lon_am}")
        print(f"     + Nhóm không âm:         {khong_am}")
        
    do_lon_am_sorted = radix_khong_am(do_lon_am)
    # Đảo ngược mảng độ lớn rồi đổi dấu
    am_sorted = [-x for x in reversed(do_lon_am_sorted)]
    
    khong_am_sorted = radix_khong_am(khong_am)
    if in_trung_gian:
        print(f"  -> Sau khi sắp xếp từng nhóm:")
        print(f"     + Nhóm âm sau sắp & đảo dấu: {am_sorted}")
        print(f"     + Nhóm không âm sau Radix:   {khong_am_sorted}")
        
    ket_qua = am_sorted + khong_am_sorted
    if in_trung_gian:
        print(f"  -> Kết quả ghép cuối cùng:       {ket_qua}")
        
    return ket_qua

def giai_bai(du_lieu: List[int], in_trung_gian: bool = False) -> List[int]:
    """Hàm điểm vào (entry point) chuẩn theo khung đồ án môn học."""
    return radix_co_am(du_lieu, in_trung_gian=in_trung_gian)
