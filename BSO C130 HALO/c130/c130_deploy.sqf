if (!isServer) exitWith {};

params ["_logic","_units","_applyParachute"];
private _prop =  _logic getVariable "c130_prop";
if (_prop == objNull) exitWith  {false;};

if (isNil "_applyParachute") then {_applyParachute = true;};
if (_applyParachute) then {
  {
    [_x] call zade_boc_fnc_actionOnChest;
    _x addBackpack "B_Parachute";
  } forEach _units;
};

private _posArray = [
  [0.75,2,-5],[0.75,1,-5],[0.75,0,-5],[0.75,-1,-5],[0.75,-2,-5],[0.75,-3,-5],[0.75,-4,-5],[0.75,-5,-5],[0.75,-6,-5],[0.75,-7,-5],[0.75,-8,-5],
  [-0.75,2,-5],[-0.75,1,-5],[-0.75,0,-5],[-0.75,-1,-5],[-0.75,-2,-5],[-0.75,-3,-5],[-0.75,-4,-5],[-0.75,-5,-5],[-0.75,-6,-5],[-0.75,-7,-5],[-0.75,-8,-5]
];
{
  if (_forEachIndex > 22) exitWith {false;};
  _x attachTo [_prop,_posArray # _forEachIndex]; detach  _x;
} forEach _units;

true;
