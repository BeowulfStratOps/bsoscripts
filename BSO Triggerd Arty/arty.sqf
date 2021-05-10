 // [12, "arty_Marker", ["M_PG_AT"], [1,3,5]] execVM "mission\arty.sqf"; 
_numberOfRnds = _this select 0;
_artyLocation = _this select 1;
_munitions = _this select 2;
_roundTimers = _this select 3;

if (isServer) then {

	"G_40mm_SmokeRed" createVehicle (getMarkerPos _artyLocation);
	Sleep 10.00;

	for "_i" from 1 to _numberOfRnds do {
	sleep random _roundTimers;
	_roundType = selectRandom _munitions;
	_roundPos = [[_artyLocation]] call BIS_fnc_randomPos;

	_roundType createVehicle _roundPos;
	};
};