if (!isServer) exitWith {};

private _pos = AGLtoASL (phase2_devicestatue modelToWorld [0,1,-0.5]);

private _blondie = createSimpleObject ["Alsatian_Sandblack_F", _pos];
_blondie setDir 96;