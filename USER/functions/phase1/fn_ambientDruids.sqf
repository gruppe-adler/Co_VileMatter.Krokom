private _druids = missionNamespace getVariable ["GRAD_VM_druids", []];

{
    private _unit = _x;
    private _existingSound = _unit getVariable ["GRAD_VM_soundSource", objNull];

    if (!isNull _existingSound) then {
        deleteVehicle _existingSound;
    };

    private _sounds = [
        "phase1_ambient_trance_1_source",
        "phase1_ambient_trance_2_source"
    ];

    private _source = createSoundSource [selectRandom _sounds, position _unit, [], 0];
    _source attachTo [_unit, [0,0,0]];
    _unit setVariable ["GRAD_VM_soundSource", _source];

} forEach _druids;
