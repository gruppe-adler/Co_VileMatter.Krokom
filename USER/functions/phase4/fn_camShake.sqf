/*
* Adds a slowly increasing camshake to the player's camera.
* 
* Arguments:
* 0: The maximum screen shake that can be reached <NUMBER>
* 1: The delay before the next shake-increase in seconds <NUMBER>
* 2: By how much to increase the shaking (in percentage of maxShake) <NUMBER>
* 
* Return:
* None
*
* Example:
* [5, 15, 4] spawn GRAD_VM_phase4_fnc_camShake;
*/

if !(canSuspend) exitWith { _this spawn GRAD_VM_phase4_fnc_camShake; };

params [["_maxShake", 2.5], ["_sleepTime", 10], ["_increasePercentage", 1]];

enableCamShake true;
 _increasePercentage = _increasePercentage / 100;
_count = 0;
while {true} do {
	if (_count < _maxShake) then {
		_count = _count + (_increasePercentage * _maxShake);
	};
	// systemChat str _count;
	addCamShake [_count, _sleepTime * 10, 35];
	sleep _sleepTime;
};