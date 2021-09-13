params ["_orb", "_lightpoint", "_targetPos"];

[
	{
		params ["_args", "_handle"];
		_args params ["_orb", "_lightpoint", "_targetPos"];

		private _color = [((random 255) + 1) / 255, ((random 255) + 1) / 255, ((random 255) + 1) / 255];
		_lightpoint setLightColor _color;
		_lightpoint setLightAmbient _color;

		private _orbPos = getPos _orb;

		if ((_orbPos distance _targetPos) <= 1) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		private _newPos = _orbPos getPos [2, (_orbPos getDir _targetPos)];
		// _newPos = AGLToASL _newPos;
		_newPos set [2, _targetPos # 2];
		_orb setPos _newPos;
		_lightpoint setPos _newPos;

		private _minLifetime = 2;
		private _maxLifetime = 3;

		drop [
		/*0*/	["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],
		/*1*/	"",
		/*2*/	"Billboard",
		/*3*/	0.2,
		/*4*/	_minLifetime + random (_maxLifetime - _minLifetime),
		/*5*/	[1,1,0],
		/*6*/	[0,0,0],
		/*7*/	0,
		/*8*/	9,
		/*9*/	7,
		/*10*/	0,
		/*11*/	[0.5,30,0.5],
		/*12*/	[[0,0,0,0],
		/*13*/	[0,0,0,1],
		/*14*/	[0,0,0,0]],
		/*15*/	[1],
		/*16*/	0,
		/*17*/	0,
		/*18*/	"",
		/*19*/	"",
		/*20*/	_orb
		];
	},
	0,
	[_orb, _lightpoint, _targetPos]
] call CBA_fnc_addPerFrameHandler;