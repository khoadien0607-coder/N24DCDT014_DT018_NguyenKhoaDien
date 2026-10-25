@echo off
chcp 65001 > nul
echo ==============================================================================
echo   TU DONG DAY MA NGUON LEN GITHUB - DE TAI DT018 (NGUYEN KHOA DIEN)
echo ==============================================================================
echo.

set /p GITHUB_USER="Nhap ten tai khoan GitHub cua ban (Username): "

if "%GITHUB_USER%"=="" (
    echo [LOI] Ban chua nhap ten tai khoan GitHub!
    pause
    exit /b
)

set REPO_URL=https://github.com/%GITHUB_USER%/N24DCDT014_DT018_RadixSort.git

echo.
echo Dang kiem tra va lien ket voi GitHub repository:
echo %REPO_URL%
echo.

git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main

echo Dang day ma nguon len GitHub...
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo [CHUY Y] Neu bao loi:
    echo 1. Ban can vao trang https://github.com/new de tao repository ten:
    echo    N24DCDT014_DT018_RadixSort (chon Public)
    echo 2. Dang nhap tai khoan GitHub khi duoc yeu cau.
    echo.
) else (
    echo.
    echo ==============================================================================
    echo   DA DAY LEN GITHUB THANH CONG!
    echo ==============================================================================
    echo.
    for /f %%i in ('git rev-parse HEAD') do set SHA=%%i
    echo URL Repo: https://github.com/%GITHUB_USER%/N24DCDT014_DT018_RadixSort
    echo SHA C:    %SHA%
    echo Permalink thuat toan:
    echo https://github.com/%GITHUB_USER%/N24DCDT014_DT018_RadixSort/blob/%SHA%/src/DeTai.jl
    echo Permalink kiem thu:
    echo https://github.com/%GITHUB_USER%/N24DCDT014_DT018_RadixSort/blob/%SHA%/test/runtests.jl
    echo.
)

pause

