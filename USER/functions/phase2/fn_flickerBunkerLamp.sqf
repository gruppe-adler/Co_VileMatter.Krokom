params ["_lightPoint"];

if (!canSuspend) exitWith {
  [_lightPoint] spawn GRAD_VM_phase2_fnc_flickerBunkerLamp;
};

for "_i" from 1 to 30 do {
    _lightPoint setLightAmbient[1, 153/255, 80/255];
    _lightPoint setLightBrightness (random 0.15 max 0.1);
    sleep (random 0.01);
};
