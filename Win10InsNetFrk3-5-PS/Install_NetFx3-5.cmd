set dossiersources=c:\sources\sxs

mkdir %DOSSIERSOURCES%

xcopy sources %DOSSIERSOURCES% /E

Powershell.exe -ExecutionPolicy Bypass -File %DOSSIERSOURCES%\inst-net-fx3-5.ps1

rmdir c:\sources /S /Q
