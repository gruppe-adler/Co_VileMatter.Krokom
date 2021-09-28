if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];



// To add to the transition between pahse 2 and phase 3:

// private _phase3Lamps = [Grad_VM_caveLamp_1, Grad_VM_caveLamp_2, Grad_VM_caveLamp_3, Grad_VM_caveLamp_4, Grad_VM_caveLamp_5, Grad_VM_caveLamp_6, Grad_VM_caveLamp_7, Grad_VM_caveLamp_8, Grad_VM_caveLamp_9, Grad_VM_caveLamp_10, Grad_VM_caveLamp_11];
// {
	
// 	private _brightness = _x getVariable ["Grad_VM_brightness", 0.42];
// 	[_x, _brightness] call Grad_VM_fnc_activateCaveLamp;
// } forEach _phase3Lamps;