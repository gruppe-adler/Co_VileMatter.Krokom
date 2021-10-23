params ["_minion"];

_minion addAction
[
    "Panic Panic Panic",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target, "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon"] remoteExec ["switchMove"];
    },
    nil,        // arguments
    1.5,        // priority
    false,      // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "_target == _this && murshun_easywayout_canSuicide && !murshun_suicideInProgress && alive _target",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];

