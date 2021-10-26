params ["_adi"];


_adi addAction
[
    "Force Dress Hitler",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target, "adi_identity"] remoteExec ["setIdentity", 0, _target];
        [_target, "adi_face"] remoteExec ["setFace", 0, _target];
    },
    nil,        // arguments
    1.5,        // priority
    false,      // showWindow
    false,       // hideOnUse
    "",         // shortcut
    "_target == _this && alive _target",     // condition
    50,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];


_adi addAction
[
    "Die now",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target] remoteExec ["GRAD_VM_phase2_fnc_suicideHitler", 2];
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



_adi addAction
[
    "Staccato Speech now",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeech", 2];
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


_adi addAction
[
    "Long Speech now",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeechAlternative", [0,-2] select isDedicated];
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