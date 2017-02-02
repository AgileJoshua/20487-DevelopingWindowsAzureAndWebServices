@Echo off

%~d0
cd %~dp0

powershell -NonInteractive -Command "Set-ExecutionPolicy unrestricted"

@Echo Configuring machine's certificates
certmgr.exe -del -c -n "Client" -s -r LocalMachine My > NUL
certmgr.exe -del -c -n "Server" -s -r LocalMachine My > NUL
certmgr.exe -del -c -n "Server" -s -r LocalMachine TrustedPeople > NUL
certmgr.exe -del -c -n "Blue Yonder Airlines Root CA" -s -r LocalMachine My > NUL
certmgr.exe -del -c -n "Blue Yonder Airlines Root CA" -s -r LocalMachine Root > NUL

certutil -f -p 1 -importpfx ..\..\..\certs\BlueYonderAirlinesRootCA.pfx > NUL
certutil -f -p 1 -importpfx ..\..\..\certs\client.pfx > NUL
certutil -f -p 1 -importpfx ..\..\..\certs\server.pfx > NUL
certutil -f -p 1 -importpfx ..\..\..\certs\cloudapp.pfx > NUL
certutil -f -p 1 -importpfx ..\..\..\certs\emulator.pfx > NUL
certutil -f -addstore trustedPeople ..\..\..\certs\server.cer > NUL

Powershell ..\..\..\tools\scripts\GrantCertsPermissions.ps1
Powershell ..\..\..\tools\scripts\VerifyIIS_SSL.ps1

@Echo Checking for missing Windows Azure components
Powershell .\BuildWindowsAzureComponents.ps1

Rem Configuring IIS
Call ..\..\..\tools\scripts\SetupIIS.cmd Mod07 > NUL

pause