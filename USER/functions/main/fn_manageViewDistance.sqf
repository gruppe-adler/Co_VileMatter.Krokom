private _currentPhase = [] call GRAD_VM_main_fnc_getCurrentPhase;

if !(isNull (getAssignedCuratorLogic player)) exitWith {
	[2500, false] call ace_viewdistance_fnc_changeViewDistance;
};

switch (_currentPhase) do {
	case 0: {
		[750, false] call ace_viewdistance_fnc_changeViewDistance;
	 };
	case 1: {
		[2500, false] call ace_viewdistance_fnc_changeViewDistance;
	 };
	case 2: {
		[2500, false] call ace_viewdistance_fnc_changeViewDistance;
	 };
	case 3: {
		if (GRAD_VM_phase3_shipActive) then {
			[3500, false] call ace_viewdistance_fnc_changeViewDistance;
		} else {
			[1000, false] call ace_viewdistance_fnc_changeViewDistance;
		};
	 };
	case 4: {
		[1500, false] call ace_viewdistance_fnc_changeViewDistance;
	 };	 
	default {
		[2500, false] call ace_viewdistance_fnc_changeViewDistance;
	};
};