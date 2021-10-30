if (!isServer) exitWith {};
if (isNull GRAD_VM_keypadDoor) exitWith {};

private _position = getPosWorld GRAD_VM_keypadDoor;
private _dir = getDir GRAD_VM_keypadDoor;

private _unlockedDoor = createVehicle ["Land_JMS_Tech_cor_door", _position, [], 0, "NONE"];
_unlockedDoor setDir _dir;
_unlockedDoor setPosWorld _position;

_unlockedDoor hideObjectGlobal true;
missionNamespace setVariable ["GRAD_VM_phase0_unlockedDoor", _unlockedDoor, true];
