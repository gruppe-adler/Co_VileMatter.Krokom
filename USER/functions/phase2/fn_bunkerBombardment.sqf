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
    Grad_VM_bunkerLamp_13
 ];

{
    private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
    [_x, _brightness] remoteExec ["Grad_VM_phase2_fnc_activateBunkerLamp", [0, -2] select isMultiplayer];
} forEach _phase2Lamps;


while {GRAD_VM_phase2_bunkerBombardment} do {

    [_phase2Lamps] remoteExec ["Grad_VM_phase2_fnc_flickerBunkerLamps", [0, -2] select isMultiplayer];    

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
    playSound3D [getMissionPath ("USER\sounds\" + _soundExpl) + ".ogg", _lamp, false, [_posX, _posY, _posZ + 50], 1, 1, 0];

    sleep (1);
    playSound3D [getMissionPath ("USER\sounds\" + _soundDust) + ".ogg", _lamp, false, [_posX, _posY, _posZ], 1, 1, 0];

    sleep (random 20 max 3);
};