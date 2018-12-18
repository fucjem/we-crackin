@echo off
 
IF EXIST "%PROGRAMFILES(X86)%" (GOTO SIXFOUR) ELSE (GOTO EIGHTSIX)

:EIGHTSIX
@For /F "tokens=15 delims= " %%B in ('IPConfig /ALL ^| Find /I "IP Address"') Do Set IP=%%B
@For /F "tokens=12 delims= " %%C in ('IPConfig /ALL ^| Find /I "Physical Address"') Do Set MAC=%%C

echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% - %MAC% >> \\E0504SFS03\vol1\LOG\CMPTR\%COMPUTERNAME%.log
echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% - %MAC% >> \\E0504SFS03\vol1\LOG\USER\%USERNAME%.log
echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% - %MAC% >> \\E0504SFS03\vol1\LOG\IP\%IP%.log
echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% - %MAC% >> \\E0504SFS03\vol1\LOG\MAC\%MAC%.log

goto end

:SIXFOUR


@for /F "tokens=14" %%i in ('"ipconfig | findstr IPv4"') do SET IP=%%i

echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% >> \\E0504SFS03\vol1\LOG\CMPTR\%COMPUTERNAME%.log
echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% >> \\E0504SFS03\vol1\LOG\USER\%USERNAME%.log
echo %Date% %TIME% %USERNAME% %IP% - %COMPUTERNAME% >> \\E0504SFS03\vol1\LOG\IP\%IP%.log

:end
exit

