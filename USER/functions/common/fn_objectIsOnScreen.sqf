/*
 * Checks whether a object is visible for the player.
 *
 * Arguments:
 * The target object / position <OBJECT> or <ARRAY>
 *
 * Return Value:
 * The object can be seen <BOOL>
 *
 * Example:
 * [monster] call Grad_VM_fnc_objectIsOnScreen;
 */

params ["_target"];

private _targetPos = _target;
private _ignore = objNull;
if ((typeName _target) isEqualTo "OBJECT") then {
	_targetPos = getPos _target;
	_ignore = _target;
};

private _posOnScreen = worldToScreen _targetPos;
if (_posOnScreen isEqualTo []) exitWith {
	false
};

private _xPos = _posOnScreen select 0;
private _yPos = _posOnScreen select 1;
private _xVisible = (_xPos > safeZoneX * 2.2) && (_xPos < (safeZoneX + safeZoneW) * 2.2);
private _yVisible = (_yPos > safeZoneY * 1.7) && (_yPos < (safeZoneY + safeZoneH) * 1.7);
if !(_xVisible && _yVisible) exitWith {
	false
};

// in case an object blocks the view, but worldToScreen still returns coordinates
private _visibility = [_ignore, "VIEW"] checkVisibility [eyePos player, AGLtoASL _targetPos];
if (_visibility isEqualTo 0) exitWith {
	systemChat "blub";
	false
};

true