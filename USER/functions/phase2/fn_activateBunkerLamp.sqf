params ["_lamp", "_brightness"];

private _pos = getPos _lamp;
private _lightPoint = "#lightpoint" createvehiclelocal _pos; 
_lightPoint setPosATL (getPosATL _lamp);
// _lightPoint setLightAmbient[204/255, 153/255, 102/255];_lightPoint setLightBrightness 0.4;
// _lightPoint setLightAmbient[204/255, 153/255, 80/255];_lightPoint setLightBrightness _brightness;
_lightPoint setLightAmbient[1, 153/255, 80/255];_lightPoint setLightBrightness _brightness;

_lamp setVariable ["GRAD_VM_phase2_lightPoint", _lightPoint];