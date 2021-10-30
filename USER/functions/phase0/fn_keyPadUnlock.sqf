private _unlockedDoor = (missionNamespace getVariable ["GRAD_VM_phase0_unlockedDoor", objNull]);

_unlockedDoor hideObjectGlobal false;

[_unlockedDoor, 'Door_1_rot'] call BIS_fnc_DoorNoHandleOpen;

GRAD_VM_keypadDoor hideObjectGlobal true;