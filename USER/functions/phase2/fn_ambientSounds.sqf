if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _soundSources = [];
{
	private _source = createSoundSource ["phase2_ambient_Sound", _x, [], 0];
	_soundSources pushBack _source;
	sleep ((random 5) + 0.5);
} forEach [
	GRAD_VM_phase2_ambient_1, 
	GRAD_VM_phase2_ambient_2, 
	GRAD_VM_phase2_ambient_3, 
	GRAD_VM_phase2_ambient_4, 
	GRAD_VM_phase2_ambient_5, 
	GRAD_VM_phase2_ambient_6,
	GRAD_VM_phase2_ambient_7
];

missionNamespace setVariable ["GRAD_VM_phase2_ambientSources", _soundSources, true];