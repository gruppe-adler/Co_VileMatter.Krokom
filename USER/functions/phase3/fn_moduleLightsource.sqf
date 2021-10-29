params ["_center", "_radius"];

private _logics = allMissionObjects "logic" select { _x distance _center <= _radius };
private _sources = [];

{
	private _vars = allVariables _x;
	if (("zen_modules_lightparams" in _vars) && ("zen_modules_lightpoint" in _vars)) then {
		_sources pushBack [_x getVariable "zen_modules_lightpoint", _x getVariable "zen_modules_lightparams"];
	};
} foreach _logics;

missionNamespace setVariable ["GRAD_VM_phase3_zeusLightSources", _sources, true];