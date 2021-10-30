if (!isServer) exitWith {};
if (!canSuspend) exitWith {
    [] spawn GRAD_VM_phase2_fnc_bunkerBombardment;
};

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
    Grad_VM_bunkerLamp_12,
    Grad_VM_bunkerLamp_13,
    Grad_VM_bunkerLamp_14,
    Grad_VM_bunkerLamp_15,
    Grad_VM_bunkerLamp_16,
    Grad_VM_bunkerLamp_17,
    Grad_VM_bunkerLamp_18,
    Grad_VM_bunkerLamp_19,
    Grad_VM_bunkerLamp_20,
    Grad_VM_bunkerLamp_21,
    Grad_VM_bunkerLamp_22,
    Grad_VM_bunkerLamp_23,
    Grad_VM_bunkerLamp_24,
    Grad_VM_bunkerLamp_25,
    Grad_VM_bunkerLamp_26
 ];

 private _ceilingLamps = [ceilinglamp_bunker_1, ceilinglamp_bunker_2, ceilinglamp_bunker_3, ceilinglamp_bunker_4];

{
    private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
    [_x, _brightness] remoteExec ["Grad_VM_phase2_fnc_activateBunkerLamp", [0, -2] select isMultiplayer];
} forEach (_phase2Lamps + _ceilingLamps);


while {GRAD_VM_phase2_bunkerBombardment} do {

    [(_phase2Lamps + _ceilingLamps)] remoteExec ["Grad_VM_phase2_fnc_flickerBunkerLamps", [0, -2] select isMultiplayer];    

    private _soundExpl = selectRandom [
            "phase2_bunker_expl_1",
            "phase2_bunker_expl_2",
            "phase2_bunker_expl_3",
            "phase2_bunker_expl_4",
            "phase2_bunker_expl_5"
    ];

    private _soundDust = selectRandom [
            "phase2_bunker_dust_1",
            "phase2_bunker_dust_2",
            "phase2_bunker_dust_3"
    ];
    private _lamp = selectRandom _phase2Lamps;
    private _position = (getPosASL _lamp) params ["_posX", "_posY", "_posZ"];
    playSound3D [getMissionPath ("USER\sounds\" + _soundExpl) + ".ogg", _lamp, false, [_posX, _posY, _posZ + 10], 5, 1, 1000];

    sleep (1);
    [[_posX+random 2-random 4, _posY+random 2-random 4, _posZ + 3]] remoteExec ["GRAD_VM_phase2_fnc_spawnDust"];
    playSound3D [getMissionPath ("USER\sounds\" + _soundDust) + ".ogg", _lamp, false, [_posX, _posY, _posZ + 10], 5, 1, 1000];

    sleep (random 20 max 3);
};