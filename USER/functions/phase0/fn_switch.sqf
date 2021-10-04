params ["_switch"];

_switch addAction
[
    "Hebel bewegen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        _target setVariable ['gradVM_switchUsable', false, true];

        _target animateSource ["Power_1", 1];
        _target animateSource ["Power_2", 1];
        _target animateSource ["SwitchLight", 0];
        _target animateSource ["SwitchPosition", 1];

        [0, 1] call CBA_fnc_serverEvent;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_target getVariable ['gradVM_switchUsable', true]",
    10,
    false,
    "",
    ""
];
