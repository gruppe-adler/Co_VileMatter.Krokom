if !(isServer) exitWith {};

[
	{
		private _objects = missionNamespace getVariable ["GRAD_VM_common_extractedEdenObjects", []];
		count _objects > 0
	},
	{
		private _objects = missionNamespace getVariable ["GRAD_VM_common_extractedEdenObjects", []];
		{
			// Current result is saved in variable _x
			deleteVehicle _x;
		} forEach _objects;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;