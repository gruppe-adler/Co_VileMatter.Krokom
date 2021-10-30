if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _soundSources = [];
{
    private _frogSound = selectRandom ["phase1_ambient_frogs_1_source", "phase1_ambient_frogs_2_source"];
    private _source = createSoundSource [_frogSound, _x, [], 0];
    _soundSources pushBack _source;
    _x setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
} forEach [
    grad_vm_phase1_ambient_frogs_1,
    grad_vm_phase1_ambient_frogs_2,
    grad_vm_phase1_ambient_frogs_3,
    grad_vm_phase1_ambient_frogs_4,
    grad_vm_phase1_ambient_frogs_5,
    grad_vm_phase1_ambient_frogs_6,
    grad_vm_phase1_ambient_frogs_7,
    grad_vm_phase1_ambient_frogs_8
];

missionNamespace setVariable ["GRAD_VM_phase1_ambientSources", _soundSources, true];


private _owls = [
    grad_vm_phase1_ambient_owl_1,
    grad_vm_phase1_ambient_owl_2,
    grad_vm_phase1_ambient_owl_3,
    grad_vm_phase1_ambient_owl_4,
    grad_vm_phase1_ambient_owl_5
];

{
    _x setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
} forEach _owls;



[{
    params ["_args", "_handle"];
    _args params ["_owls"];

    if (count (missionNamespace getVariable ["GRAD_VM_phase1_ambientSources", []]) == 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (random 5 > 4) then {
        [selectRandom _owls, [selectRandom [
            "phase1_ambient_owl_1",
            "phase1_ambient_owl_2",
            "phase1_ambient_owl_3",
            "phase1_ambient_owl_4",
            "phase1_ambient_owl_5",
            "phase1_ambient_owl_6",
            "phase1_ambient_owl_7",
            "phase1_ambient_owl_8",
            "phase1_ambient_owl_9",
            "phase1_ambient_owl_10"
        ], 1000]] remoteExec ["say3D"];
    };

}, 3, [_owls]] call CBA_fnc_addPerFrameHandler;