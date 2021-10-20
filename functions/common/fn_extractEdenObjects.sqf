if !(isServer) exitWith {};

private _objectsToExtract =
((getMissionLayerEntities "EXPORT_phase0")#0) +
((getMissionLayerEntities "EXPORT_phase1")#0) +
((getMissionLayerEntities "EXPORT_phase2")#0) +
((getMissionLayerEntities "EXPORT_phase3")#0);

GRAD_VM_common_extractedEdenObjects = [];
GRAD_VM_common_extractedEdenObjectConfigs = [];
private _typesToExclude = [];
{
    private _type = typeOf _x;
    if (isNil "_type" || ((_type != "") && (isNull _x)) || (vehicleVarName _x != "") || (_type in _typesToExclude)) then { continue };

	private _pos = getPosWorld _x;
	if(isNil "_pos") then {
		_pos = [0,0,0];
	};
	private _dir = vectorDir _x;
	if(isNil "_dir") then {
		_dir = [0,0,0];
	};
	private _up = vectorUp _x;
	if(isNil "_dir") then {
		_up = [0,0,0];
	};

	GRAD_VM_common_extractedEdenObjectConfigs pushBack [_type, _pos, [_dir, _up], getObjectTextures _x];
	GRAD_VM_common_extractedEdenObjects pushBack _x;
} forEach _objectsToExtract;

publicVariable "GRAD_VM_common_extractedEdenObjects";
publicVariable "GRAD_VM_common_extractedEdenObjectConfigs";