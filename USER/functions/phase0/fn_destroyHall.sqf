 private _rubble = createVehicle ["land_Gothic_Rubble_2", [0,0,0], [], 0, "CAN_COLLIDE"];
 _rubble setPos [637.482,770.317,4.99109];
 _rubble SetDir 54.081;

private _rubble2 = createVehicle ["Jbad_Misc_Coltan_Heap", [0,0,0], [], 0, "CAN_COLLIDE"];
_rubble2 setPos [626.817,785.961,4.85208];

[getPos GRAD_VM_rockShowerSource_8, GRAD_VM_rockShowerSource_8, 10, 2] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
[GRAD_VM_rockShowerSource_8, ["rocksFalling_3", 500]] remoteExec ["say3D", [0, -2] select isMultiplayer];
[10, 10, 35] remoteexec ["addCamShake"];


private _lamps = nearestObjects [GRAD_VM_rockShowerSource_8, ["Land_JMS_light_UpLight_1"], 100];

{ _x setDamage 1; } forEach _lamps;