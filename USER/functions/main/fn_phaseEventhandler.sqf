if (!isServer) exitWith {};

["grad_VM_phaseControl", {
    params ["_phase", "_phaseStep"];

    private _phaseOriginal = missionNamespace getVariable ["gradVM_portalPhase", []];
    (_phaseOriginal select 1) set [_phase, _phaseStep];
    missionNamespace setVariable ["gradVM_portalPhase", _phaseOriginal, true];

}] call CBA_fnc_addEventHandler;
