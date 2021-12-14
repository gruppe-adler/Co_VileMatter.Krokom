params ["_unit"];

/*
private _torch = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch1.p3d", [0,0,0]];
_torch attachTo [_unit, [0,0,0], "Righthandmiddle1", true];
*/

[{
    params ["_unit"];
    (!alive _unit) 
},{
    params ["_unit"];

    _unit removeWeapon "RM_Fire_torch";
    _unit addWeapon "JMSL_W_Melee_Gladius_1";

}, [_unit]] call CBA_fnc_waitUntilAndExecute;

[_unit] remoteexec ["GRAD_VM_phase1_fnc_addTorchLocal", 0, _unit];
// _lightPoint setLightBrightness 15;
