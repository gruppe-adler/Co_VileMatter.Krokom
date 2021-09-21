params ["_saucer", "_position"];

 private _lightPoint = "#lightpoint" createvehiclelocal _position;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 5; _lightPoint setLightFlareMaxDistance 5000;
_lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 500];
_lightPoint setLightBrightness 10;


[{
    params ["_args", "_handle"];
    _args params ["_lightPoint"];

    
}, 0.1, [_lightPoint]] call CBA_fnc_addPerFramehandler;