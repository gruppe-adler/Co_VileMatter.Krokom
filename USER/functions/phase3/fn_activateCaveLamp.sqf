/*
* Spawns a lightpoint to attach to a specific object.
*
* Arguments:
* 0: The lamp <OBJECT>
* 1: The brightness <NUMBER>
*
* Return Value:
* None
*
* Example:
* [lamp1, 5] call Grad_VM_phase3_fnc_activateCaveLamp;
*/

params ["_lamp", "_brightness"];

private _pos = getPos _lamp;
private _lightPoint = "#lightpoint" createvehiclelocal _pos; 
_lightPoint setPosATL (getPosATL _lamp);
// _lightPoint setLightAmbient[204/255, 153/255, 102/255];_lightPoint setLightBrightness 0.4;
// _lightPoint setLightAmbient[204/255, 153/255, 80/255];_lightPoint setLightBrightness _brightness;
_lightPoint setLightAmbient[1, 153/255, 80/255];_lightPoint setLightBrightness _brightness;