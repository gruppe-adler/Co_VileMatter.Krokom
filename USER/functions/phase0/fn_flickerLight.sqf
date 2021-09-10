/*

  [this] call GRAD_VM_phase0_fnc_flickerLight;

*/

params ["_lamp"];

if (!isServer) exitWith {};

[{
    params ["_args", "_handle"];
    _args params ["_lamp"];

    if (random 1 > 0.2) then {
        _lamp setDamage 0.91;
    } else {
        _lamp setDamage 0;
    };

    if (!alive _lamp) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.1, [_lamp]] call CBA_fnc_addPerFrameHandler;
