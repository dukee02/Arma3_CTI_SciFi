_side = _this;
_sid = "";
_tag = "";

if(_side == west) then {
	//_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		//_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";


//Town infantry setup
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
if(CTI_CAMO_ACTIVATION == 1) then {
	switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		INFANTRY = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_AR_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Support_AMG_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Support_MG_F", _sid],1],[format["%1B_T_Support_MG_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1]];
		};
	case 2: {
		INFANTRY = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_AR_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Support_AMG_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Support_MG_F", _sid],1],[format["%1B_T_Support_MG_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_AAT_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_AT_F", _sid],1],[format["%1B_T_Soldier_AT_F", _sid],1]];
		};
	default {
		INFANTRY = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_AR_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_AR_F", _sid],1],[format["%1B_T_Soldier_AR_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_T_Medic_F", _sid],1],[format["%1B_T_Soldier_F", _sid],1],[format["%1B_T_Soldier_GL_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1],[format["%1B_T_Soldier_LAT_F", _sid],1]];
		};
	};
} else {
	switch (CTI_ECONOMY_LEVEL_INFANTRY) do {
	case 1: {
		INFANTRY = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_AR_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_support_AMG_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_support_MG_F", _sid],1],[format["%1B_support_MG_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1]];
		};
	case 2: {
		INFANTRY = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_AR_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_support_AMG_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_support_MG_F", _sid],1],[format["%1B_support_MG_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_soldier_AAT_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_AT_F", _sid],1],[format["%1B_soldier_AT_F", _sid],1]];
		};
	default {
		INFANTRY = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_AR_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1]];
		INFANTRY_MG = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_AR_F", _sid],1],[format["%1B_soldier_AR_F", _sid],1]];
		INFANTRY_AT = [[format["%1B_medic_F", _sid],1],[format["%1B_Soldier_F", _sid],1],[format["%1B_Soldier_GL_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1],[format["%1B_soldier_LAT_F", _sid],1]];
		};
	};
	
};
if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//Town Wheeled setup
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
if(CTI_CAMO_ACTIVATION == 1) then {
	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
			WHEELED_LIGHT = [[format["%1B_T_LSV_01_armed_F", _sid],1],[format["%1B_T_LSV_01_AT_F", _sid],1],[format["%1B_T_MRAP_01_hmg_F", _sid],1],[format["%1B_T_MRAP_01_gmg_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_T_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_T_APC_Wheeled_01_cannon_F", _sid],1]];
		};
	case 2: {
			WHEELED_LIGHT = [[format["%1B_T_LSV_01_armed_F", _sid],1],[format["%1B_T_LSV_01_AT_F", _sid],1],[format["%1B_T_MRAP_01_hmg_F", _sid],1],[format["%1B_T_MRAP_01_gmg_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_T_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_T_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_T_AFV_Wheeled_01_cannon_F", _sid],1],[format["%1B_T_AFV_Wheeled_01_up_cannon_F", _sid],1]];
		};
	default {
			WHEELED_LIGHT = [[format["%1B_T_LSV_01_armed_F", _sid],1],[format["%1B_T_LSV_01_AT_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_T_MRAP_01_hmg_F", _sid],1],[format["%1B_T_MRAP_01_gmg_F", _sid],1]];
		};
	};
} else {
	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
			WHEELED_LIGHT = [[format["%1B_LSV_01_armed_F", _sid],1],[format["%1B_LSV_01_AT_F", _sid],1],[format["%1B_MRAP_01_hmg_F", _sid],1],[format["%1B_MRAP_01_gmg_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_APC_Wheeled_01_cannon_F", _sid],1]];
		};
	case 2: {
			WHEELED_LIGHT = [[format["%1B_LSV_01_armed_F", _sid],1],[format["%1B_LSV_01_AT_F", _sid],1],[format["%1B_MRAP_01_hmg_F", _sid],1],[format["%1B_MRAP_01_gmg_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_APC_Wheeled_01_cannon_F", _sid],1],[format["%1B_AFV_Wheeled_01_cannon_F", _sid],1],[format["%1B_AFV_Wheeled_01_up_cannon_F", _sid],1]];
		};
	default {
			WHEELED_LIGHT = [[format["%1B_LSV_01_armed_F", _sid],1],[format["%1B_LSV_01_AT_F", _sid],1]];
			WHEELED_HEAVY = [[format["%1B_MRAP_01_hmg_F", _sid],1],[format["%1B_MRAP_01_gmg_F", _sid],1]];
		};
	};
};
if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Tracked setup
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
if(CTI_CAMO_ACTIVATION == 1) then {
	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1B_T_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_T_MBT_01_cannon_F", _sid],1],[format["%1B_T_MBT_01_cannon_F", _sid],1]];
		};
	case 2: {
		TRACKED_LIGHT = [[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_T_MBT_01_cannon_F", _sid],1],[format["%1B_T_MBT_01_cannon_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_T_MBT_01_TUSK_F", _sid],1],[format["%1B_T_MBT_01_TUSK_F", _sid],1]];
		};
	default {
		TRACKED_LIGHT = [[format["%1B_T_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_T_APC_Tracked_01_CRV_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_T_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_T_APC_Tracked_01_rcws_F", _sid],1]];
		};
	};
} else {
	switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		TRACKED_LIGHT = [[format["%1B_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_MBT_01_cannon_F", _sid],1],[format["%1B_MBT_01_cannon_F", _sid],1]];
		};
	case 2: {
		TRACKED_LIGHT = [[format["%1B_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_MBT_01_cannon_F", _sid],1],[format["%1B_MBT_01_cannon_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_MBT_01_TUSK_F", _sid],1],[format["%1B_MBT_01_TUSK_F", _sid],1]];
		};
	default {
		TRACKED_LIGHT = [[format["%1B_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_APC_Tracked_01_CRV_F", _sid],1]];
		TRACKED_MEDIUM = [[format["%1B_APC_Tracked_01_CRV_F", _sid],1],[format["%1B_APC_Tracked_01_rcws_F", _sid],1]];
		TRACKED_HEAVY = [[format["%1B_APC_Tracked_01_rcws_F", _sid],1],[format["%1B_APC_Tracked_01_rcws_F", _sid],1]];
		};
	};
};
if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};


