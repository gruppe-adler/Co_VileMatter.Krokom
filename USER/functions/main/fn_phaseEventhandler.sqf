if (!isServer) exitWith {};

["grad_VM_phaseControl", {
    params ["_phase", "_phaseStep"];

    private _phaseOriginal = missionNamespace getVariable ["grad_VM_portalPhase", []];
    (_phaseOriginal select 1 select _phase) set [0, _phaseStep];
    _phaseOriginal set [0, _phase];

     // phase change to next phase
    if (_phaseStep == call GRAD_VM_main_fnc_getPhaseMaxProgress) then {
        _phaseOriginal set [0, (_phase + 1)];
    };

    missionNamespace setVariable ["grad_VM_portalPhase", _phaseOriginal, true];
    
}] call CBA_fnc_addEventHandler;

/*

private _grad_VM_portalPhase = [
      0,
      [
        [0,4],
        [0,4],
        [0,4],
        [0,4]
      ]
    ];

*/