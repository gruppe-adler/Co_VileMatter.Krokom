if (!isServer) exitWith {};

params ["_object"];

private _ropeAnchor = "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeAnchor allowDamage false;
_ropeAnchor hideObject true;
_ropeAnchor setPos (getPos _object);

ropeCreate [_ropeAnchor, [0,0,0], objNull, [0,0,0], 20, [], ["RopeEnd", [0,0,-1]]];