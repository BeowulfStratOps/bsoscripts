//  Script to paradrop players + Objects

Script will choose a random position in the given marker area 150m high, and put them in a parachute.

Players are put into a parachute vehicle, so does not effect or require backpacks 

Script requires an area marker (ellipse or rectangle)


// HOW TO

Place the parachute.sqf and bso_preinit.sqf files into your mission's "mission" folder. Copy the contents of the meta.cpp file, into your mission's meta.cpp file
Now call the BSO_func_parachute with the units you wish. 
By default all infantry units will be put in the parachute vehicle, and objects will be attached to a parachute unit attachTo. 
If you wish to add a separate definition for a vehicle so the parachute is attached at a certain point, add it to the case list in parachute.sqf


// Below is an example of how we can paradrop a specific object

	["dz_1", myTank] spawn BSO_fnc_parachute;


// Below is an example of what could be put in customer_scripts.sqf to wait until GAME ON, then all players are dropped at the "dz_1" marker

	if (hasInterface) then {
		[] spawn {waitUntil {trigger_BSOstart};
		["dz_1", player] spawn BSO_fnc_parachute;
 	} 
