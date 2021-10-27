if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _soundSources = [];
{
    private _source = createSoundSource ["phase1_ambient_frogs", _x, [], 0];
    _soundSources pushBack _source;
    sleep ((random 5) + 0.5);
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


{
    private _owlSound = selectRandom ["phase1_ambient_owl_1", "phase1_ambient_owl_2"];
    private _source = createSoundSource [_owlSound, _x, [], 0];
    _soundSources pushBack _source;
    sleep ((random 5) + 0.5);
} forEach [
    grad_vm_phase1_ambient_owl_1,
    grad_vm_phase1_ambient_owl_2,
    grad_vm_phase1_ambient_owl_3,
    grad_vm_phase1_ambient_owl_4,
    grad_vm_phase1_ambient_owl_5
];

missionNamespace setVariable ["GRAD_VM_phase1_ambientSources", _soundSources, true];