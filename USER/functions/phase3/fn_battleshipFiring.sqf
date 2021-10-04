params ["_cannon", "_endPos", ["_projectileType", "TIOW_IG_PlasmaCannon_Rnd"], ["_projectileScale", 20], ["_projectileSpeed", 50], ["_targetToDestroy", objNull]];

// private _cannon = selectRandom ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];
private _ship = player getVariable "GRAD_VM_localBattleship";
private _startPos = AGLToASL (_ship modelToWorld (GRAD_VM_battleship getVariable _cannon));

// private _projectile = "TIOW_IG_PlasmaCannon_Rnd" createVehicleLocal _startPos; 
private _projectile = createSimpleObject ["TIOW_IG_PlasmaCannon_Rnd", _startPos, true];
_projectile setPosASL _startPos;
private _flightVec = _startPos vectorFromTo _endPos;

_projectile setVectorDir _flightVec;
_projectile setVectorUp (_flightVec vectorCrossProduct [_flightVec # 1, _flightVec # 0, 0]);
_projectileSpeed = _flightVec vectorMultiply _projectileSpeed;

private _lightPoint = "#lightpoint" createvehiclelocal _startPos;
_lightPoint setPosASL _startPos;
_lightPoint setLightDayLight true;
_lightPoint setLightColor[0, 0.1, 0.8];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 10000];
_lightPoint setLightBrightness 40;

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
		private _newPos = (getPosASL _projectile) vectorAdd _projectileSpeed;
		_projectile setPosASL _newPos;
		_lightPoint setPosASL _newPos;
		_projectile setObjectScale _projectileScale;
		if (((ASLToAGL _newPos) select 2) < 5) then {
			[_handle] call CBA_fnc_removeperFrameHandler;
			_trueProjectile = "TIOW_IG_PlasmaCannon_Rnd" createVehicleLocal _newPos; 
			_trueProjectile setPosASL _newPos;
			_trueProjectile setVelocity _flightVec;
			deleteVehicle _lightPoint;
			deleteVehicle _projectile;
			if (_targetToDestroy isNotEqualTo objNull) then {
				_targetToDestroy setDamage 1;
			};
		};
	},
	0,
	[_projectile, _flightVec, _projectileScale, _projectileSpeed, _lightPoint, _targetToDestroy]
] call CBA_fnc_addPerFrameHandler;