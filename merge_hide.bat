@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
rem 依名稱做排序找資料夾名稱
for /f "tokens=*" %%a in ('dir /b /a:d /o:n "*"') DO (
cd %%a

rem 將圖片透過ffmpeg轉換成mp4
for %%i in (*.jpg,*.png,*.webp) DO (
set "j=%%i"
..\..\ff\ffmpeg.exe -i "%%i" -vcodec mpeg4 "!j:~0,-4%!1.mp4"
)

for %%i in (*1.mp4) DO (
set "l=%%i"
)

rem 將壓縮檔合併隱藏為影片
for %%i in (*.zip) DO (
set "k=%%i"
copy /b "!l!"+"%%i" "!k:~0,-4%!.mp4"
)
rem 刪除暫存資料夾與影片
del /q "!j:~0,-4%!1.mp4"

cd ..
)
pause
