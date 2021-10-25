[2] call GRAD_VM_outro_fnc_fadeToBlack;
2 fadeSound 0;
2 fadeSpeech 0;
sleep 2;
_sound = player getVariable ["phase4_earthquake", objNull];
deleteVehicle _sound;

private _lightPoint = "#lightpoint" createvehiclelocal [0,0,0]; 
_lightPoint attachTo [GRAD_VM_phase4_exfilHeli_1, [-0.033783,7.48343,-0.329193]];
_lightPoint setLightAmbient[1, 153/255, 80/255];
_lightPoint setLightBrightness 0.22;

private _cam = "camera" camCreate [0,0,0];
_cam attachTo [GRAD_VM_phase4_exfilHeli_1, [-0.033783,7.48343,-0.329193]];
_cam camSetTarget (driver GRAD_VM_phase4_exfilHeli_1);
_cam camSetFov 0.45;
_cam camCommit 0;
_cam cameraEffect ["internal", "BACK"];

[2] call GRAD_VM_outro_fnc_fadeFromBlack;
5 fadeSound 0.1;
5 fadeSpeech 2;
sleep 7;

private _copilotTurrets = allTurrets GRAD_VM_phase4_exfilHeli_1 select { getNumber ([GRAD_VM_phase4_exfilHeli_1, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0 };
private _copilot = (_copilotTurrets apply { GRAD_VM_phase4_exfilHeli_1 turretUnit _x }) # 0;

_cam camSetTarget _copilot;
_cam camsetFOV 0.6;
_cam camCommit 5;

sleep 5;
_copilot lookAt (driver vehicle _copilot);
_copilot setMimic "combat";
_copilot setRandomLip true;
_copilot say3D ["feiglinge_default", 5, 1, true];
sleep 1;
_copilot say3D ["verraeterversager_default", 5, 1, true];
sleep 2;
[0] call GRAD_VM_outro_fnc_fadeToBlack;
0 fadeSound 0;
0 fadeSpeech 0;

player allowDamage false;
[player] remoteExec ["moveOut", [0, -2] select isMultiplayer];
sleep 1;
player setVelocity [0,0,0];
player setPos [25 + (random 100), 8173 + random (100), 0];