/*

  [object1, object2, 10] call GRAD_VM_phase0_fnc_lightningBetween;

*/

params ["_object_1", "_object_2", "_duration"];

playSound "gradVM_drone";

private _startpoint = ([_object_1] call grad_VM_phase0_fnc_sparksGetPos);
private _endpoint = ([_object_2] call grad_VM_phase0_fnc_sparksGetPos);
private _reldir = _startpoint getDir _endpoint;
private _distance = _object_1 distance _object_2;
private _midPoint = _startpoint getPos [_distance/2, _reldir];
private _dummies = [];

for "_i" from 0 to 100 do {
    private _model = selectRandom ["A3\Data_f_Curator\misc\lightning1.p3d", "A3\Data_f_Curator\misc\lightning2.p3d"];
    private _position = _startpoint getPos [_distance*_i/100, _reldir];
    _position set [2, (_endpoint select 2)-10];
    private _dummy = createSimpleObject ["Sign_Sphere10cm_F", aglToASL _position];
    _dummy setOBjecttexture [0,"#(rgb,8,8,3)color(1,0,0,0)"];
    drop [
            ["A3\Data_f_Curator\misc\lightning1.p3d",1,0,1],"","SpaceObject",
            1,_duration,[0,0,10],[0,0,0],random 5,0.0001275,0.0001,0,[0.002,0.002],
            [[1,1,1,1],[1,1,1,1]],[1],0,0,"","",_dummy
        ];
    _dummies pushBack _dummy;
};

private _light = "#lightpoint" createvehiclelocal _midPoint;
_light setLightDayLight true;_light setLightUseFlare false;
_light setLightAmbient[0.9,0.9,0.9]; _light setLightColor[0.9,0.9,0.9];
_light setLightAttenuation [0, 1, 1, 2, 5, 10];
_light setLightBrightness 3;

_object_1 say3D ["GRAD_electricFence_sound_hum", 75];

[{
    params ["_light", "_dummies"];

    { deleteVehicle _x; } forEach _dummies;
    deleteVehicle _light;

    if (gradVM_portalPhase_0 != 2) then {
        gradVM_portalPhase_0 = 2;
        publicVariable "gradVM_portalPhase_0";
    };

}, [_light, _dummies], _duration] call CBA_fnc_waitAndExecute;



/*
model = "A3\Data_f_Curator\misc\lightning1.p3d";
model = "A3\Data_f_Curator\misc\lightning2.p3d";
*/
