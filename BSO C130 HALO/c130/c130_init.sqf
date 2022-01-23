if (!isServer) exitWith {};

params ["_logic","_alt"];
_logic setVectorUp [0,0,1];

//create prop, light, and dummy vehicle.
private _c130prop = "C130J_static_EP1" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130prop attachTo [_logic,[0, 0, _alt+5]];


private _c130light = "Land_TentLamp_01_suspended_red_F" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130light attachTo [_c130prop,[0, 0, 5]]; //[0, 0, -1]
/*
private _c130Rlight = "ACE_G_Chemlight_HiRed_Infinite" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130Rlight attachTo [_c130prop,[0, 2, -2.25]]; //[0, 0, -1]

private _c130Glight = "ACE_G_Chemlight_HiGreen_Infinite" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
_c130Glight attachTo [_c130prop,[0, 2, -2.25]]; //[0, 0, -1]*/

private _c130live = "RHS_C130J" createVehicle [getPos _logic # 0,getPos _logic # 1,_alt];
createVehicleCrew _c130live;
_c130live attachTo [_c130prop,[0, 0, 6]];
_c130live setVectorDirAndUp [vectorDir _c130prop,vectorUp _c130prop];
[_c130live,true] remoteExec ["hideObject", 0]; 
//_c130dummy enableSimulation false;

//setVar for quick reference
_logic setVariable ["c130_alt",_alt,true];
_logic setVariable ["c130_prop",_c130prop,true];
_logic setVariable ["c130_light",_c130light,true];
//_logic setVariable ["c130_Rlight",_c130Rlight,true];
//_logic setVariable ["c130_Glight",_c130Glight,true];
_logic setVariable ["c130_live",_c130live,true];
_logic setVariable ["c130_crew",crew _c130live,true];

[_logic,[_c130prop,_c130light,_c130live,_c130live]];

//cursorTarget animate ["ramp_bottom",0];cursorTarget animate ["ramp_top",0] //ramp code close, 1 to open
