// _x = [this] execVM "mission\bso_AIParaflare.sqf";
_unit = _this select 0;
_MyCombatMode = "GREEN"; //Fallback combat mode



_unit addWeapon "rhs_weap_rsp30_red"; _unit addHandgunItem "rhs_mag_rsp30_red";

//waitUntil {behaviour _unit == "COMBAT"};

waitUntil {_unit call BIS_fnc_enemyDetected};

_myNearestEnemy = _unit findNearestEnemy _unit;



_MyCombatMode= (combatmode _unit);
_unit setCombatMode "BLUE";
_unit setBehaviour "SAFE";
hint "I AM SAFE";

_unit selectWeapon "rhs_weap_rsp30_red";
hint "I AM A TWAT";
sleep 4;

HINT "Sleep done. targeting noi";

_unit lookAt _myNearestEnemy;
sleep 2;

HINT "Sleep done. shooting now";
_unit forceWeaponFire ["rhs_weap_rsp30_red", "rhs_weap_rsp30_red"];



sleep 3;


_unit setCombatMode _MyCombatMode;
_unit setBehaviour "COMBAT";
hint "I AM combat";