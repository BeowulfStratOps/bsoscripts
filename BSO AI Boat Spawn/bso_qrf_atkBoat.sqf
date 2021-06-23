// _spawn = ["boatStart_1", "UK3CB_AAF_I_RHIB", west,["B_BSO_AMB_GL","B_BSO_AMB_RIFLE","B_BSO_AMB_MG","B_BSO_AMB_LAT"]] execVM "mission\bso_qrf_atkBoat.sqf";
_boatStart = _this select 0;
_AtkBoat = _this select 1;
_side = _this select 2;
_BoatGroup = _this select 3;


// Creates  Boat and deletes crew
_BoatSpawnDir = markerDir _BoatStart;
_spawn_boat = [(getMarkerPos _BoatStart), _BoatSpawnDir, _AtkBoat, _side] call bis_fnc_spawnvehicle;
_spawn_boatname = _spawn_boat select 0;
{ _spawn_boatname deleteVehicleCrew _x } forEach crew _spawn_boatname;

// Creates Infantry Group
_spawn_infgrp = [getMarkerPos _BoatStart, _side,_BoatGroup] call BIS_fnc_spawnGroup;

// Moves Infantry in Vehicle
_spawn_infgrpLead = leader _spawn_infgrp;
{_x moveInAny _spawn_boatname} forEach units group _spawn_infgrpLead;


// Locks boat and adds event handler that will delete crew if destroyed
_spawn_boatname setVehicleLock "LOCKED";


_spawn_BoatWP1 = [_spawn_boat, (getMarkerPos "boatPos_1"), 0, "MOVE", "SAFE", "RED", "NORMAL", "STAG COLUMN", "", [0, 0, 0]] call CBA_fnc_addWaypoint;
_spawn_BoatWP2 = [_spawn_boat, (getMarkerPos "boatPos_2"), 0, "MOVE", "SAFE", "RED", "NORMAL", "STAG COLUMN", "", [0, 0, 0]] call CBA_fnc_addWaypoint;
_spawn_BoatWP3 = [_spawn_boat, (getMarkerPos "boatPos_3"), 0, "MOVE", "SAFE", "RED", "NORMAL", "STAG COLUMN", "", [0, 0, 0]] call CBA_fnc_addWaypoint;
_spawn_BoatWP4 = [_spawn_boat, (getMarkerPos "boatPos_2"), 0, "MOVE", "SAFE", "RED", "NORMAL", "STAG COLUMN", "", [0, 0, 0]] call CBA_fnc_addWaypoint;
_spawn_BoatWP5 = [_spawn_boat, (getMarkerPos "boatPos_1"), 0, "CYCLE", "SAFE", "RED", "NORMAL", "STAG COLUMN", "", [0, 0, 0]] call CBA_fnc_addWaypoint;