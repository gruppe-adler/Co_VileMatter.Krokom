params ["_unit"];

objNull remoteControl _unit;     // removes the remoteControlling

_handgun = handgunWeapon _unit;
if (_handgun == "") exitWith {};

private _animation = "murshun_ActsPercMstpSnonWpstDnon_suicide1B";

[_unit, _animation] remoteExec ["switchMove"];

_unit selectWeapon handgunWeapon _unit;


sleep 3.9;

sleep 0.5;

_unit addEventHandler ["Fired", {
    params ["_unit"];
    [{
        _this setDamage 1;
    }, _unit, 0.2] call CBA_fnc_waitAndExecute;
    _unit removeEventHandler ["Fired", _thisEventHandler];
}];

_unit forceWeaponFire [handgunWeapon _unit, "Single"];    
[_unit, "LIB_P08"] call BIS_fnc_fire;
