 private _rubble = createVehicle ["land_Gothic_Rubble_2", [0,0,0], [], 0, "CAN_COLLIDE"];
 _rubble setPos [637.482,770.317,4.99109];
 _rubble SetDir 54.081;

private _rubble2 = createVehicle ["Jbad_Misc_Coltan_Heap", [0,0,0], [], 0, "CAN_COLLIDE"];
_rubble2 setPos [626.817,785.961,4.85208];

[getPos GRAD_VM_rockShowerSource_8, GRAD_VM_rockShowerSource_8, 120, 6] remoteExec ["GRAD_VM_phase4_fnc_spawnRockShower", [0, -2] select isMultiplayer];
playSound3D [getMissionPath "USER\sounds\rocksFalling_2.ogg", objNull, false, getPos GRAD_VM_rockShowerSource_8, 1, 1, 2000];

// repeat sound once
[{
  playSound3D [getMissionPath "USER\sounds\rocksFalling_2.ogg", objNull, false, getPos GRAD_VM_rockShowerSource_8, 1, 1, 2000];
}, [], 3] call CBA_fnc_waitAndExecute;

[10, 10, 35] remoteexec ["addCamShake"];


private _lamps = nearestObjects [GRAD_VM_rockShowerSource_8, ["Land_JMS_light_UpLight_1", "Land_JMS_light_SideLight_1"], 100];

{ _x hideObjectGlobal true; } forEach _lamps;

phase0_laptop setVariable ["GRAD_VM_blinkScreen", false, true];
