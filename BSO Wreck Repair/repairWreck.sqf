_Wreck = _this select 0;

[0, {

_WreckVehc = _this select 0;


// Positioning for vehc creation and getting the wreck's pos
_SafePos = [[], 0, 1000] call BIS_fnc_findSafePos;

_WreckPos = (getPosASL _WreckVehc);
_WreckDir = (getDir _WreckVehc);
//_SafePos = (getPos _pos);

// new vehc creation. Creates at safepos
_NewVehc = createVehicle ["B_MBT_01_TUSK_F", _SafePos, [], 0, "CAN_COLLIDE"];


// Apply damage to new vehc so its not fresh. These may need to be adjusted depending on vehicle
_NewVehc setDammage 0.5;

_randomDamage1 = selectRandom [0.5,0.6,0.7,0.8,0.9];
_randomDamage2 = selectRandom [0.5,0.6,0.7,0.8,0.9];
_randomDamage3 = selectRandom [0.5,0.6,0.7,0.8,0.9];

_NewVehc setHitPointDamage ["hithull", _randomDamage1];
_NewVehc setHitPointDamage ["hitengine", _randomDamage2];
_NewVehc setHitPointDamage ["hitfuel", _randomDamage3];
_NewVehc setHitPointDamage ["hitltrack", 1];
_NewVehc setHitPointDamage ["hitrtrack", 1];
_NewVehc setHitPointDamage ["hitturret", 1];
_NewVehc setHitPointDamage ["hitgun", 1];
_NewVehc setHitPointDamage ["hitcomturret", 1];
_NewVehc setHitPointDamage ["hitcomgun", 1];


_NewVehc setHitPointDamage ["hitera_left_1", 1];
_NewVehc setHitPointDamage ["hitera_left_2", 1];
_NewVehc setHitPointDamage ["hitera_left_3", 1];
_NewVehc setHitPointDamage ["hitera_left_4", 1];
_NewVehc setHitPointDamage ["hitera_right_1", 1];
_NewVehc setHitPointDamage ["hitera_right_2", 1];
_NewVehc setHitPointDamage ["hitera_right_3", 1];
_NewVehc setHitPointDamage ["hitera_right_4", 1];
_NewVehc setHitPointDamage ["hitera_top_front", 1];
_NewVehc setHitPointDamage ["hitera_top_left", 1];
_NewVehc setHitPointDamage ["hitera_top_right", 1];

_NewVehc setDir _WreckDir;

// sleep BECAUSE DEDICATED SERVER
sleep 1;

deleteVehicle _WreckVehc;

// sleep BECAUSE DEDICATED SERVER
sleep 1;

_NewVehc setPosASL _WreckPos;

clearMagazineCargoGlobal _NewVehc;
clearWeaponCargoGlobal _NewVehc;
clearItemCargoGlobal _NewVehc;
clearItemCargoGlobal _NewVehc;



}, _Wreck] call CBA_fnc_globalExecute;