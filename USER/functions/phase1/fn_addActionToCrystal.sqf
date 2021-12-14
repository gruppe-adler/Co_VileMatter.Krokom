params ["_crystal"];

_crystal addAction
[
    "Push crystal onto pedestal",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        ["GRAD_VM_ACTION_start", [
            _target,
            player,
            "GRAD_VM_ACTION_TELEPORT_PHASE1"
        ]] call CBA_fnc_serverEvent;
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "[1] call GRAD_VM_main_fnc_getPhaseProgress < 1",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];