//Town Air setup
AIR_FIGHTER = [];
AIR_BOMBER = [];
switch (CTI_ECONOMY_LEVEL_WHEELED) do {
	case 1: {
		AIR_FIGHTER = [[format["%1B_Heli_Light_01_dynamicLoadout_F", _sid],1]];
		AIR_BOMBER = [[format["%1B_Plane_CAS_01_dynamicLoadout_F", _sid],1]];
	};
	case 2: {
		AIR_FIGHTER = [[format["%1B_Heli_Light_01_dynamicLoadout_F", _sid],1],[format["%1B_Heli_Attack_01_dynamicLoadout_F", _sid],1],[format["%1B_Heli_Attack_01_dynamicLoadout_F", _sid],1]];
		AIR_BOMBER = [[format["%1B_Plane_CAS_01_dynamicLoadout_F", _sid],1],[format["%1B_Plane_Fighter_01_F", _sid],1]];
	};
	default {
		AIR_FIGHTER = [[format["%1B_Heli_Transport_01_F", _sid],1]];
		AIR_BOMBER = [[format["%1B_Heli_Transport_01_F", _sid],1]];
	};
};
if(count AIR_FIGHTER == 0) then {AIR_FIGHTER = +AIR_BOMBER;};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};



//Town Anti-Air setup
ANTI_AIR = [];
if(CTI_CAMO_ACTIVATION == 1) then {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1;
	case 2: {
			ANTI_AIR = [[format["%1B_T_APC_Tracked_01_AA_F", _sid],1],[format["%1B_T_APC_Tracked_01_AA_F", _sid],1]];
		};
	default {
		};
	};
} else {
	switch (CTI_ECONOMY_LEVEL_TRACKED) do {
	case 1;
	case 2: {
			ANTI_AIR = [[format["%1B_APC_Tracked_01_AA_F", _sid],1],[format["%1B_APC_Tracked_01_AA_F", _sid],1]];
		};
	default {
		};
	};
};
if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_west.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};