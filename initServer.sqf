["Initialize"] call BIS_fnc_dynamicGroups;

[] call GRAD_common_fnc_extractEdenObjects;
[] call GRAD_common_fnc_deleteExtractedObjects;

[
	"LIB_GER_Soldier_base",
	"init",
	{
		private _unit = _this # 0;
		private _group = group _unit;
		if ((side _unit) isEqualTo east) exitWith { /*systemChat "already east";*/ };
		[
			{
				params ["_unit", "_group"];
				(leader _group) isNotEqualTo objNull
			},
			{
				params ["_unit", "_group"];
				if ((leader _group) isNotEqualTo _unit) exitWith { /*systemChat format["not leader. Actual leader: %1 | unit: %2", leader _group, _unit];*/ };
				private _newGroup = createGroup east;
				{
					[_x] joinSilent _newGroup;
				} forEach (units _group);				
			},
			[_unit, _group]
		] call CBA_fnc_waitUntilAndExecute;
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventHandler;

// only relevant, when Space Marines are used:

// [
// 	"TIOWSpaceMarine_Base",
// 	"killed",
// 	{
// 		private _unit = _this # 0;
// 		// if !(_unit isKindOf "TIOWSpaceMarine_Base") exitWith {};
// 		private _death = selectRandom ["Marine_Death_1.ogg", "Marine_Death_2.ogg", "Marine_Death_3.ogg", "Marine_Death_4.ogg", "Marine_Death_5.ogg", "Marine_Death_6.ogg", "Marine_Death_7.ogg"];
// 		playSound3D [getMissionPath (["sounds", _death] joinString "\"), _unit, false, getPosASL _unit, 1, 0.9, 500];
// 	}
// ] call CBA_fnc_addClassEventHandler;

// [
// 	"TIOW_O_Ren_B_Base",
// 	"killed",
// 	{
// 		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
// 		if !(_instigator isKindOf "TIOWSpaceMarine_Base") exitWith {};

// 		private _chance = floor random 10;
// 		if (_chance < 8) exitWith {};
// 		private _line = selectRandom ["Deliver_Death.ogg", "Die_Heretics.ogg", "Die_with_shame_Traitor.ogg", "A_waste_of_mankinds_promise.ogg", "Slaughter_Traitors.ogg"];
// 		playSound3D [getMissionPath (["sounds", _line] joinString "\"), _instigator, false, getPosASL _instigator, 1, 0.9, 500];
// 	}
// ] call CBA_fnc_addClassEventHandler;

// [
// 	"TIOW_Priest",
// 	"killed",
// 	{
// 		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
// 		if !(_instigator isKindOf "TIOWSpaceMarine_Base") exitWith {};

// 		private _chance = floor random 10;
// 		if (_chance < 8) exitWith {};
// 		private _line = selectRandom ["Deliver_Death.ogg", "Die_Heretics.ogg", "Die_with_shame_Traitor.ogg", "A_waste_of_mankinds_promise.ogg", "Slaughter_Traitors.ogg"];
// 		playSound3D [getMissionPath (["sounds", _line] joinString "\"), _instigator, false, getPosASL _instigator, 1, 0.9, 500];
// 	}
// ] call CBA_fnc_addClassEventHandler;