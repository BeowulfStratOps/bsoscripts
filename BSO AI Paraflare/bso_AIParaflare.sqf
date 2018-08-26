// _x = [this] execVM "mission\bso_AIParaflare.sqf";

if (isServer) then {
_unit = _this select 0;
_MyCombatMode = "GREEN"; //Fallback combat mode
_BSOAIFlares_shoot = false;


_unit addWeapon "rhs_weap_rsp30_red"; _unit addHandgunItem "rhs_mag_rsp30_red";




	waitUntil {(_unit findNearestEnemy position _unit) distance _unit < 300};
	
	
		while {(_unit findNearestEnemy position _unit) distance _unit < 300 AND alive _unit AND !_BSOAIFlares_shoot} do {
		
			if ({_unit != _x &&  _x getVariable "BSO_AIFlares"} count units group _unit == 0) then {
				hint "I WILL shoot flare";
				_BSOAIFlares_shoot = true;
			} else {
				hint "Flare is already up";
				sleep 1 + (random 5);
			};
		};



while {_BSOAIFlares_shoot AND alive _unit} do {

	if ((_unit findNearestEnemy position _unit) distance _unit < 300 AND (handgunWeapon _unit == "rhs_weap_rsp30_red")) then {
	
		hint "Valid flare target";
		_unit setVariable ["BSO_AIFlares", true];
		_myNearestEnemy = _unit findNearestEnemy _unit;


		sleep 5;
		_MyCombatMode= (combatmode _unit);
		_unit setCombatMode "BLUE";
		_unit setBehaviour "SAFE";
		hint "I AM SAFE";

		_unit doTarget _myNearestEnemy;
		sleep 0.5;
		HINT "Sleep done. targeting noi";
		_unit selectWeapon "rhs_weap_rsp30_red";
		hint "I AM A TWAT";
		sleep 3;

		HINT "Sleep done. shooting now";
		_unit forceWeaponFire ["rhs_weap_rsp30_red", "rhs_weap_rsp30_red"];

		sleep 3;
		_unit setCombatMode _MyCombatMode;
		_unit setBehaviour "COMBAT";
		hint "I AM combat";

		sleep 10;

		hint "i'm done";
		_unit setVariable ["BSO_AIFlares", false];
	};
};

};