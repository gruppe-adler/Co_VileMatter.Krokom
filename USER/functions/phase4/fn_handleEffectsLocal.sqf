if (!canSuspend) exitWith { _this spawn GRAD_VM_phase4_fnc_handleEffectsLocal; };

private _start = time;
private _sound = playSound ["phase4_earthquake", false];

waitUntil { player inArea [[595.445,702.231,0], 7, 5, 225.261, true, 10] };

private _switch = time;
private _sound2 = playSound ["phase4_earthquake", true, _switch - _start];
deleteVehicle _sound;
10 fadeSpeech 0.9;