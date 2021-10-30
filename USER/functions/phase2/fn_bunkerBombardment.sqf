if (!isServer) exitWith {};

if (!isNil "GRAD_VM_phase2_bunkerBombardment") exitWith {};
GRAD_VM_phase2_bunkerBombardment = true;

private _phase2Lamps = [
 Grad_VM_bunkerLamp_1,
 Grad_VM_bunkerLamp_2,
 Grad_VM_bunkerLamp_3,
 Grad_VM_bunkerLamp_4,
 Grad_VM_bunkerLamp_5,
 Grad_VM_bunkerLamp_6,
 Grad_VM_bunkerLamp_7,
 Grad_VM_bunkerLamp_8,
 Grad_VM_bunkerLamp_9,
 Grad_VM_bunkerLamp_10,
 Grad_VM_bunkerLamp_11,
 Grad_VM_bunkerLamp_12];
{
    private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
    [_x, _brightness] remoteExec ["Grad_VM_phase2_fnc_activateBunkerLamp", [0, -2] select isMultiplayer];
} forEach _phase2Lamps;
