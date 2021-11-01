if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

[] call GRAD_VM_phase1_fnc_ambientFrogs;

private _owls = [
    grad_vm_phase1_ambient_owl_1,
    grad_vm_phase1_ambient_owl_2,
    grad_vm_phase1_ambient_owl_3,
    grad_vm_phase1_ambient_owl_4,
    grad_vm_phase1_ambient_owl_5
];

{
    _x setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
} forEach _owls;



[{
    params ["_args", "_handle"];
    _args params ["_owls"];

    if (count (missionNamespace getVariable ["GRAD_VM_phase1_ambientSources", []]) == 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (random 5 > 4) then {
        [selectRandom _owls, [selectRandom [
            "phase1_ambient_owl_1",
            "phase1_ambient_owl_2",
            "phase1_ambient_owl_3",
            "phase1_ambient_owl_4",
            "phase1_ambient_owl_5",
            "phase1_ambient_owl_6",
            "phase1_ambient_owl_7",
            "phase1_ambient_owl_8",
            "phase1_ambient_owl_9",
            "phase1_ambient_owl_10"
        ], 1000]] remoteExec ["say3D"];
    };

}, 7, [_owls]] call CBA_fnc_addPerFrameHandler;
