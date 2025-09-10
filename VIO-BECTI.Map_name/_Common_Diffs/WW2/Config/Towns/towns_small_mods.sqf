_side = _this;
_sid = "";
_sid_base = "";
_tag = "";
_level = -1;

switch (_side) do {
	case west: {
		_sid_base = "VIOC_B_";_tag = "WEST_";
	};
	case east: {
		_sid_base = "VIOC_O_";_tag = "EAST_";
	};
	case resistance: {
		_sid_base = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid_base = "";};
};
//if !(("sab_nl_mutsuki") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************

INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
/*_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		};
	};
};
*/
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************

WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_DaimlerMk2")) then {
		if !(("FA_DaimlerMk2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_DaimlerMk2", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_T17E1", _sid],1];
		};
	};
};

if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64")) then {
		if !(("FA_BA64") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_LIGHT pushBack [format["%1FA_BA64", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_BA10M", _sid],1];
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64_Captured")) then {
		if !(("FA_BA64_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_LIGHT pushBack [format["%1FA_BA64_Captured", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_BA10M_Captured", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_Sdkfz231", _sid],1];
			WHEELED_HEAVY pushBack [format["%1FA_Sdkfz234_4", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			WHEELED_HEAVY pushBack [format["%1FA_Sdkfz234", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_ValentineMk3")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("FA_ValentineMk3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			TRACKED_HEAVY pushBack [format["%1FA_ValentineMk3", _sid],1];
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_M26")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("FA_M26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			TRACKED_HEAVY pushBack [format["%1FA_M26", _sid],1];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_BT_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("SOV_BT_BT7A") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			TRACKED_LIGHT pushBack [format["%1SOV_BT_BT7A", _sid],1];
			TRACKED_LIGHT pushBack [format["%1SOV_BT_BT7_M1937", _sid],1];
			TRACKED_LIGHT pushBack [format["%1SOV_BT_BT7TU_M1937", _sid],1];
		};
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26")) then {
		if !(("FA_T26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			TRACKED_LIGHT pushBack [format["%1FA_T26", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			TRACKED_HEAVY pushBack [format["%1FA_ValentineMk3_SOV", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			TRACKED_HEAVY pushBack [format["%1FA_KV1", _sid],1];
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26_Captured")) then {
		if !(("FA_T26_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			TRACKED_LIGHT pushBack [format["%1FA_T26_Captured", _sid],1];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			TRACKED_LIGHT pushBack [format["%1FA_Pz38t", _sid],1];
			TRACKED_LIGHT pushBack [format["%1FA_Panzer2", _sid],1];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_gladiator") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_gladiator", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_ca12bo", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_mb5", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_BOMBER append [[format["%1sab_meteor", _sid],1]];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_hurricane") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_hurricane", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_hurricane_trop", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_hurricane_2", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_BOMBER append [[format["%1sab_fl_dh98", _sid],1]];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_halifax") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_BOMBER append [[format["%1sab_sw_halifax", _sid],1]];
			};
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_p26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_p26", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_texan", _sid],1],[format["%1sab_avenger", _sid],1]];
			AIR_BOMBER append [[format["%1sab_dauntless", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_corsair", _sid],1]];
			AIR_BOMBER append [[format["%1sab_p38", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_mustang", _sid],1],[format["%1sab_a26", _sid],1]];
			AIR_BOMBER append [[format["%1sab_b25", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_tigercat", _sid],1],[format["%1sab_f6f", _sid],1]];
			AIR_BOMBER append [[format["%1sab_b24", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_p61", _sid],1]];
			AIR_BOMBER append [[format["%1sab_b17", _sid],1]];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_f4f") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_f4f", _sid],1]];
			AIR_BOMBER append [[format["%1sab_fl_sbd", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_f4u", _sid],1]];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_p51d", _sid],1]];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_p40") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_p40", _sid],1],[format["%1sab_sw_p38", _sid],1]];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_a26", _sid],1]];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_BOMBER append [[format["%1sab_sw_b17", _sid],1]];
			};
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_i16", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
			AIR_BOMBER append [[format["%1sab_p39", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_i16", _sid],1]];
			AIR_BOMBER append [[format["%1sab_p39", _sid],1],[format["%1sab_tusb2", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_la5", _sid],1],[format["%1sab_p39", _sid],1]];
			AIR_BOMBER append [[format["%1sab_tusb2", _sid],1],[format["%1sab_il2", _sid],1]];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_yak3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_yak3", _sid],1]];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_i16", _sid],1]];
			};
		
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_il2_2", _sid],1]];
				AIR_BOMBER append [[format["%1sab_sw_il2", _sid],1]];
			};
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_avia") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_avia", _sid],1]];
			AIR_BOMBER append [[format["%1sab_bu131", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ju87", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ju88", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_bf109", _sid],1],[format["%1sab_bf110", _sid],1],[format["%1sab_fw190", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fw190", _sid],1],[format["%1sab_ta152c", _sid],1],[format["%1sab_bf110", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fw190", _sid],1],[format["%1sab_me262", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ju88", _sid],1],[format["%1sab_he111", _sid],1]];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_bf109e") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_bf109e", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_bf109f", _sid],1]];
			AIR_BOMBER append [[format["%1sab_fl_ju88a", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_bf109g", _sid],1],[format["%1sab_fl_fw190a", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_bf109k", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_he162", _sid],1]];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_bf110") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_bf110", _sid],1]];
				AIR_FIGHTER append [[format["%1sab_sw_bf110_2", _sid],1]];
				AIR_BOMBER append [[format["%1sab_sw_ju87", _sid],1]];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_BOMBER append [[format["%1sab_sw_ju87_2", _sid],1]];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_FIGHTER append [[format["%1sab_sw_do335", _sid],1]];
				AIR_BOMBER append [[format["%1sab_sw_he177", _sid],1]];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				AIR_BOMBER append [[format["%1sab_sw_ar234", _sid],1]];
			};
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_m6a") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;

		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_m6a", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_a5m", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_aichival", _sid],1]];
			AIR_BOMBER append [[format["%1sab_kate", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_zero", _sid],1]];
			AIR_BOMBER append [[format["%1sab_ki61", _sid],1]];
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_ki100", _sid],1]];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_a6m") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
			
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			AIR_FIGHTER append [[format["%1sab_fl_a6m", _sid],1]];
		};
	};
};
if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];

//ANTI_AIR = INFANTRY;
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		ANTI_AIR = [[format["%1LIB_UK_M16_Halftrack", _sid],1],[format["%1LIB_UK_M16_Halftrack", _sid],1]];
	};
};*/
if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_small_mods.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
