/*
Example below will drop a bomb from an A-10, coming in from 240 degrees
[getPos player,240,"RHS_A10",3] execVM "mission\casStrike.sqf";

PARAMETERS
1. Center of CAS run (any position)	| MANDATORY
2. Direction for CAS to strafe towards	| MANDATORY
3. Class of CAS plane to use. | OPTIONAL - default is AAF L-159
4. Type of CAS run. 0: Guns only. 1: Rockets only. 2: Both. 3 - Bomb	| OPTIONAL - default is 0


*/
params [
	"_position","_direction",["_vehicle","B_Plane_CAS_01_F"],["_type",2],
	"_logic"
];

_logic = "Logic" createVehicleLocal _position;
_logic setDir _direction;
_logic setVariable ["vehicle",_vehicle];
_logic setVariable ["type",_type];

[_logic,nil,true] call BIS_fnc_moduleCAS;

deleteVehicle _logic;