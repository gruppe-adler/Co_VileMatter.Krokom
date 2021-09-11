params ["_unit"];

/*
private _torch = createSimpleObject ["\medieval_Torch_weapon\Medieval_torch1.p3d", [0,0,0]];
_torch attachTo [_unit, [0,0,0], "Righthandmiddle1", true];
*/

[{
    params ["_unit"];
    (!alive _unit) 
},{
    params ["_unit"];

    _unit removeWeapon "RM_Fire_torch";
    _unit addWeapon "JMSL_W_Melee_Gladius_1";

}, [_unit]] call CBA_fnc_waitUntilAndExecute;


private _fire = "#particlesource" createVehicleLocal [0,0,0];   
_fire setParticleClass "SmallFireBarrel";
_fire attachTo [_unit, [0,0.6,0],"Righthandmiddle1", true];


private _lightColor = [1,0.28,0.05];

private _lightPoint = "#lightpoint" createvehiclelocal [0,0,0];
_lightPoint setLightDayLight true;_lightPoint setLightUseFlare true;
_lightPoint setLightFlareSize 1; _lightPoint setLightFlareMaxDistance 1000;
_lightPoint setLightAmbient _lightColor; _lightPoint setLightColor _lightColor;
_lightPoint setLightAttenuation [0.5, 0, 0, 1, 20, 30];// [0,0,0,0,0,4000];
_lightPoint setLightIntensity 800;
_lightPoint attachTo [_fire, [0,0,0]];
// _lightPoint setLightBrightness 15;
