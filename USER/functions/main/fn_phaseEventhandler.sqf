if (!isServer) exitWith {};

["grad_VM_phaseControl", {
    params ["_phase", "_phaseStep"];

    private _phaseOriginal = missionNamespace getVariable ["grad_VM_portalPhase", []];
    (_phaseOriginal select 1 select _phase) set [0, _phaseStep];
    missionNamespace setVariable ["grad_VM_portalPhase", _phaseOriginal, true];

}] call CBA_fnc_addEventHandler;
