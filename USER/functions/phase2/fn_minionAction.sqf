params ["_minion"];

_minion addAction
[
    "Panic Panic Panic",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target, "ApanPercMrunSnonWnonDf"] remoteExec ["switchMove"];
    },
    nil,        // arguments
    1.5,        // priority
    false,      // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "_target == _this && alive _target",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];

