params ["_rider", "_horse"];

_rider setVariable ["GRAD_VM_isRider", false, true];
_rider switchmove "";
detach _rider;
_rider setvelocity [-2,-1,0];
_horse setobjecttexture [1,""];
_horse setobjecttexture [0,"\dbo\dbo_horses\data\tack_co.paa"];

[_rider] joinSilent (_rider getVariable ["GRAD_VM_originalGroup", grpNull]);