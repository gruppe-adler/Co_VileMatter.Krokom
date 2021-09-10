if (!isServer) exitWith {};

params [["_startObject", ropeStart_1], ["_middleObject", ropeMiddle_1], ["_endObject", ropeEnd_1]];

private _ropeStart = "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeStart allowDamage false;
_ropeStart hideObject true;
_ropeStart setPosATL (getPosATL _startObject);
// _ropeStart attachTo [ropeStart_1, [0,0,0]];

private _ropeMiddle= "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeMiddle allowDamage false;
_ropeMiddle hideObject true;
_ropeMiddle setPosATL (getPosATL _middleObject);
// _ropeMiddle attachTo [ropeMiddle_1, [0,0,7]];

private _ropeEnd = "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeEnd allowDamage false;
_ropeEnd hideObject true;
_ropeEnd setPosATL (getPosATL _endObject);
// _ropeEnd attachTo [ropeEnd_1, [0,0,0]];

private _rope = ropeCreate [
    _ropeStart, [0, 0, 0],
    _ropeMiddle, [0, 0, -0.2],
    ((_startObject distance _middleObject) - 0.1)
];

private _rope2 = ropeCreate [
    _ropeMiddle, [0, 0, -0.2],
    _ropeEnd, [0, 0, 0],
    34,
    [], ["RopeEnd", [0,0,-1]]
];
