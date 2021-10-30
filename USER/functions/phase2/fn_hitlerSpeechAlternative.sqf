params ["_hitler"];

if (missionNameSpace getVariable ["GRAD_VM_phase2_hitlerSpeechActive", false]) exitWith {};

private _startTime = time;
private _speech = _hitler say3D ["Hitler_Monolog_far", 300, 1, true, 0];

waitUntil { (_hitler distance player) <=  115 || count ((missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", []]) > 0)};
private _break = time;
deleteVehicle _speech;
private _speech = _hitler say3D ["Hitler_Monolog_close", 300, 1, true, (_break - _startTime)];
// systemChat "switched from 'far' to 'close'";

waitUntil { (_hitler distance player) <=  67 && gate_bunker_adi animationPhase "door_1_rot" != 1 || count ((missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", []]) > 0) };

if (count (missionNamespace getVariable ["GRAD_VM_hitlerSoundCache", []] > 0)) exitWith {};
private _break = time;
deleteVehicle _speech;
private _speech = _hitler say3D ["Hitler_Monolog_default", 300, 1, true, (_break - _startTime)];
// systemChat "switched from 'close' to 'default'";

