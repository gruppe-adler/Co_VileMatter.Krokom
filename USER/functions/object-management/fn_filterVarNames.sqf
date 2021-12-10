if !(is3DEN) exitWith {};

private _layer = currentNamespace getVariable ["GRAD_VM_objectManagement_varNameLayer", -1];
private _varNameEntities = (all3DENEntities # 0) select {(_x get3DENAttribute "Name") isNotEqualTo [""]};
// copyToClipboard str _varNameEntities;

if (_layer isEqualTo -1) then {
	_layer = -1 add3DENLayer "DO_NOT_DELETE_varName_objects";
	currentNamespace setVariable ["GRAD_VM_objectManagement_varNameLayer", _layer];
};

{
	_x set3DENLayer _layer;
} forEach _varNameEntities;