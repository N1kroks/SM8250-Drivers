@echo off

mkdir ..\..\SM8250-Drivers-Release
del ..\..\SM8250-Drivers-Release\SM8250-Drivers-Full.zip

mkdir SM8250-Drivers-Full
mkdir SM8250-Drivers-Full\components
mkdir SM8250-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC SM8250-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC8250 SM8250-Drivers-Full\components\QC8250
xcopy /cheriky ..\definitions\Desktop SM8250-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -t7z -r ..\..\SM8250-Drivers-Release\SM8250-Drivers-Full.7z SM8250-Drivers-Full\*

rmdir /Q /S SM8250-Drivers-Full