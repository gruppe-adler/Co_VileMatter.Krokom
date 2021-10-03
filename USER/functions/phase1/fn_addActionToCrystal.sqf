params ["_crystal"];

_crystal addAction
[
    "Put crystal on pedestal",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        gradVM_portalPhase_1 = 1;
        publicVariable "gradVM_portalPhase_1";

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
    "gradVM_portalPhase_1 < 1",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];
