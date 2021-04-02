@echo ----------------------------------------------
@echo "Очистка каталогов с файлами для упаковки"
@echo ----------------------------------------------

rmdir ".\ExeFiles\gog" /s /q
rmdir ".\ExeFiles\steam" /s /q
rmdir ".\UplinkOS_RUS_noexe" /s /q
md "ExeFiles\gog"
md "ExeFiles\steam"
md "UplinkOS_RUS_noexe"

@echo ----------------------------------------------
@echo "Копирование новых файлов в каталоги упаковки"
@echo ----------------------------------------------

xcopy /y /e "..\data" ".\UplinkOS_RUS_noexe\data\"
xcopy /y /e "..\music" ".\UplinkOS_RUS_noexe\music\"
xcopy /y /e "..\uplinkHD" ".\UplinkOS_RUS_noexe\uplinkHD\"
xcopy /y "..\UplinkOS_RUS.exe" ".\ExeFiles\gog\"
xcopy /y "..\gfw_high.ico" ".\UplinkOS_RUS_noexe\"
xcopy /y "..\UplinkOS_ReadMe.txt" ".\UplinkOS_RUS_noexe\"

@echo ----------------------------------------------
@echo "Подготовка к компиляции завершена"
@echo ----------------------------------------------