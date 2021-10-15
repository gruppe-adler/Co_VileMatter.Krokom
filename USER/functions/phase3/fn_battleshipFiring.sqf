/*
* Fires a scaled Projectile from a specific cannon of the Battleship in phase 3.
* The function has to be called locally!
* For some reason (haven't figured it out yet), the proejctile can impact up to 50m away from the given _endPos.
*
* Arguments:
* 0: The cannon <OBJECT>
* 1: The target position (ASL) <ARRAY>
* 2: The projectile class (optional) <STRING>
* 3: The scale of the projectile (optional) <NUMBER>
* 4: The speed of the projectile in meters moved per frame (optional) <NUMBER>
* 5: An objet that should be destroyed on projectile impac (optional) <OBJECT>
*
* Return Value:
* None
*
* Example:
* [GRAD_VM_cannonPos_1, [420, 96, 42], "Super_duper_mega_bullet", 10, 20, stupidAA1] call Grad_VM_phase3_fnc_battleshipFiring;
*/

#include "scriptMacros.hpp"

params ["_cannon", "_endPos", ["_projectileType", "TIOW_IG_PlasmaCannon_Rnd"], ["_projectileScale", 20], ["_projectileSpeed", 50], ["_targetToDestroy", objNull]];

// getting the local battleship and relative cannon position
private _ship = player getVariable "GRAD_VM_localBattleship";
private _startPos = AGLToASL (_ship modelToWorld (GRAD_VM_battleship getVariable _cannon));

// creating the projectile and calculating the flight vector
private _projectile = createSimpleObject ["TIOW_IG_PlasmaCannon_Rnd", _startPos, true];
_projectile setPosASL _startPos;
private _flightVec = _startPos vectorFromTo _endPos;

// Set the projectiles initial orientation
_projectile setVectorDir _flightVec;
_projectile setVectorUp (_flightVec vectorCrossProduct [_flightVec # 1, _flightVec # 0, 0]);
_projectileSpeed = _flightVec vectorMultiply _projectileSpeed;

// create artificial light that the projectile emmits
private _lightPoint = "#lightpoint" createVehicleLocal _startPos;
_lightPoint setPosASL _startPos;
_lightPoint setLightDayLight true;
_lightPoint setLightColor[0, 0.1, 0.8];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 10000];
_lightPoint setLightBrightness 40;

// A pfh to move the projectile (and lightpoint) and to destroy the given _targetToDestroy on impact (including crew).
[
	{
		params ["_args", "_handle"];
		_args params ["_projectile", "_flightVec", "_projectileScale", "_projectileSpeed", "_lightPoint", "_targetToDestroy"];

		if (isNull _projectile) exitWith {
			[_handle] call CBA_fnc_removeperFrameHandler;
			deleteVehicle _lightPoint;
		};
		_projectile setVectorDir _flightVec;
		_projectile setVectorUp (_flightVec vectorCrossProduct [_flightVec # 1, _flightVec # 0, 0]);
		private _newPos = (getPosASL _projectile) vectorAdd PROJECTILE_SPEED_METERS;
		_projectile setPosASL _newPos;
		_lightPoint setPosASL _newPos;
		_projectile setObjectScale _projectileScale;
		if (((ASLToAGL _newPos) select 2) < 5) then {
			[_handle] call CBA_fnc_removeperFrameHandler;
			// _trueProjectile = "TIOW_IG_PlasmaCannon_Rnd" createVehicleLocal _newPos;
			// _trueProjectile setPosASL _newPos;
			// _trueProjectile setVelocity _flightVec;
			deleteVehicle _lightPoint;
			deleteVehicle _projectile;
			if ((_targetToDestroy isNotEqualTo objNull) && (alive _targetToDestroy)) then {
				{
					deleteVehicle _x;	
				} forEach (crew _targetToDestroy);
				_targetToDestroy setDamage 1;
			};
		};
	},
	0,
	[_projectile, _flightVec, _projectileScale, _projectileSpeed, _lightPoint, _targetToDestroy]
] call CBA_fnc_addPerFrameHandler;