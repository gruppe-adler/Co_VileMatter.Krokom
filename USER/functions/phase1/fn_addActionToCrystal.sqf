params ["_crystal"];

_crystal addAction
[
    "Put crystal on pedestal",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        ["GRAD_VM_phaseControl", [1,1]] call CBA_fnc_serverEvent;

        private _position = getPosWorld phase1_pedestal;
        _position set [2, _position#2 + 0.2];
        _target setPosWorld _position;
        // todo set crystal on pedestal
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
