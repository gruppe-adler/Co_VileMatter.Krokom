if (!canSuspend) exitWith { _this spawn GRAD_VM_phase4_fnc_handleEffectsLocal; };

private _start = time;
private _sound = playSound ["phase4_earthquake", false];

waitUntil { !(player inArea [[674.831,755.433,0], 175, 100, 224.917, true, 200]) };

private _switch = time;
private _sound2 = playSound ["phase4_earthquake", true, _switch - _start];
deleteVehicle _sound;
10 fadeSpeech 0.9;
player setVariable ["phase4_earthquake", _sound2];