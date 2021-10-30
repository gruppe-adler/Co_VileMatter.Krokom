params ["_lamps"];


addCamShake [(random 10 max 1), (random 2 max 1), (random 25 max 10)];

private _pfh = [{
  params ["_args", "_handle"];
  _args params ["_lamps"];

   private _brightness = (random 0.41 max 0.3);
   {
        
        private _lamp = _x;
        private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

        _lightPoint setLightBrightness _brightness;

   } forEach _lamps;

   private _onOff = selectRandom ["ON", "OFF"];
   {
        _x switchLight _onOff;
   } forEach [ceilinglamp_bunker_1, ceilinglamp_bunker_2, ceilinglamp_bunker_3, ceilinglamp_bunker_4];

}, 0, [_lamps]] call CBA_fnc_addPerFrameHandler;





[{
    params ["_lamps", "_pfh"];

    [_pfh] call CBA_fnc_removePerFrameHandler;

    // normalize again
    private _brightness = 0.42;
    {
        
        private _lamp = _x;
        private _lightPoint = _lamp getVariable ["GRAD_VM_phase2_lightPoint", objNull];

        _lightPoint setLightBrightness _brightness;

    } forEach _lamps;

    {
        _x switchLight "ON";
   } forEach [ceilinglamp_bunker_1, ceilinglamp_bunker_2, ceilinglamp_bunker_3, ceilinglamp_bunker_4];
    
}, [_lamps, _pfh], (random 3 max 1)] call CBA_fnc_waitAndExecute;

