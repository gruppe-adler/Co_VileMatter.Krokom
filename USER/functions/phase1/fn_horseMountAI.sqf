params ["_rider", "_horse"];

_rider setVariable ["GRAD_VM_isRider", true, true];
_horse setVariable ["GRAD_VM_isHorse", true, true];
_rider setVariable ["GRAD_VM_originalGroup", group _rider, true];

_rider switchmove "Horse_Rider";
_rider attachto [_horse,[0,0.05,0.25],"Pelvis_l"];
_horse setobjecttextureGlobal [1,"\dbo\dbo_horses\data\tack_co.paa"];
_horse setobjecttextureGlobal [0,""];

[_rider] call GRAD_VM_phase1_fnc_addTorchToRider;

[_rider] joinSilent (group _horse);


if (!alive _rider || !alive _horse) then {
    [_rider, _horse] call GRAD_VM_phase1_fnc_horseDisMountAI;
};