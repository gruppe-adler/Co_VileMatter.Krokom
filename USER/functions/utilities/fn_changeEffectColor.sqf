params ["_desiredColor", "_currentColor", "_delay"];

if (_desiredColor isEqualTo _currentColor) exitWith {};

player setVariable ["GRAD_VM_currentEffectColor", _currentColor];
player setVariable ["GRAD_VM_desiredEffectColorReached", false];

[
	{
		params ["_args", "_pfhHandle"];
		_args params ["_desiredColor"];
		
		private _currentColor = player getVariable ["GRAD_VM_currentEffectColor", [255,0,0]];
		_desiredColor params ["_redD", "_greenD", "_blueD"];
		_currentColor params ["_red", "_green", "_blue"];

		if ((_redD isEqualTo _red) && (_greenD isEqualTo _green) && (_blue isEqualTo _blueD)) exitWith {
			[_pfhHandle] call CBA_fnc_removePerFrameHandler;
			player setVariable ["GRAD_VM_desiredEffectColorReached", true];
		};

		if (_red < _redD) then { _red = _red + 1; };
		if (_red > _redD) then { _red = _red - 1; };

		if (_green < _greenD) then { _green = _green + 1; };
		if (_green > _greenD) then { _green = _green - 1; };

		if (_blue < _blueD) then { _blue = _blue + 1; };
		if (_blue > _blueD) then { _blue = _blue - 1; };

		player setVariable ["GRAD_VM_currentEffectColor", [_red, _green, _blue]];
	},
	_delay,
	[_desiredColor]
] call CBA_fnc_addPerFrameHandler;

waitUntil { player getVariable ["GRAD_VM_desiredEffectColorReached", false]; };
true