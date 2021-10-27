if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// [] remoteExec ["GRAD_VM_phase4_fnc_handleRockShowers", [0, -2] select isMultiplayer];
[] call GRAD_VM_phase4_fnc_handleRockShowers;
[] remoteExec ["GRAD_VM_phase4_fnc_handleEffectsLocal", [0, -2] select isMultiplayer];
[2.5, 0.3, 1] remoteExec ["GRAD_VM_phase4_fnc_camShake", [0, -2] select isMultiplayer];

private _gods = [];
{
	_gods pushBackUnique (getAssignedCuratorUnit _x);
} forEach allCurators;

[{
	private _arrow = "Sign_Arrow_Blue_F" createVehicleLocal [660.137,743.232,288.36];
	_arrow setPosASL [660.137,743.232,288.36];
}] remoteExec ["call", _gods];