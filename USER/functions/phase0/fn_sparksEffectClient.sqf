["GRAD_electricFence_sparkSmall", {
    params ["_fence", "_position"];
    
    if (!isGameFocused || isGamePaused) exitWith {}; // stop multi firing

    [_fence, _position] spawn grad_VM_fnc_sparkSmall;

}] call CBA_fnc_addEventHandler;