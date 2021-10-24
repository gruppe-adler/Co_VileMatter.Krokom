private _lightPoint = "#lightpoint" createVehicleLocal (getPos lightSourcephase0);
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare false;
_lightPoint setLightFlareSize 3; _lightPoint setLightFlareMaxDistance 5000;
_lightPoint setLightAmbient[1,0,0]; _lightPoint setLightColor[1,0,0];
_lightPoint setLightAttenuation [18, 5.6, 0, 15.8];
_lightPoint setLightBrightness 1;

[{
    deleteVehicle _this;
}, _lightPoint, 3] call CBA_fnc_waitAndExecute;