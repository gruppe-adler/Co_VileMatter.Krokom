params ["_object"];


_object addAction
[
    "Hebel bewegen",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script      
        
        
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "true",     // condition
    1,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];