@Echo off
set ProjectPath="D:\Allfiles"
set Platform=
IF NOT "%1"=="" set ProjectPath=%1%
echo Installing from %ProjectPath%

set EnableNuGetPackageRestore=True
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool DefaultAppPool /startMode:AlwaysRunning /processModel.LoadUserProfile:true

%ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\.nuget\nuget.exe restore %ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Companion.sln
%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe %ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Companion.sln /v:q /nologo /m

"%systemroot%\system32\inetsrv\AppCmd.exe" delete app "Default Web Site/BlueYonder.Companion.Host"
"%systemroot%\system32\inetsrv\AppCmd.exe" add app /site.name:"Default Web Site" /path:/BlueYonder.Companion.Host /physicalPath:"%ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Companion.Host"
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/BlueYonder.Companion.Host" /preloadEnabled:true

%ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\.nuget\nuget.exe restore %ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Server.sln
%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe %ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Server.sln /v:q /nologo /m

"%systemroot%\system32\inetsrv\AppCmd.exe" delete app "Default Web Site/BlueYonder.Server.Booking.WebHost"
"%systemroot%\system32\inetsrv\AppCmd.exe" delete app "Default Web Site/BlueYonder.Server.FrequentFlyer.WebHost"

"%systemroot%\system32\inetsrv\AppCmd.exe" add app /site.name:"Default Web Site" /path:/BlueYonder.Server.Booking.WebHost /physicalPath:"%ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Server.Booking.WebHost"
"%systemroot%\system32\inetsrv\AppCmd.exe" add app /site.name:"Default Web Site" /path:/BlueYonder.Server.FrequentFlyer.WebHost /physicalPath:"%ProjectPath%\Mod01\DemoFiles\BlueYonderDemo\BlueYonder.Companion.Server\BlueYonder.Server.FrequentFlyer.WebHost"

"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/BlueYonder.Server.Booking.WebHost" /enabledProtocols:http,net.tcp
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/BlueYonder.Server.FrequentFlyer.WebHost" /enabledProtocols:http,net.tcp

"%systemroot%\system32\inetsrv\AppCmd.exe" recycle apppool defaultapppool