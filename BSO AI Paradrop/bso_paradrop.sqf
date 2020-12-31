/*
	
	////BSO Paradrop Function\\\\\
	
	Function to create an infantry paradrop using the RHS Paradrop Waypoint.
	The Aircraft will spawn and proceed to drop the infantry at the designated dropzone, before moving to an end zone and being deleted.
	The Paratroopers will land starting at the dropzone (Larger the array, further away from the dropzone they will land).
	They Paratroopers will move from where they land to the rally point as a group, before commencing an attack move to the attack location. 
	Once the area is secure they will begin defending the area.
	
	Syntax:
		nul = [_AirSpawn,_AirEnd,_Dropzone,_RallyPoint,_ParaAttack,_Side,_AircraftType,_ParatroopsArray] execVM "bso_paradrop.sqf";  
	
	Params:
	
		0 - _AirSpawn = Aircraft spawn location. Must be a marker name in quotes (see Below)
		1 - _AirEnd = Aircraft end location. Must be a marker name in quotes (see Below)
		2 - _Dropzone = Parachute drop zone (Where the paradrop starts). Must be a marker name in quotes (See Below)
		3 - _RallyPoint = Rally point for the parachuting group (Moves to this location before attacking). Must be a marker name in quotes (see below)
		4 - _ParaAttack = Attack location for the parachuting group (Group will combat move to this location, and then Defend it.). Must be a marker name in quotes (see below)
		5 - _Side = Side the units belong to (Can be used to force a side. EG. OpFor C130 as per example). WEST, EAST, RESISTANCE or CIVILIAN
		6 - _AircraftType = The type of aircraft used for the airdrop. Any Vehicle classname in quotes. (See Below)
		7 - _ParatroopsArray = An Array of the units to compose the paradropped units. Must be an array! (See Below)


	Example:
		Below example creates a C130 and a group of SLA Paratroopers.

			nul = ["airspawn_1","airend_1","dropzone_1","rallypoint_1","AttackPos_1",EAST,"RHS_C130J",["O_BSO_SLA_GL","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE","O_BSO_SLA_RIFLE"]] execVM "bso_paradrop.sqf";   




	Example Breakdown:
	
		nul = [
		"airspawn_1", 					// - Air Spawn marker
		"airend_1", 					// - Air End marker
		"dropzone_1",					// - Dropzone marker
		"rallypoint_1",					// - Rally Point marker
		"AttackPos_1",					// - Attack Position marker
		EAST,							// - Side units belong to
		"RHS_C130J",					// - Aircraft Classname 
		["O_BSO_SLA_GL",				// - Start of array of the paratroopers
			"O_BSO_SLA_RIFLE",
			"O_BSO_SLA_MG",
			"O_BSO_SLA_MGA",
			"O_BSO_SLA_RPG",
			"O_BSO_SLA_RPGA",
			"O_BSO_SLA_MEDIC",
			"O_BSO_SLA_RIFLE",
			"O_BSO_SLA_RIFLE",
			"O_BSO_SLA_RIFLE"
		]								// - Close of array of the paratroopers
		] execVM "bso_paradrop.sqf";    // - Ckose of params array and exec of script

		
*/

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

// Creates Aircraft
_aircraft = [(getMarkerPos _AirSpawn), _AirSpawnDir, _AircraftType, _side] call bis_fnc_spawnvehicle;
// Creates Infantry Group
_infgrp = [getMarkerPos _AirSpawn, _side,_ParatroopsArray] call BIS_fnc_spawnGroup;


// Moves Infantry in cargo
_infgrpLead = leader _infgrp;
{_x moveInCargo (_aircraft Select 0)} forEach units group _infgrpLead;


// Infantry Waypoints
_infWP1 = [_infgrp, (getMarkerPos _RallyPoint), 0, "MOVE", "AWARE", "GREEN", "FULL", "STAG COLUMN", "", [2,4,6]] call CBA_fnc_addWaypoint;
_infWP2 = [_infgrp, (getMarkerPos _ParaAttack), 0, "MOVE", "COMBAT", "RED", "FULL", "WEDGE"] call CBA_fnc_addWaypoint;
_infWP3 = [_infgrp, (getMarkerPos _ParaAttack), 0, "MOVE", "SAFE", "RED", "NORMAL", "WEDGE", "[this, this, 100, 2, true] call CBA_fnc_taskDefend"] call CBA_fnc_addWaypoint;

// Aircraft Waypoints
_AirWP1 = [_aircraft, (getMarkerPos _Dropzone), 0, "SCRIPTED", "CARELESS", "BLUE", "NORMAL", "NO CHANGE"] call CBA_fnc_addWaypoint;
_AirWP1	setWaypointScript "\rhsafrf\addons\rhs_c_air\scripts\WP_ParaInf.sqf";
_AirWP2 = [_aircraft, (getMarkerPos _AirEnd), 0, "MOVE", "CARELESS", "BLUE", "NORMAL", "NO CHANGE"] call CBA_fnc_addWaypoint;
_AirWP2 setWaypointStatements ["true", "cleanUpveh = vehicle leader this; {deleteVehicle _x} forEach crew cleanUpveh + [cleanUpveh];"];



// Applies custom loadouts to the units
/*
{
	if (typeof _x == "B_Soldier_SL_F") then {[_x,"blufor","SquadLeader",true] call BSO_fnc_applyLoadout;}; 
	if (typeof _x == "B_Soldier_TL_F") then {[_x,"blufor","TeamLeader",true] call BSO_fnc_applyLoadout;}; 	
	if (typeof _x == "B_soldier_AR_F") then {[_x,"blufor","Autorifleman",true] call BSO_fnc_applyLoadout;}; 		
	if (typeof _x == "B_Soldier_GL_F") then {[_x,"blufor","Grenadier",true] call BSO_fnc_applyLoadout;}; 
	if (typeof _x == "B_soldier_LAT_F") then {[_x,"blufor","RiflemanLAT",true] call BSO_fnc_applyLoadout;}; 
	
	removeGoggles _x;
} foreach units group _infgrpLead;


*/


// Check that group has landed, then heal them (fixes broken legs)
waituntil {isTouchingGround _infgrpLead};

sleep 10;
{
	_x setDamage 0;
} foreach units group _infgrpLead;





};