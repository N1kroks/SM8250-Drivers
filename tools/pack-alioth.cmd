@echo off

mkdir ..\..\SM8250-Drivers-Release
del ..\..\SM8250-Drivers-Release\SM8250-Drivers-alioth.7z

echo @echo off > ..\OnlineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OnlineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OnlineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\alioth.xml >> ..\OnlineUpdater.cmd
echo pause >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo ^(NET FILE^|^|^(powershell -command Start-Process '%%0' -Verb runAs -ArgumentList '%%* '^&EXIT /B^)^)^>NUL 2^>^&1 >> ..\OfflineUpdater.cmd
echo pushd "%%~dp0" ^&^& cd %%~dp0 >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the colon!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo .\tools\DriverUpdater\%%PROCESSOR_ARCHITECTURE%%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\alioth.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd
echo pause >> ..\OfflineUpdater.cmd

echo apps\IPA > filelist_alioth.txt
echo CODE_OF_CONDUCT.md >> filelist_alioth.txt
echo components\ANYSOC\Changelog >> filelist_alioth.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_alioth.txt
echo components\QC8250\Device\DEVICE.SOC_QC8250.ALIOTH >> filelist_alioth.txt
echo components\QC8250\Device\DEVICE.SOC_QC8250.ALIOTH_MINIMAL >> filelist_alioth.txt
echo components\QC8250\Platform\PLATFORM.SOC_QC8250.BASE >> filelist_alioth.txt
echo components\QC8250\Platform\PLATFORM.SOC_QC8250.BASE_MINIMAL >> filelist_alioth.txt
echo definitions\Desktop\ARM64\Internal\alioth.xml >> filelist_alioth.txt
echo tools\DriverUpdater >> filelist_alioth.txt
echo OfflineUpdater.cmd >> filelist_alioth.txt
echo OnlineUpdater.cmd >> filelist_alioth.txt

cd ..
"%ProgramFiles%\7-zip\7z.exe" a -t7z ..\SM8250-Drivers-Release\SM8250-Drivers-alioth.7z @tools\filelist_alioth.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del filelist_alioth.txt