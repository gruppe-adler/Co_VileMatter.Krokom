["GRAD_electricFence_sparkSmall", {
    params ["_fence", "_position"];
    
    if (!isGameFocused || isGamePaused) exitWith {}; // stop multi firing

    [_fence, _position] call grad_VM_phase0_fnc_sparkSmall;

}] call CBA_fnc_addEventHandler;