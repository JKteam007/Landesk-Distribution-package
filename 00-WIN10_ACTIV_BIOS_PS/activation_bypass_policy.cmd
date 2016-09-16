set dossieractiv=c:\activation
mkdir %DOSSIERACTIV%
copy activation.ps1 %DOSSIERACTIV%
Powershell.exe -ExecutionPolicy Bypass -File c:\activation\activation.ps1
rmdir %DOSSIERACTIV% /S /Q