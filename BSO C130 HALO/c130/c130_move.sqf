if (!isServer) exitWith {};

params ["_logic","_newPos","_newAlt","_newDir"];

if (isNil "_newPos") exitWith {false;};
if (isNil "_newAlt") then { _newAlt = _logic getVariable "c130_alt"};
if (isNil "_newDir") then { _newDir = getDir _logic};

_logic setPos _newPos;
_logic setDir _newDir;
_logic setVectorUp [0,0,1];

private _c130prop = _logic getVariable "c130_prop";
_c130prop attachTo [_logic,[0, 0, _newAlt+5]];
_logic setVariable ["c130_alt",_newAlt,true];
