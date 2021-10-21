private _position = [(getpos outroStatsTarget)#0, (getpos outroStatsTarget)#1, 10];
private _radius = 0.5;
private _discoBall = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];
_discoBall setObjectTexture [0, "#(argb,8,8,3)color(0.5,0.5,0.5,1,NOHQ)"];
_discoBall setObjectMaterial [0,"A3\Structures_F\Data\Windows\window_set.rvmat"];
private _cones = [];

for "_i" from 1 to 10 do {
    private _types = ["Reflector_Cone_01_narrow_white_F", "Reflector_Cone_01_narrow_orange_F", "Reflector_Cone_01_narrow_red_F", "Reflector_Cone_01_narrow_green_F", "Reflector_Cone_01_narrow_blue_F"];
    private _cone = createVehicle [selectRandom _types, [0,0,0], [], 0, "CAN_COLLIDE"];
    _cone setPosASL (getPosASL _discoBall);
    // _cone attachTo [_discoBall, [0,0,0], "", true];

    private _beam = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d", [0,0,0]];
    _beam setPosASL (getPosASL _discoBall);
    // _beam attachTo [_cone, [0,0,0], "", true];

    private _randomPitch = random 360;
    private _randomBank = random 360;
    private _randomYaw = random 360;

    [_cone, _randomPitch, _randomBank, _randomYaw] call ace_common_fnc_setPitchBankYaw;
    _cones pushBackUnique _cone;
    _cones pushBackUnique _beam;
};

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_cones"];

    {
        private _cone = _x;
        private _randomPitch = (_cone getVariable ["GRAD_VM_randomPitch", random 360]) + 2;
        private _randomBank = (_cone getVariable ["GRAD_VM_randomBank", random 360]) + 2;
        private _randomYaw = (_cone getVariable ["GRAD_VM_randomYaw", random 360]) + 2;

        [_cone, _randomPitch, _randomBank, _randomYaw] call ace_common_fnc_setPitchBankYaw;
        _cone setOBjectScale 0.25;

        _cone setVariable ["GRAD_VM_randomPitch", _randomPitch];
        _cone setVariable ["GRAD_VM_randomBank", _randomBank];
        _cone setVariable ["GRAD_VM_randomYaw", _randomYaw];
    } forEach _cones;

}, 0, [_cones]] call CBA_fnc_addPerFrameHandler;

// delete after 10s for debugging
[{
    params ["_handle", "_cones", "_discoBall"];
    { deleteVehicle _x; } forEach _cones;
    deleteVehicle _discoBall;
    [_handle] call CBA_fnc_removePerFrameHandler;
}, [_handle, _cones, _discoBall], 20] call CBA_fnc_waitAndExecute;
