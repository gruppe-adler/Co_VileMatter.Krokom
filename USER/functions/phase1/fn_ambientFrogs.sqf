private _oldSources = missionNamespace getVariable ["GRAD_VM_phase1_ambientSources", []];

{
    private _existingSound = _x;

    if (!isNull _existingSound) then {
        deleteVehicle _existingSound;
    };

} forEach _oldSources;


private _newSources = [];
{
    private _frogSound = selectRandom ["phase1_ambient_frogs_1_source", "phase1_ambient_frogs_2_source"];
    private _source = createSoundSource [_frogSound, _x, [], 0];
    _newSources pushBack _source;
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

missionNamespace setVariable ["GRAD_VM_phase1_ambientSources", _newSources, true];
