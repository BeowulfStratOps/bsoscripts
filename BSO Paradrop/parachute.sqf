params ["_DZ","_unit"];

private _area = markerSize _DZ;
private _nul = _area pushBack markerDir _DZ;
private _nul = _area pushBack ( markerShape _DZ isEqualTo "Rectangle" );
private _Randompos = [ _DZ, _area ] call BIS_fnc_randomPosTrigger;

//private _Randompos = [[[getMarkerPos _DZ]]] call BIS_fnc_randomPos;
private _parachutePos = [_randompos select 0, _randompos select 1, 150];
private _parachute = "DEGA_T10_Parachute" createVehicle [0,0,0];
_parachute setPos _parachutePos;
_parachute setDir random 50;

if (_unit isKindOf "Man") then {_unit MoveInDriver _parachute} else {

	switch (typeof _unit) do
	{
		case "B_Quadbike_01_F":
		{
			_unit attachTo [_parachute, [0,0,1]]
		};
		default 
		{
			_unit attachTo [_parachute, [0,0,1]]
		};
	};	
};

