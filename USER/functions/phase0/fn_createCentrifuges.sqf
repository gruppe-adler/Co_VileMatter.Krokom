/*
    [position cursorObject, 20, 20, 1] execvm "USER\functions\phase0\fn_createCentrifuges.sqf";
*/
if (!isServer) exitWith {};

params ["_object", "_scale"];

[_object, _scale] call GRAD_VM_common_fnc_setObjectScaleSafe;
