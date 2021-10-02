if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };
// if !(canSuspend) exitWith { _this spawn Grad_VM_fnc_startBattleshipBarrage; };

while {true} do {
	private _targetPos = GRAD_VM_barrageArea call BIS_fnc_randomPosTrigger;
	if (_targetPos inArea GRAD_VM_barrageExclusionArea) then { continue };
	_targetPos = AGLToASL _targetPos;
	private _cannon = selectRandom ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];
	// private _cannonPos = AGLToASL (GRAD_VM_battleship modelToWorld (GRAD_VM_battleship getVariable _cannon));

	[_cannon, _targetPos] remoteExec ["Grad_VM_phase3_fnc_battleshipFiring", [0, -2] select isMultiplayer];

	sleep ((random 4) + 3);
};