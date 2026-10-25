@echo off
chcp 65001 > nul
:MENU
cls
echo ==============================================================================
echo   CONG CU HO TRO CHUP 11 ANH MINH CHUNG (A01 - A11)
echo   De tai DT018: Radix Sort cho mang co so am va so duong
echo   Sinh vien: Nguyen Khoa Dien - MSSV: N24DCDT014
echo ==============================================================================
echo.
echo   [1] A01 (Hinh 4.1): Vi du 1 tren phieu [-5, 2, -10, 0, 2]
echo   [2] A02 (Hinh 4.2): Vi du 2 tren phieu mang toan am [-3, -1, -2]
echo   [3] A03 (Hinh 4.3): Ca tu thiet ke 1 (nhieu chu so dan xen)
echo   [4] A04 (Hinh 4.4): Ca tu thiet ke 2 (cham can mien gia tri)
echo   [5] A05 (Hinh 4.5): Ca bien 1 (toan so 0)
echo   [6] A06 (Hinh 4.6): Ca bien 2 (khoa trung lap am va duong)
echo   [7] A07 (Hinh 4.7): Ca bien 3 (mang rong va mang 1 phan tu)
echo   [8] A08 (Hinh 4.8): Kiem tra input sai (Validator LOI01)
echo   [9] A09 (Hinh 4.9): Chay tong ket toan bo bo kiem thu (runtests.jl)
echo   [10] A10 (Hinh 4.10): Lenh va huong dan clone sach kiem tra lai
echo   [11] A11 (Hinh 4.11): Huong dan chup giao dien web GitHub
echo   [0] Chay lien tuc toan bo tu A01 den A08
echo   [Q] Thoat
echo ==============================================================================
set /p CHON="Moi ban chon so [0-11] hoac Q de thoat: "

if /i "%CHON%"=="Q" exit /b
if "%CHON%"=="1" goto CHAY_A01
if "%CHON%"=="2" goto CHAY_A02
if "%CHON%"=="3" goto CHAY_A03
if "%CHON%"=="4" goto CHAY_A04
if "%CHON%"=="5" goto CHAY_A05
if "%CHON%"=="6" goto CHAY_A06
if "%CHON%"=="7" goto CHAY_A07
if "%CHON%"=="8" goto CHAY_A08
if "%CHON%"=="9" goto CHAY_A09
if "%CHON%"=="10" goto CHAY_A10
if "%CHON%"=="11" goto CHAY_A11
if "%CHON%"=="0" goto CHAY_ALL
goto MENU

:CHAY_A01
cls
julia scripts\chup_11_anh.jl A01
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\01_vi_du_1.png
echo.
pause
goto MENU

:CHAY_A02
cls
julia scripts\chup_11_anh.jl A02
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\02_vi_du_2.png
echo.
pause
goto MENU

:CHAY_A03
cls
julia scripts\chup_11_anh.jl A03
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\03_tu_thiet_ke_1.png
echo.
pause
goto MENU

:CHAY_A04
cls
julia scripts\chup_11_anh.jl A04
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\04_tu_thiet_ke_2.png
echo.
pause
goto MENU

:CHAY_A05
cls
julia scripts\chup_11_anh.jl A05
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\05_bien_1.png
echo.
pause
goto MENU

:CHAY_A06
cls
julia scripts\chup_11_anh.jl A06
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\06_bien_2.png
echo.
pause
goto MENU

:CHAY_A07
cls
julia scripts\chup_11_anh.jl A07
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\07_bien_3.png
echo.
pause
goto MENU

:CHAY_A08
cls
julia scripts\chup_11_anh.jl A08
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\08_input_khong_hop_le.png
echo.
pause
goto MENU

:CHAY_A09
cls
echo ==============================================================================
echo   [A09] - HINH 4.9: TONG KET BO KIEM THU TU DONG 14 CA TEST
echo ==============================================================================
julia test\runtests.jl
echo.
echo -> Nhan Win + Shift + S de chup man hinh va luu thanh docs\anh_ket_qua\09_tong_ket_kiem_thu.png
echo.
pause
goto MENU

:CHAY_A10
cls
echo ==============================================================================
echo   [A10] - HINH 4.10: CLONE SACH VA CHAY LAI TU GITHUB
echo ==============================================================================
echo Chay cac lenh sau tai mot cua so PowerShell moi ngoai thu muc:
echo.
echo   git clone https://github.com/TEN_GITHUB_CUA_BAN/N24DCDT014_DT018_RadixSort.git kiem_tra_clone
echo   cd kiem_tra_clone
echo   git rev-parse HEAD
echo   julia demo.jl
echo   julia test\runtests.jl
echo.
echo -> Chup man hinh cua so chay cac lenh tren luu thanh docs\anh_ket_qua\10_clone_sach_chay_lai.png
echo.
pause
goto MENU

:CHAY_A11
cls
echo ==============================================================================
echo   [A11] - HINH 4.11: TRANG WEB REPO VA COMMIT GITHUB THAT CUA SINH VIEN
echo ==============================================================================
echo Mo trinh duyet truy cap trang repo GitHub cua ban:
echo   https://github.com/TEN_GITHUB_CUA_BAN/N24DCDT014_DT018_RadixSort
echo.
echo Kiem tra giao dien tren web hien thi ro:
echo - Ten tai khoan cua ban
echo - Ten repo: N24DCDT014_DT018_RadixSort
echo - Commit C: cdd734f (hoac commit moi nhat)
echo - Cac thu muc src, test, demo.jl, README.md
echo.
echo -> Nhan Win + Shift + S chup man hinh trinh duyet luu thanh docs\anh_ket_qua\11_github_repo_commit.png
echo.
pause
goto MENU

:CHAY_ALL
cls
julia scripts\chup_11_anh.jl ALL
echo.
pause
goto MENU
