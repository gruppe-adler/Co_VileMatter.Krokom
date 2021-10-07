/*
* Starts the battleships firing-loop. It will fire until the end of the phase
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Grad_VM_phase3_fnc_startBattleshipBarrage;
*/

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, [0, -2] select isMultiplayer]; };

while { ([] call GRAD_VM_main_fnc_getCurrentPhase) isEqualTo 3 } do {
	private _targetPos = GRAD_VM_barrageArea call BIS_fnc_randomPosTrigger;
	if (_targetPos inArea GRAD_VM_barrageExclusionArea) then { continue };
	_targetPos = AGLToASL _targetPos;
	private _cannon = selectRandom ["GRAD_VM_cannonPos_1", "GRAD_VM_cannonPos_2", "GRAD_VM_cannonPos_3", "GRAD_VM_cannonPos_4"];

	[_cannon, _targetPos] remoteExecCall ["Grad_VM_phase3_fnc_battleshipFiring", [0, -2] select isMultiplayer];

	sleep ((random 5) + 3);
};