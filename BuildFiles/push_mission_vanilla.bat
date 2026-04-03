@echo off
title VIO-BECTI.Altis Mission gets created

set "gitpath=D:\GitRep\Arma3_CTI_Work"
set "buildpath=D:\GitRep\Arma3_CTI"

set "mapname=Map_name"
set "missionfolder=VIO-BECTI.%mapname%"
echo aktuelle Mission wird erstellt unter: "%buildpath%\%missionfolder%"

echo copy Client folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Client" "%buildpath%\%missionfolder%\Client" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_Client_Diffs\Vanilla" "%buildpath%\%missionfolder%\Client" /E /Y /I

echo copy Common folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Common" "%buildpath%\%missionfolder%\Common" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_Common_Diffs\Vanilla" "%buildpath%\%missionfolder%\Common" /E /Y /I

echo copy Rsc files
xcopy "%gitpath%\VIO-BECTI.Map_name\Rsc" "%buildpath%\%missionfolder%\Rsc" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_RSC_Diffs\Vanilla" "%buildpath%\%missionfolder%\Rsc" /E /Y /I

echo copy Server folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Server" "%buildpath%\%missionfolder%\Server" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_Server_Diffs\Vanilla" "%buildpath%\%missionfolder%\Server" /E /Y /I

echo copy VAM folder
xcopy "%gitpath%\VIO-BECTI.Map_name\VAM_GUI" "%buildpath%\%missionfolder%\VAM_GUI" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_VAM_GUI_Diffs\Vanilla" "%buildpath%\%missionfolder%\VAM_GUI" /E /Y /I

echo copy main files
copy "%gitpath%\VIO-BECTI.Map_name\briefing.sqf" "%buildpath%\%missionfolder%\briefing.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\debug_diag.sqf" "%buildpath%\%missionfolder%\debug_diag.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\description.ext" "%buildpath%\%missionfolder%\description.ext" /y
copy "%gitpath%\VIO-BECTI.Map_name\init.sqf" "%buildpath%\%missionfolder%\init.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\WFpostprocess.sqf" "%buildpath%\%missionfolder%\WFpostprocess.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\stringtable.xml" "%buildpath%\%missionfolder%\stringtable.xml" /y
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\XMissions" "%buildpath%\%missionfolder%" /E /Y /I

::copy "%gitpath%\Thumbnails\Vanilla\VanillaCTI_%mapname%_small.jpg" "%buildpath%\%missionfolder%\VIO_BECTI.jpg" /y
