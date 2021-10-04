params ["_switch"];

_switch addAction
[
    "Hebel bewegen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        _target setVariable ['grad_VM_switchUsable', false, true];

        _target animateSource ["Power_1", 1];
        _target animateSource ["Power_2", 1];
        _target animateSource ["SwitchLight", 0];
        _target animateSource ["SwitchPosition", 1];

        ["GRAD_VM_phaseControl", [0, 1]] call CBA_fnc_serverEvent;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_target getVariable ['grad_VM_switchUsable', true]",
    10,
    false,
    "",
    ""
];
