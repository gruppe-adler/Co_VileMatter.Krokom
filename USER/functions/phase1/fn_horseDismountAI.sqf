params ["_rider", "_horse"];

_rider setVariable ["GRAD_VM_isRider", false, true];
[_rider, ""] remoteExec ["switchmove", 0];
detach _rider;
_rider setvelocity [-2,-1,0];
_horse setobjecttextureGlobal [1,""];
_horse setobjecttextureGlobal [0,"\dbo\dbo_horses\data\tack_co.paa"];

[_rider] joinSilent (_rider getVariable ["GRAD_VM_originalGroup", grpNull]);