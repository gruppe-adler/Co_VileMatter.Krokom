params ["_lamps"];


addCamShake [(random 10 max 1), (random 2 max 1), (random 25 max 10)];
{
    
    private _lamp = _x;
    private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

    [_lightPoint] spawn GRAD_VM_phase2_fnc_flickerBunkerLamp;

} forEach _lamps;