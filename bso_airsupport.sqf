//		nul = [_AirSpawn,_AirEnd,_AttackZone,_Side,_AircraftType] execVM "bso_airsupport.sqf";  



_AirSpawn = _this select 0;
_AttackZone = _this select 1;
_Side = _this select 2;
_AircraftType = _this select 3;

_AirSpawnDir = markerDir _AirSpawn;

if (isServer) then {

// Creates Helicopter
_aircraft = [(getMarkerPos _AirSpawn), _AirSpawnDir, _AircraftType, _side] call bis_fnc_spawnvehicle;
_aircraft params ["_airname", "_crew"];

_airname setVehicleLock "LOCKED";

	_airname addEventHandler ["Killed",{
		(_this select 0) spawn {
			sleep 30;
			{_this deleteVehicleCrew _x} forEach crew _this;
			deleteVehicle _this;
		};
	}];

	{
		
		_x addEventHandler ["GetOutMan", {
			params ["_unit", "_role", "_vehicle", "_turret"];
			if (_vehicle isKindOf "Air" && damage _vehicle >= 0.9) then{
				deleteVehicle _unit; 
			};
		}];
	} foreach _crew;

	_type = typeOf _airname;
	switch _type do 
	{
		case "I_Plane_Fighter_04_F": {
			_airname setPylonLoadout ["pylon1", "", true];
			_airname setPylonLoadout ["pylon2", "", true];
			_airname setPylonLoadout ["pylon3", "PylonRack_7Rnd_Rocket_04_HE_F", true];
			_airname setPylonLoadout ["pylon4", "PylonRack_7Rnd_Rocket_04_HE_F", true];
			_airname setPylonLoadout ["pylon5", "bso_ai_missile_bim9x_pylong_x1", true];
			_airname setPylonLoadout ["pylon6", "bso_ai_missile_bim9x_pylong_x1", true];	
		};
		case "I_Plane_Fighter_03_dynamicLoadout_F": {
			_airname setPylonLoadout ["Pylons1", "PylonRack_7Rnd_Rocket_04_HE_F", true];
			_airname setPylonLoadout ["Pylons2", "bso_ai_missile_bim9x_pylong_x1", true];
			_airname setPylonLoadout ["Pylons3", "PylonMissile_1Rnd_Mk82_F", true];
			_airname setPylonLoadout ["Pylons4", "PylonWeapon_300Rnd_20mm_shells", true];
			_airname setPylonLoadout ["Pylons5", "PylonMissile_1Rnd_Mk82_F", true];
			_airname setPylonLoadout ["Pylons6", "bso_ai_missile_bim9x_pylong_x1", true];
			_airname setPylonLoadout ["Pylons7", "PylonRack_7Rnd_Rocket_04_HE_F", true];			
		};
		
		case "I_Heli_light_03_dynamicLoadout_F": {};
	};



// Air Support Waypoints
// sends CAP to location and waits before next waypoint
_AirWP1 = [_aircraft, (getMarkerPos _AttackZone), 0, "MOVE", "AWARE", "GREEN", "NORMAL", "NO CHANGE","", [0,0,0],1000] call CBA_fnc_addWaypoint;

_AirWP2 = [_aircraft, (getMarkerPos _AttackZone), 0, "SAD", "COMBAT", "RED", "NORMAL", "NO CHANGE","", [0,0,0],1000] call CBA_fnc_addWaypoint;

};