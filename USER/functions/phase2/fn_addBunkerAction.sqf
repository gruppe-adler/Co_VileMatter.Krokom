params ["_object"];


_object addAction
[
    "Jump into bunker (no way back!)",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_caller, "GetOutHelicopterCargoRfl"] remoteexec ["switchMove"];
        
        [{
            ((getPos bunkerEntry) getPos [random 5, random 360]) params ["_xPos", "_yPos"];
            _this setPos [_xPos, _yPos, 0.5];
            [_this, ""] remoteexec ["switchMove"];
        }, _caller, 2] call CBA_fnc_waitAndExecute;
        
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "true",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];