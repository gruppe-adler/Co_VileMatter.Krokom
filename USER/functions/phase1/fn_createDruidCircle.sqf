private _stoneCircle = nearestObjects [phase1_pedestal, ["Land_Bare_boulder_04_F"], 30];


{
    private _pos = getPosWorld _x;

    private _posBetween = _pos getPos [2, _pos getdir phase1_pedestal];

    [_posBetween, (createGroup civilian)] execVM "USER\functions\phase1\fn_dressAndAnimateDruid.sqf"; // GRAD_VM_phase1_fnc_dressAndAnimateDruid;

} forEach _stoneCircle;


[getPos crystal_phase1, (createGroup civilian)] execVM "USER\functions\phase1\fn_dressAndAnimatePushDruid.sqf"; // GRAD_VM_phase1_fnc_dressAndAnimatePushDruid;