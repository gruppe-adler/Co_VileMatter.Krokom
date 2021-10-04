["gradVM_phaseControl", {
    params ["_phase", "_phaseStep"];

    _phase params ["_currentPhase", "_phaseSteps"];

    switch (_phase) do {

        // init phase
        case (0): {
            private _call = "GRAD_VM_main_fnc_phase" + (str _phase);
            call compile _call;
        };

        default {};
    };

    _phase set [_phase, _phaseStep];
    missionNamespace setVariable ["gradVM_portalPhase", [_currentPhase, _phase], true];

}] call CBA_fnc_addEventHandler;
