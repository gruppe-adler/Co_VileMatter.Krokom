params ["_lamps", "_duration"];


addCamShake [(random 10 max 1), (random 2 max 1), (random 25 max 10)];


private _handle = 
[
    {
        params ["_args", "_handle"];
        _args params ["_lamps"];

        private _brightness = (random 0.35 max 0.1);
        {
            
            private _lamp = _x;
            private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

            _lightPoint setLightBrightness _brightness;

        } forEach _lamps;
    },
    0.1,
    [_lamps]
] call CBA_fnc_addPerFrameHandler;

[
    {
        params ["_lamps", "_handle"];

        [_handle] call CBA_fnc_removePerFrameHandler;
        private _brightness = 0.42;
        {
            
            private _lamp = _x;
            private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

            _lightPoint setLightBrightness _brightness;

        } forEach _lamps;
    },
    [_lamps, _handle],
    _duration
] call CBA_fnc_waitAndExecute;

// for "_i" from 1 to (random 30 max 20) do {

//     private _brightness = (random 0.2 max 0.1);
    // {
        
    //     private _lamp = _x;
    //     private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

    //     _lightPoint setLightBrightness _brightness;

    // } forEach _lamps;

//     sleep (random 0.01);
// };

// normalize again
