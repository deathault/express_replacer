@echo off

set "config_file=C:\Program Files\Express\ExpressMeeting\ExpressMeeting.dll.config"
set "json_file=C:\Program Files\Express\ExpressMeeting\serilogSettings.json"
set "search1=http://mycompany:7100/api/"
set "replace1=сервер:порт/api/"
set "search2=http://mycompany:7100/api/log/json"
set "replace2=сервер:порт/api/log/json"

REM Заменяем строки в файле ExpressMeeting.dll.config
(
    for /f "usebackq tokens=* delims=" %%a in ("%config_file%") do (
        set "line=%%a"
        setlocal enabledelayedexpansion
        echo(!line:%search1%=%replace1%!
        endlocal
    )
) > "%temp%\ExpressMeeting.dll.config.tmp"
move /y "%temp%\ExpressMeeting.dll.config.tmp" "%config_file%"

REM Заменяем строки в файле serilogSettings.json
(
    for /f "usebackq tokens=* delims=" %%a in ("%json_file%") do (
        set "line=%%a"
        setlocal enabledelayedexpansion
        echo(!line:%search2%=%replace2%!
        endlocal
    )
) > "%temp%\serilogSettings.json.tmp"
move /y "%temp%\serilogSettings.json.tmp" "%json_file%"

echo Замена выполнена успешно.
pause
