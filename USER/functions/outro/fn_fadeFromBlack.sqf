params ["_fadeTime"];

private _display = findDisplay 46;
disableSerialization;
private _mask = player getVariable ["GRAD_VM_outro_currentMask", controlNull];
if (_mask isEqualTo controlNull) then {
	_mask = _display ctrlCreate ["RscText", -1];
};

_mask ctrlSetPosition [safeZoneX,safeZoneY, safeZoneW,safeZoneH];
_mask ctrlSetBackgroundColor [0,0,0,1];
_mask ctrlSetFade 0;
_mask ctrlCommit 0;
_mask ctrlSetFade 1;
_mask ctrlCommit _fadeTime;

[
	{
		params ["_mask"];
		ctrlDelete _mask;
		player setVariable ["GRAD_VM_outro_currentMask", controlNull];
	},
	[_mask],
	_fadeTime + 0.05
] call CBA_fnc_waitAndExecute;