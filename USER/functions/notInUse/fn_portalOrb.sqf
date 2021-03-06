

portalCam = "camera" camCreate (getPos portalPos);
portalCam cameraEffect ["Internal", "Back", "bliasd"];
portalCam camSetTarget (getPos portalTarget);
portalCam camCommit 0;
portalCam setPos (getPos portalPos);

portalCam camSetFov 0.7;
portalCam camCommit 0;

portalSphere setObjectTexture [0, "#(argb,512,512,1)r2t(bliasd,1)"];


[{
    params ["_args", "_handle"];

    private _scale = getObjectScale portalSphere;

    if (_scale > 3) then {
        grad_VM_portalPhase_1 = grad_VM_portalPhaseEnd_1;
        [_handle] call CBA_fnc_removePerFrameHandler;
        // portalSphere setObjectScale (0.1);
    };

    portalSphere setObjectScale (_scale + 0.1);

}, 0, []] call CBA_fnc_addPerFramehandler;
