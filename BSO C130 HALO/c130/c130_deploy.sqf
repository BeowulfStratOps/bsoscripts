if (!isServer) exitWith {};

params ["_logic","_units","_applyParachute"];
private _prop =  _logic getVariable "c130_prop";
if (_prop == objNull) exitWith  {false;};

if (isNil "_applyParachute") then {_applyParachute = true;};
if (_applyParachute) then {
   [-1, {[ace_player] call zade_boc_fnc_actionOnChest; ace_player addBackpack "B_Parachute";}, []] call CBA_fnc_globalExecute;    
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
