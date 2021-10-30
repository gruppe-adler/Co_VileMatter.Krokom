
private _lamps = getMissionLayerEntities "phase0_lamps";

private _pfh = [{
  params ["_args", "_handle"];
  _args params ["_lamps"];

   {
        
        private _lamp = _x;

        _lamp switchLight ["ON", "OFF"] select { !(lightIsOn _x) };

   } forEach _lamps;

}, 0, [_lamps]] call CBA_fnc_addPerFrameHandler;



[{
    params ["_lamps", "_pfh"];

    [_pfh] call CBA_fnc_removePerFrameHandler;
    
}, [_lamps, _pfh], (random 3 max 1)] call CBA_fnc_waitAndExecute;