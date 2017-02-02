@Echo off

%~d0
cd %~dp0

@Echo Configuring machine's certificates
certmgr.exe -del -c -n "SEA-DEV12-A" -s -r LocalMachine My > NUL
certmgr.exe -del -c -n "Blue Yonder Airlines Root CA" -s -r LocalMachine My > NUL
certmgr.exe -del -c -n "Blue Yonder Airlines Root CA" -s -r LocalMachine Root > NUL

certutil -f -p 1 -importpfx ..\..\..\certs\BlueYonderAirlinesRootCA.pfx > NUL
makecert.exe -n "CN=SEA-DEV12-A" -pe -ss my -sr LocalMachine -sky exchange -in "Blue Yonder Airlines Root CA" -is my -ir LocalMachine SSL.cer
certutil -privatekey -exportpfx -p 1 "SEA-DEV12-A" SSL.pfx > NUL
certutil -f -addstore root SSL.cer > NUL

pause