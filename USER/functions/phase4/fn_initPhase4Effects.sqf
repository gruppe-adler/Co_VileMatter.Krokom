if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

[] remoteExec ["GRAD_VM_phase4_fnc_handleRockShowers", [0, -2] select isMultiplayer];
["phase4_earthquake"] remoteExec ["playSound", [0, -2] select isMultiplayer];
[2.5, 0.3, 1] remoteExec ["GRAD_VM_phase4_fnc_camShake", [0, -2] select isMultiplayer];