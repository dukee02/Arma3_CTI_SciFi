private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		// cti_dialog_ui_purchasemenu_action
		_get = call CTI_UI_Purchase_GetFirstAvailableFactories;
		_factory = _get select 0;
		_factory_index = _get select 1;
		_factory_type = _get select 2;
		
		if (isNull _factory) exitWith { closeDialog 0; };
		// if (count _factories == 0) exitWith {  }; //debug
		
		{if (isNil {uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x]}) then {uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x], true]}} forEach ['driver','gunner','commander','turrets','camo','lock'];
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_unitcost", 90000]; //--- Muhahahah!
		
		call CTI_UI_Purchase_SetVehicleIconsColor;
		(_factory_index) call CTI_UI_Purchase_SetIcons;
		(_factory_type) call CTI_UI_Purchase_FillUnitsList;
		call CTI_UI_Purchase_OnUnitListLoad;
		
		(_factory_type) call CTI_UI_Purchase_LoadFactories;
		
		_ctrSalvager = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016);
		if (_factory_type != CTI_REPAIR || !(call CTI_CL_FNC_IsPlayerCommander)) then {_ctrSalvager ctrlShow false};
		_ctrSalvager ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.535), SafeZoneY + (SafeZoneH * 0.825), SafeZoneW * 0.275, SafeZoneH * 0.04]; 
		_textSalvager = format["Buy Independent Salvager (%1/%2) $%3", count(CTI_P_SideLogic getVariable "cti_salvagers"), CTI_VEHICLES_SALVAGE_INDEPENDENT_MAX, CTI_VEHICLES_SALVAGER_PRICE];
		_ctrSalvager ctrlSetText _textSalvager;
		_ctrSalvager ctrlCommit 0;
		
		_groups = [group player];
		if (call CTI_CL_FNC_IsPlayerCommander) then {
			_groups = if (missionNamespace getVariable "CTI_AI_TEAMS_ENABLED" > 0) then {(CTI_P_SideJoined) call CTI_CO_FNC_GetSideGroups} else {(CTI_P_SideJoined) call CTI_CO_FNC_GetSidePlayerGroups};
			{
				_header_ai = if (isPlayer leader _x) then {""} else {"[AI] "};
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbAdd format ["%1%2 (%3)", _header_ai, _x getVariable ["cti_alias", CTI_PLAYER_DEFAULT_ALIAS], name leader _x];
				if (leader _x == player) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbSetCurSel _forEachIndex};
			} forEach (_groups);
		} else {
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbAdd format ["%1 (%2)", group player, name player];
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbSetCurSel 0;
		};
		
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_team", group player];
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_teams", _groups];
		
		execVM "Client\GUI\GUI_PurchaseMenu.sqf";
	};
	case "onUnitsLBSelChanged": {
		_changedTo = _this select 1;
		
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [_changedTo, 0];
		(_classname) call CTI_UI_Purchase_UpdateVehicleIcons;
	};
	case "onGroupLBSelChanged": {
		_changedTo = _this select 1;
		if((count (uiNamespace getVariable "cti_dialog_ui_purchasemenu_teams")) >= _changedTo) then {
			uiNamespace setVariable ["cti_dialog_ui_purchasemenu_team", (uiNamespace getVariable "cti_dialog_ui_purchasemenu_teams") select _changedTo];
		};
	};
	case "onFactoryLBSelChanged": {
		_changedTo = _this select 1;

		_factory = (uiNamespace getVariable "cti_dialog_ui_purchasemenu_factories") select _changedTo;
		if (alive _factory) then {
			[_factory, 2, .175] call CTI_UI_Purchase_CenterMap;
			uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory", _factory];
		} else {
			if ({alive _x} count (uiNamespace getVariable "cti_dialog_ui_purchasemenu_factories") > 0) then {
				(uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory_type") call CTI_UI_Purchase_LoadFactories;//reload.
			} else {
				['onLoad'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'
			};
		};
	};
	case "onCamoLBSelChanged": {
		_changedTo = _this select 1;
		
		_textureName = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) lbText _changedTo;
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [lnbCurSelRow 111007, 0];
		uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehcamo_%1", _classname], _textureName];
	};
	case "onIconSet": {
		_factory_index = _this select 1;
		_factory_type = _this select 2;
		_available = [CTI_Base_BarracksInRange, CTI_Base_LightInRange, CTI_Base_HeavyInRange, CTI_Base_AirInRange, CTI_Base_RepairInRange, CTI_Base_AmmoInRange, CTI_Base_NavalInRange, CTI_Town_DepotInRange];
		
		if (_available select _factory_index) then {
			(_factory_index) call CTI_UI_Purchase_SetIcons;
			(_factory_type) call CTI_UI_Purchase_FillUnitsList;
			call CTI_UI_Purchase_OnUnitListLoad;
			 
			(_factory_type) call CTI_UI_Purchase_LoadFactories;
			
			if (call CTI_CL_FNC_IsPlayerCommander) then {
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlShow (if (_factory_type == CTI_REPAIR) then {true} else {false});
			};
		};
	};
	case "onVehicleIconClicked": {
		_role = _this select 1;
		_idc = _this select 2;
		
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [lnbCurSelRow 111007, 0];
		_toggle = if (uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _role]) then {false} else {true};
		uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehicon_%1", _role], _toggle];
		
		_color = if (_toggle) then {[0.258823529, 0.713725490, 1, 1]} else {[0.2, 0.2, 0.2, 1]};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _idc) ctrlSetTextColor _color;
		(_classname) call CTI_UI_Purchase_UpdateCost;
	};
	case "onVehicleLockClicked": {
		_toggle = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {false} else {true};
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_vehicon_lock", _toggle];
		
		_color = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {[1, 0.22745098, 0.22745098, 1]} else {[0.2, 0.2, 0.2, 1]};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110105) ctrlSetTextColor _color;
	};
	case "onPurchase": {
		_selected = _this select 1;
		if (_selected == -1) exitWith {}; //nothing selected.
				
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [_selected, 0];
		_fetched = uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory";
		_closest = _fetched call CTI_CO_FNC_GetClosestTown;
		_var = _fetched getVariable "cti_structure_type";
		if (isNil '_var') exitWith {};
		_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _var];
		_type = (_var select 0) select 0;
		/*_max_group_size = ((CTI_P_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UPGRADE_BARRACKS;
		switch (_max_group_size) do {
			case 0: {_max_group_size = round(CTI_AI_PLAYER_TEAMS_GROUPSIZE * 0.25)};
			case 1: {_max_group_size = round(CTI_AI_PLAYER_TEAMS_GROUPSIZE * 0.5)};
			case 2: {_max_group_size = round(CTI_AI_PLAYER_TEAMS_GROUPSIZE * 0.75)};
			default {_max_group_size = CTI_AI_PLAYER_TEAMS_GROUPSIZE};
		};*/
		_max_group_size = CTI_AI_PLAYER_TEAMS_GROUPSIZE;
		
		//--- Make sure that we own all camps before being able to purchase infantry.
		_allCampsHeld = true;
		if (_classname isKindOf "Man" && _type == "Depot") then {
			_totalCamps = _closest Call CTI_CO_FNC_GetTotalCamps;
			_campsSide = [_closest,CTI_P_SideJoined] Call CTI_CO_FNC_GetTotalCampsOnSide;
			if (_totalCamps != _campsSide) then {_allCampsHeld = false};
		};

		if (_allCampsHeld) then {
			_funds = call CTI_CL_FNC_GetPlayerFunds;
			if (_funds > (uiNamespace getVariable "cti_dialog_ui_purchasemenu_unitcost")) then {
				_selected_group = (uiNamespace getVariable "cti_dialog_ui_purchasemenu_teams") select (lbCurSel ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008)); //todo Change that by combo value
				_isEmpty = false;
				_unit_count = 1;
				_veh_info = if (_classname isKindOf "Man") then { [] } else { _classname call CTI_UI_Purchase_GetVehicleInfo };
				if (count _veh_info > 0) then {
					if ((_veh_info select 0) || (_veh_info select 1) || (_veh_info select 2) || (_veh_info select 3)) then {
						_unit_count = 0;
						for '_i' from 0 to 3 do {
							if (_veh_info select _i) then {_unit_count = _unit_count + 1};
						};
					} else {
						_isEmpty = true;
					};
				};
			
				if (alive(uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory")) then {	
					_ai_enabled = missionNamespace getVariable "CTI_AI_TEAMS_ENABLED";
					if (_ai_enabled > 0 || (isPlayer leader _selected_group && _ai_enabled == 0)) then {
						if ((count units _selected_group) + CTI_P_PurchaseQueue + _unit_count <= _max_group_size || _isEmpty) then { //todo ai != player limit
							if ((missionNamespace getVariable Format["CTI_QUEUE_%1",_type]) < (missionNamespace getVariable Format["CTI_QUEUE_%1_LIMIT",_type])) then {
								missionNamespace setVariable [Format["CTI_QUEUE_%1",_type],(missionNamespace getVariable Format["CTI_QUEUE_%1",_type])+1];
								_proc_purchase = true;
								if (_isEmpty && _selected_group != group player) then { _proc_purchase = false; hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Empty vehicles may not be purchased for other groups."; };
								CTI_P_PurchaseQueue = CTI_P_PurchaseQueue + _unit_count;
								if (_proc_purchase) then {
									_get = missionNamespace getVariable _classname;
									_picture = if ((_get select CTI_UNIT_PICTURE) != "") then {format["<img image='%1' size='2.5'/><br /><br />", _get select CTI_UNIT_PICTURE]} else {""};
									hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />%2<t>A <t color='#ccffaf'>%1</t> is being built</t>", _get select CTI_UNIT_LABEL, _picture];
									[_classname, uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory", _selected_group, _veh_info, _unit_count] call CTI_CL_FNC_PurchaseUnit;
								};
							} else { 
							hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />Your factory queue limit has been reached. (%1)", missionNamespace getVariable Format["CTI_QUEUE_%1_LIMIT",_type]];
							};
						} else {
							if (_selected_group != group player) then {
								hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br /><t color='#ccffaf'>%1's</t> unit limit has been reached. (%2)", name leader _selected_group, _max_group_size];
							} else {
								hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br />Your unit limit has been reached. (%2)", name leader _selected_group, _max_group_size];
							};
						};
					} else {
						hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Units may not be purchased to AI groups while the AI Teams are disabled in the parameters.";
					};
				};
			} else {
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to perform this operations.";
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Infantry may not be purchased while camps in the city are held by the enemy.";
		};
	};
	case "onIndependentSalvagerPressed": {
		if (isNil 'CTI_P_LastIndepSalvagerPurchased') then { CTI_P_LastIndepSalvagerPurchased = -600 }; 
		
		_in_use = (uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory") getVariable "cti_inuse";
		if (isNil '_in_use') then { _in_use = false };
		if !(_in_use) then {
			_funds = call CTI_CL_FNC_GetPlayerFunds;
			if (_funds >= CTI_VEHICLES_SALVAGER_PRICE) then {
				if (count(CTI_P_SideLogic getVariable "cti_salvagers") < CTI_VEHICLES_SALVAGE_INDEPENDENT_MAX) then { 
					if (time - CTI_P_LastIndepSalvagerPurchased > 5) then {
						CTI_P_LastIndepSalvagerPurchased = time;
						_logic = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideLogic;
						_salvager_team = _logic getVariable ["cti_salvager_team", grpNull];
						if (isNull _salvager_team) then {
							_salvager_team = createGroup CTI_P_SideJoined;
							_salvager_team setGroupID ["Salvager Team"];
							_salvager_team setVariable ["cti_gc_noremove", true];
							_logic setVariable ["cti_salvager_team", _salvager_team];
						};
						["SERVER", "Request_Purchase", [_salvager_team, group player, CTI_P_SideJoined, format["CTI_Salvager_Independent_%1", CTI_P_SideJoined], uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory", [true, false, false, false, "", true], (time + random 10000 - random 500 + diag_frameno), 1]] call CTI_CO_FNC_NetSend;
					} else {
						hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Please wait a few seconds before performing this operation again.";
					};
				} else {
					hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The Independent salvager limit has been reached.";
				};
			} else {
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to perform this operations.";
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The factory shouldn't be in use in order to buy an independent salvager.";
		};
	};
	case "onQueueCancel": {
		_selected = _this select 1;
		
		if (_selected != -1) then {
			_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110013) lbData _selected;
			_rounded_seed = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110013) lbValue _selected;
			
			_unit_count = 1;
			_veh_info = if (_classname isKindOf "Man") then { [] } else { _classname call CTI_UI_Purchase_GetVehicleInfo };
			if (count _veh_info > 0) then {
				if ((_veh_info select 0) || (_veh_info select 1) || (_veh_info select 2) || (_veh_info select 3)) then {
					_unit_count = 0;
					if (_veh_info select 0) then {_unit_count = _unit_count + 1};
					if (_veh_info select 1) then {_unit_count = _unit_count + 1};
					if (_veh_info select 2) then {_unit_count = _unit_count + 1};
					if (_veh_info select 3) then {_unit_count = _unit_count + 1}; //((_currentUnit select QUERYUNITCREW) select 3)
				};
			};
			
			// player sidechat format ["trying to remove %1 %2", _classname, _rounded_seed];
			_is_present = false;
			_req_can_alter = true;
			_req_factory = objNull;
			_req_team = grpNull;
			_seed = -1;
			_index = -1;
			{
				if (round(_x select 0) == _rounded_seed && _x select 1 == _classname) exitWith {
					_is_present = true;
					_seed = _x select 0;
					_req_factory = _x select 3;
					_req_team = _x select 4;
					_req_can_alter = _x select 5;
					_index = _forEachIndex;
				};
			} forEach CTI_P_PurchaseRequests;
			
			if (_is_present) then {
				//--- Yes it's here, but can we alter it ?
				if (_req_can_alter) then {
					CTI_P_PurchaseRequests set [_index, "!nil!"];
					CTI_P_PurchaseRequests = CTI_P_PurchaseRequests - ["!nil!"];
							
					//--- Release from factory and unit queues
					_var = _req_factory getVariable "cti_structure_type";
					missionNamespace setVariable [Format["CTI_QUEUE_%1",_var],(missionNamespace getVariable Format["CTI_QUEUE_%1",_var])-1];
					CTI_P_PurchaseQueue = CTI_P_PurchaseQueue - _unit_count;
					
					//--- Notify the server thread that our request has been canceled.
					["SERVER", "Request_PurchaseCancel", [_seed, _classname, _req_factory, _req_team, group player, _unit_count]] call CTI_CO_FNC_NetSend;
				} else {
					hint "commander assigned units may not be removed";
				};
			};
		};
	};
	case "onUnload": {
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_action", objNull];
	};
};

