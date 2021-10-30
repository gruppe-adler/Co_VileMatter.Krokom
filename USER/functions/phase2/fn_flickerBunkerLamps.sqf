params ["_lamps"];


addCamShake [(random 10 max 1), (random 2 max 1), (random 25 max 10)];

for "_i" from 1 to (random 30 max 20) do {

    private _brightness = (random 0.2 max 0.1);
    {
        
        private _lamp = _x;
        private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

        _lightPoint setLightBrightness _brightness;

    } forEach _lamps;

    sleep (random 0.01);
};

// normalize again
private _brightness = 0.42;
{
    
    private _lamp = _x;
    private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

    _lightPoint setLightBrightness _brightness;

} forEach _lamps;