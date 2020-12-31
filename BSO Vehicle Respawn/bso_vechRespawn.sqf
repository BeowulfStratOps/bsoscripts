// nul = [this] execVM "mission\bso_vechRespawn.sqf";
_Ovech = _this select 0;


_vechType = typeOf _Ovech;
_vechDir = getDir _Ovehc;
_vechPos = getposatl _Ovehc;

_Ovech addEventHandler ["Killed", {

_Nvech = createVehicle [_vechType, _vechPos, [], sizeof _vechType, _none];
_Nvech setdir _vechDir;

}];