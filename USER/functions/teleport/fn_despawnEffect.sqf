params ["_position"];

private _lightPoint = "#lightpoint" createvehiclelocal _position;
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 10; _lightPoint setLightFlareMaxDistance 5000;   
_lightPoint setLightAmbient[0.5,0.5,1]; _lightPoint setLightColor[0.5,0.7,0.9];
_lightPoint setLightAttenuation [0, 0, 0, 0, 0, 4000];
_lightPoint setLightBrightness 3;

_lightPoint say3D "grad_VM_teleport2";

for "_i" from 1 to 5 do {

    [{
        params ["_lightPoint"];

        if (!isNull _lightPoint) then {
            _lightPoint setLightFlareSize 10/_i;
            _lightPoint setLightBrightness 10/_i;
        };

    }, [_lightPoint], _i/5]  call CBA_fnc_waitAndExecute;
};

[{
    params ["_lightPoint"];

    _lightPoint setLightBrightness 0;
    _lightPoint setLightFlareSize 0;
}, [_lightPoint], 1]  call CBA_fnc_waitAndExecute;


[{
    params ["_lightPoint"];

    deleteVehicle _lightPoint;
}, [_lightPoint], 5]  call CBA_fnc_waitAndExecute;