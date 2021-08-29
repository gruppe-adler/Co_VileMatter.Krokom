

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
    
    if (_scale > 10) then {
        _scale = 0.01;
    };

    portalSphere setObjectScale (_scale + 0.1);

}, 0, []] call CBA_fnc_addPerFramehandler;