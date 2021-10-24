/*

    gives back array of valid teleport targets

*/

params [["_phase", -1]];

diag_log ("GRAD VM getCurrentTeleportTarget 1: " + str _phase);

if (_phase < 0) then {
    _phase = call GRAD_VM_main_fnc_getCurrentPhase;
    _phase = _phase - 1;
};

diag_log ("GRAD VM getCurrentTeleportTarget 2: " + str _phase);

private _result = [];

switch (_phase) do { 
    case 3 : {
        _result = [getPosWorld teleportcenter_phase0];
    };
    case 4 : {
        _result = [getPosWorld teleportcenter_phase0];
    };
    case 0 : {
        _result = [
            getPosWorld teleportcenter_phase1_1,
            getPosWorld teleportcenter_phase1_2,
            getPosWorld teleportcenter_phase1_3,
            getPosWorld teleportcenter_phase1_4
        ];
    };
    case -1 : {
        _result = [
            getPosWorld teleportcenter_phase_minusone;
        ];
    };
    case 1 : {
        _result = [getPosWorld teleportcenter_phase2];
    };
    case 2 : {
        _result = [getPosWorld teleportcenter_phase3];
    };
    default {}; 
};

_result