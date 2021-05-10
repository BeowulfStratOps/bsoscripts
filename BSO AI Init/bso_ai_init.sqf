// Call on a group leader in editor with below 
//[this] execVM "mission\bso_ai_init.sqf”;
if (isServer) then { 
	_groupLeader = _this select 0;
	{
		_type = typeOf _x;
		_rifleman = selectRandom ["Rifleman","Rifleman2","Rifleman3"]; // array for random loadouts

		switch _type do 
		{
			case "O_T_Soldier_F": {[_x,"opfor","rifleman",true] call BSO_fnc_applyLoadout;}; // applies a loadout
			case "O_T_Soldier_SL_F": {[_x,"opfor",_rifleman,true] call BSO_fnc_applyLoadout;}; // applies a loadout randomly based above array
			case "O_T_Soldier_MG_F": {[_x] execVM "mission\bso_AIParaflare.sqf";}; // makes ai use paraflares
			case "O_T_Soldier_GL_F": {[_x] execVM "mission\bso_AIParaflare.sqf"; _x addItem "SAN_Headlamp_v1"; _x assignItem "SAN_Headlamp_v1";}; // makes ai use paraflares + adds headlamp
			case "O_T_Soldier_TLF": {[_x] execVM "mission\bso_AIParaflare.sqf"; removeAllPrimaryWeaponItems _x; _x addPrimaryWeaponItem "acc_flashlight";}; //makes ai use paraflares + weapon flashlight (check classname)
		};
	} forEach units group _groupLeader;
};