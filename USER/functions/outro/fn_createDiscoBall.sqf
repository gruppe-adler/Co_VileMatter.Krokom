params ["_position"];

private _radius = 0.5;
private _discoBall = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];

for "_i" from 1 to 30 do {
    private _cone = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
    _cone attachTo [_discoBall, [0,0,0], true];

    private _randomPitch = random 360;
    private _randomBank = random 360;
    private _randomYaw = random 360;

    [_cone, _randomPitch, _randomBank, _randomYaw] call ace_common_fnc_setPitchBankYaw;
};

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_discoBall"];

    private _randomPitch = (_discoBall getVariable ["GRAD_VM_randomPitch", random 360]) + random 1 - random 2;
    private _randomBank = (_discoBall getVariable ["GRAD_VM_randomBank", random 360]) + random 1 - random 2;
    private _randomYaw = (_discoBall getVariable ["GRAD_VM_randomYaw", random 360]) + random 1 - random 2;

    [_discoBall, _randomPitch, _randomBank, _randomYaw] call ace_common_fnc_setPitchBankYaw;

    _discoBall setVariable ["GRAD_VM_randomPitch", _randomPitch];
    _discoBall setVariable ["GRAD_VM_randomBank", _randomBank];
    _discoBall setVariable ["GRAD_VM_randomYaw", _randomYaw];

}, 0, [_discoBall]] call CBA_fnc_addPerFrameHandler;

// delete after 10s for debugging
[{
    [_this] call CBA_fnc_removePerFrameHandler;
}, _handle, 10] call CBA_fnc_waitAndExecute;
