params ["_horse"];

_horse setVariable ["GRAD_VM_horseSound", true, true];

private _handle = [{
    params ["_args", "_handle"];
    _args params ["_horse"];
    
    if (animationState _horse == "dbo_Horse_Sprint") then {
        private _sound = selectRandom ["grass_run_1", "grass_run_2", "grass_run_3", "grass_run_4"];
        playSound3D ["dbo\dbo_horses\sounds\" + _sound + ".wss", _horse, false, getPosasl _horse, 5,1,0];
    };

}, 0.35, [_horse]] call CBA_fnc_addPerFramehandler;

[{
    params ["_horse", "_handle"];
    !(_horse getVariable ["GRAD_VM_horseSound", false])
},{
    params ["_horse", "_handle"];
    [_handle] call CBA_fnc_removePerFrameHandler;
}, [_horse, _handle]] call CBA_fnc_waitUntilAndExecute;