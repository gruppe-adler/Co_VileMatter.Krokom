params ["_switch"];

_switch addAction
[
    "Move Lever",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        ["GRAD_VM_ACTION_start", [
            _target,
            player,
            "GRAD_VM_ACTION_TELEPORT_PHASE0"
        ]] call CBA_fnc_serverEvent;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "[0] call GRAD_VM_main_fnc_getPhaseProgress < 1",
    10,
    false,
    "",
    ""
];
