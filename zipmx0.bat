@echo on
for /D %%i in (*) DO (
rem 7-zip壓縮第一個變數為壓縮檔名，第二個為壓縮的資料夾
"C:\Program Files\7-Zip\7z.exe" a -tzip -mx0 "%%i" "%%i"
rem del /q "%%i"
move "%%i.zip" "%%i"
)
pause