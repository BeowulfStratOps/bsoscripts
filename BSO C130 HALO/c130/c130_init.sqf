if (!isServer) exitWith {};

params ["_logic","_alt"];
_logic setVectorUp [0,0,1];

//create prop, light, and dummy vehicle.
private _c130prop = "C130J_static_EP1" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130prop attachTo [_logic,[0, 0, _alt+5]];


private _c130light = "Land_TentLamp_01_suspended_red_F" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130light attachTo [_c130prop,[0, 0, 5]];

private _c130live = "RHS_C130J" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
createVehicleCrew _c130live;
_c130live attachTo [_c130prop,[0, 0, 6]];
_c130live setVectorDirAndUp [vectorDir _c130prop,vectorUp _c130prop];
_c130live hideObject true;
//_c130dummy enableSimulation false;

//setVar for quick reference
_logic setVariable ["c130_alt",_alt,true];
_logic setVariable ["c130_prop",_c130prop,true];
_logic setVariable ["c130_light",_c130light,true];
_logic setVariable ["c130_live",_c130live,true];
_logic setVariable ["c130_crew",crew _c130live,true];

[_logic,[_c130prop,_c130light,_c130live,_c130live]];
