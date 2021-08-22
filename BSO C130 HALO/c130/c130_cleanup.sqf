params ["_logic"];

private _c130prop = _logic getVariable "c130_prop";
private _c130light = _logic getVariable "c130_light";
private _c130live = _logic getVariable "c130_live";
private _c130crew = _logic getVariable "c130_crew";

{ deleteVehicle _x; } forEach ([_c130prop,_c130light,_c130live] + _c130crew);
{_logic setVariable [_x,nil,true];} forEach {"c130_prop","c130_light","c130_live","c130_crew","c130_alt"};
