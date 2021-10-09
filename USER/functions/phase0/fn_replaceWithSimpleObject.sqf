if (!isServer) exitWith {};

params ["_steamHatch"];

private _position = getPosWorld _steamHatch;
private _dir = getDir _steamHatch;
deleteVehicle _steamHatch;

private _newHatch = createSimpleObject ["jms_props\cityacces\jms_acces_steam_hatch_1.p3d", _position];
_newHatch setDir _dir;

{
    _newHatch hideSelection [_x, true]
} forEach (selectionNames _newHatch);

private _allHatches = missionNamespace getVariable ["GRAD_VM_phase0_hatches", []];
_allHatches pushBackUnique _newHatch;
missionNamespace setVariable ["GRAD_VM_phase0_hatches", _allHatches];