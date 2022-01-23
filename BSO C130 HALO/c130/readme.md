# C130 HALO Prop

These scripts allow for the creation of a static C130 prop that players can be moved to for more "immersive" starts to missions with a HALO insertion.

**IMPORTANT NOTE: Due to some odd ArmA and Zade BackpackOnChest interactions when players land they will need to either equip a grenade with the ACE Advanced grenade throw key bind, or drop their normal backpack and pick it back up for any throwables**

It is made up of 4 functions, how you call these is up to you. I've provided the most basic examples to illustrate what each part does.
To include this in your mission you will need to copy the c130 folder into your mission, or include the scripts elsewhere in your mission and adjust how they are called.

**c130_init.sqf**
This function sets up a C130 prop, a dummy live one for sounds, and a red light.
Can be called globally but will only run on the server, best just running on the server to begin with.

```sqf
[_gamelogic,_altitude] call compile preprocessFileLineNumbers "c130\c130_init.sqf";
```

_gamelogic <object>: reference object, this is where the prop will be attached to
_altitude <number>: the height above the game logic for the prop to be created.

The first element in the array can be any object, in the mission included I use a game logic.
Bear in mind the prop C130 will be attached to this and variables will be set on the object for the other functions to reference.
The variables shown below are used to reference the different components.
`
_logic getVariable "c130_prop";
_logic getVariable "c130_light";
_logic getVariable "c130_live";
_logic getVariable "c130_crew";
`

**c130_deploy.sqf**
This function moves specified units into the C130, and if specified puts their backpacks on their chest and adds a parachute.
Can be called globally but will only run on the server, best just running on the server to begin with.

```sqf
[_gamelogic,_units,_applyParachute] call compile preprocessFileLineNumbers "c130\c130_deploy.sqf";
```

_gamelogic <object>: reference object, this is an object or game logic which you have used c130_init.sqf on already
_units <array>: an array of units to be moved into the C130
_applyParachute <bool, optional>: if true players will have backpacks put on their chest and a parachute added, removes the need to add as part of loadout (default is true)

This does not account for units already in a C130, avoid adding units to the same c130 twice.

**c130_move.sqf**
This function moves the c130 prop to a new location. Can also be used to adjust the altitude, and direction of the prop
Can be called globally but will only run on the server, best just running on the server to begin with.

```sqf
[_gamelogic,_newPos,_newAlt,_newDir] call compile preprocessFileLineNumbers "c130\c130_move.sqf";
```

_gamelogic <object>: reference object, this is an object or game logic which you have used c130_init.sqf on already
_newPos <array>: new position in format PositionAGL or Position2D, in which case Z will be set to 0
_newAlt <number, optional>: Optional, if not used the same altitude will be used
_newDir <number, optional>:Optional, if not used the same direction will be used

**c130_cleanup.sqf
This function removes the prop and other components that have been set up on a given object through c130_init.sqf

```sqf
[_gamelogic] call compile preprocessFileLineNumbers "c130\c130_cleanup.sqf";
```

_gamelogic <object>: reference object, this is an object or game logic which you have used c130_init.sqf on already
