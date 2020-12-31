//
// execVM "mission\mission_actions.sqf";
//
_checkWreck = {
params ["_target", "_player", "_params"];

// Checks for the repair
(typeOf _player == "B_engineer_F") // class of player
&&
(!alive _target) //Vehicle must be a wreck (dead)
&&
((count nearestObjects [_target, ["B_APC_Tracked_01_CRV_F"], 20]) == 1) // Repair vehicle that must be near by


};

_wreckRepairAction = {

params ["_target", "_player", "_params"];

[30, [_target], { //change 30 to desired seconds for repair

_VehcC = _this select 0;

[_VehcC]execVM "mission\repairWreck.sqf";


}, {}, "Repairing Wreck..."] call ace_common_fnc_progressBar;


};




_repairWreck = ["bso_repairWreck", "Repair Wreck", "", _wreckRepairAction, _checkWreck] call ace_interact_menu_fnc_createAction;

["B_MBT_01_TUSK_F", 0, ["ACE_MainActions"], _repairWreck] call ace_interact_menu_fnc_addActionToClass;