@echo off
title VIO-BECTI-CW.Altis Mission gets created

set "gitpath=D:\GitRep\Arma3_CTI_Work"
::set "makepbopath=C:\Program Files (x86)\Mikero\DePboTools\bin"
::set "buildpath=C:\Users\sloew\Documents\Arma 3\mpmissions\VIO-BECTI-CW"
set "buildpath=C:\Users\sloew\Documents\Arma 3 - Other Profiles\dukee\mpmissions\VIO-BECTI-CW"

set "mapname=Altis"
set "missionfolder=VIO-BECTI-CW.%mapname%"
echo aktuelle Mission wird erstellt unter: "%buildpath%\%missionfolder%"

echo copy Client folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Client" "%buildpath%\%missionfolder%\Client" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_Client_Diffs\CW" "%buildpath%\%missionfolder%\Client" /E /Y /I

echo copy Common folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Common" "%buildpath%\%missionfolder%\Common" /E /Y /I
::different in each version
xcopy "%gitpath%\VIO-BECTI.Map_name\_Common_Diffs\CW" "%buildpath%\%missionfolder%\Common" /E /Y /I

echo copy Rsc files
xcopy "%gitpath%\VIO-BECTI.Map_name\Rsc" "%buildpath%\%missionfolder%\Rsc" /E /Y /I
::different in each version
copy "%gitpath%\VIO-BECTI.Map_name\_RSC_Diffs\CW\Game.hpp" "%buildpath%\%missionfolder%\Rsc\Game.hpp" /y
copy "%gitpath%\VIO-BECTI.Map_name\_RSC_Diffs\CW\Parameters_%mapname%.hpp" "%buildpath%\%missionfolder%\Rsc\Parameters.hpp" /y

echo copy Server folder
xcopy "%gitpath%\VIO-BECTI.Map_name\Server" "%buildpath%\%missionfolder%\Server" /E /Y /I
::different in each version
copy "%gitpath%\VIO-BECTI.Map_name\_Server_Diffs\CW\Functions\Server_StartUpgrade.sqf" "%buildpath%\%missionfolder%\Server\Functions\Server_StartUpgrade.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\_Server_Diffs\CW\Init\Init_Server.sqf" "%buildpath%\%missionfolder%\Server\Init\Init_Server.sqf" /y

echo copy VAM folder
xcopy "%gitpath%\VIO-BECTI.Map_name\VAM_GUI" "%buildpath%\%missionfolder%\VAM_GUI" /E /Y /I
copy "%gitpath%\VIO-BECTI.Map_name\_VAM_GUI_Diffs\CW\VAM_GUI_init.sqf" "%buildpath%\%missionfolder%\VAM_GUI\VAM_GUI_init.sqf" /y

echo copy main files
copy "%gitpath%\VIO-BECTI.Map_name\briefing.sqf" "%buildpath%\%missionfolder%\briefing.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\debug_diag.sqf" "%buildpath%\%missionfolder%\debug_diag.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\description.ext" "%buildpath%\%missionfolder%\description.ext" /y
copy "%gitpath%\VIO-BECTI.Map_name\init.sqf" "%buildpath%\%missionfolder%\init.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\WFpostprocess.sqf" "%buildpath%\%missionfolder%\WFpostprocess.sqf" /y
copy "%gitpath%\VIO-BECTI.Map_name\stringtable.xml" "%buildpath%\%missionfolder%\stringtable.xml" /y
::different in each version
copy "%gitpath%\VIO-BECTI.Map_name\XMissions_CW\mission_%mapname%.sqm" "%buildpath%\%missionfolder%\mission.sqm" /y
copy "%gitpath%\Thumbnails\CW\CW_BECTI_%mapname%_small.jpg" "%buildpath%\%missionfolder%\VIO_BECTI.jpg" /y

::start "%makepbopath%\MakePbo.exe" "%buildpath%\%missionfolder%"

::PAUSE
