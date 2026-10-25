# 1. Khai báo và truy xuất phần tử mảng
arr = [10, 20, 30, 40, 50]
println("Mảng ban đầu: ", arr)
println("Phần tử đầu tiên: ", arr[1])
println("Phần tử thứ 3: ", arr[3])
println("Độ dài mảng: ", length(arr))

# 2. Thao tác Push và Pop trên mảng
list = Int[]
push!(list, 15)
push!(list, 25)
push!(list, 35)
println("Mảng sau khi push: ", list)

val = pop!(list)
println("Phần tử lấy ra (pop): ", val)
println("Mảng còn lại: ", list)

# 3. Thuật toán tìm kiếm tuyến tính
function linear_search(arr, target)
    for i in 1:length(arr)
        if arr[i] == target
            return i # Trả về chỉ số
        end
    end
    return -1
end

data = [4, 2, 9, 7, 5, 1]
key = 7
pos = linear_search(data, key)
println("Vị trí của ", key, " trong mảng là: ", pos)

# 4. Thuật toán tìm kiếm nhị phân
function binary_search(arr, target)
    low, high = 1, length(arr)
    while low <= high
        mid = (low + high) ÷ 2
        if arr[mid] == target
            return mid
        elseif arr[mid] < target
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return -1
end

sorted_arr = [11, 22, 33, 44, 55, 66, 77]
println("Vị trí số 44: ", binary_search(sorted_arr, 44))

# 5. Thuật toán Sắp xếp nổi bột
function bubble_sort!(arr)
    n = length(arr)
    for i in 1:n-1
        for j in 1:n-i
            if arr[j] > arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
            end
        end
    end
    return arr
end

nums = [64, 34, 25, 12, 22, 11, 90]
println("Mảng chưa sắp xếp: ", nums)
bubble_sort!(nums)
println("Mảng đã sắp xếp: ", nums)

# 6. Thuật toán Sắp xếp chèn
function insertion_sort!(arr)
    for i in 2:length(arr)
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end

arr = [12, 11, 13, 5, 6]
println("Mảng đã chèn sắp xếp: ", insertion_sort!(arr))

# 7. Mô phỏng Ngăn xếp (Stack - LIFO)
struct Stack{T}
    items::Vector{T}
end
Stack{T}() where T = Stack(T[])

push_stack!(s::Stack, val) = push!(s.items, val)
pop_stack!(s::Stack) = pop!(s.items)
is_empty(s::Stack) = isempty(s.items)

st = Stack{Int}()
push_stack!(st, 100)
push_stack!(st, 200)
println("Lấy từ Stack: ", pop_stack!(st))
# 8. Mô phỏng Hàng đợi (Queue - FIFO)
struct Queue{T}
    items::Vector{T}
end
Queue{T}() where T = Queue(T[])

enqueue!(q::Queue, val) = push!(q.items, val)
dequeue!(q::Queue) = popfirst!(q.items)

q = Queue{String}()
enqueue!(q, "Tác vụ A")
enqueue!(q, "Tác vụ B")
println("Đang xử lý: ", dequeue!(q))
println("Hàng đợi còn lại: ", q.items)

# 9. Tính giai thừa bằng Đệ quy
function factorial(n::Int)
    if n <= 1
        return 1
    else
        return n * factorial(n - 1)
    end
end

n = 6
println("Giai thừa của ", n, " là: ", factorial(n))
# 10. Duyệt và tính tổng các phần tử trong danh sách
function sum_elements(arr)
    total = 0
    for val in arr
        total += val
    end
    return total
end

data = [5, 10, 15, 20, 25]
println("Danh sách: ", data)
println("Tổng giá trị các phần tử: ", sum_elements(data))

# 11. Đơn vị kiểm thử (Unit Test) cho đề tài
using Test

function is_palindrome(str::String)
    return str == reverse(str)
end 

@testset "Kiểm thử chuỗi Palindrome" begin
    @test is_palindrome("radar") == true
    @test is_palindrome("julia") == false
    @test is_palindrome("madam") == true
end
println("Tất cả các test case đều vượt qua thành công!")
