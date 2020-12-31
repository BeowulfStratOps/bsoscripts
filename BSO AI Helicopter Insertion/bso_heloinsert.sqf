//		nul = [_AirSpawn,_AirEnd,_Dropzone,_RallyPoint,_ParaAttack,_Side,_AircraftType,_ParatroopsArray] execVM "bso_paradrop.sqf";  
//		nul = ["airspawn_1","airend_1","lz_1","rally_1","attack_1",EAST,"O_Heli_Transport_04_covered_F",["O_bso_cccp_VDV_GL","O_bso_cccp_VDV_AUTO","O_bso_cccp_VDV_AUTOA","O_bso_cccp_VDV_RPG","O_bso_cccp_VDV_RPGA","O_bso_cccp_VDV_MG","O_bso_cccp_VDV_MGA","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle""O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle","O_bso_cccp_VDV_rifle"]] execVM "mission\bso_heloinsert.sqf";   

_AirSpawn = _this select 0;
_AirEnd = _this select 1; 
_Dropzone = _this select 2;
_RallyPoint = _this select 3;
_ParaAttack = _this select 4;
_Side = _this select 5;
_AircraftType = _this select 6;
_ParatroopsArray = _this select 7;

_AirSpawnDir = markerDir _AirSpawn;

if isServer then {

// Creates Helicopter
_aircraft = [(getMarkerPos _AirSpawn), _AirSpawnDir, _AircraftType, _side] call bis_fnc_spawnvehicle;

// Creates Infantry Group
_infgrp = [getMarkerPos _AirSpawn, _side,_ParatroopsArray] call BIS_fnc_spawnGroup;


// Moves Infantry in cargo
_infgrpLead = leader _infgrp;
{_x moveInCargo (_aircraft Select 0)} forEach units group _infgrpLead;


// Infantry Waypoints
_infWP1 = [_infgrp, (getMarkerPos _RallyPoint), 0, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "", [2,4,6]] call CBA_fnc_addWaypoint;
_infWP2 = [_infgrp, (getMarkerPos _ParaAttack), 0, "MOVE", "AWARE", "RED", "FULL", "WEDGE"] call CBA_fnc_addWaypoint;
_infWP3 = [_infgrp, (getMarkerPos _ParaAttack), 0, "MOVE", "SAFE", "RED", "NORMAL", "WEDGE", "[this, this, 100, 2, true] call CBA_fnc_taskDefend"] call CBA_fnc_addWaypoint;

// Helicopter Waypoints
_AirWP1 = [_aircraft, (getMarkerPos _Dropzone), 0, "TR UNLOAD", "CARELESS", "GREEN", "NORMAL", "NO CHANGE"] call CBA_fnc_addWaypoint;
_AirWP2 = [_aircraft, (getMarkerPos _AirEnd), 0, "MOVE", "CARELESS", "GREEN", "NORMAL", "NO CHANGE"] call CBA_fnc_addWaypoint;
_AirWP2 setWaypointStatements ["true", "cleanUpveh = vehicle leader this; {deleteVehicle _x} forEach crew cleanUpveh + [cleanUpveh];"];

};