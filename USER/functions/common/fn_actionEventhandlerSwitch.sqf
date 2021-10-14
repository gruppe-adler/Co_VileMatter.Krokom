/*
    
    controls all action leading to teleport

*/

if (!isServer) exitwith {};

["GRAD_VM_ACTION_TELEPORT_PHASE0", {
    params ["_object"];

    _object setVariable ['grad_VM_switchUsable', false, true];

    _object animateSource ["Power_1", 1];
    _object animateSource ["Power_2", 1];
    _object animateSource ["SwitchLight", 0];
    _object animateSource ["SwitchPosition", 1];

    [{
        ["GRAD_VM_phaseControl", [0, 1]] call CBA_fnc_serverEvent;
    }, [], 2] call CBA_fnc_waitAndExecute;
    

}] call CBA_fnc_addEventHandler;



["GRAD_VM_ACTION_TELEPORT_PHASE1", {
    params ["_object"];

    _object attachTo [phase1_pedestal, [0,0,0.9]];

    [{
        ["GRAD_VM_phaseControl", [1,1]] call CBA_fnc_serverEvent;
    }, [], 2] call CBA_fnc_waitAndExecute;
    

}] call CBA_fnc_addEventHandler;



["GRAD_VM_ACTION_TELEPORT_PHASE2", {
    params ["_object"];

    _object animate ["lever_rot", 1, 0.25];
    playSound3D [getMissionPath "USER\sounds\lever.ogg", _object];  

    [{
        ["GRAD_VM_phaseControl", [2,1]] call CBA_fnc_serverEvent;
    }, [], 3.5] call CBA_fnc_waitAndExecute;
    

}] call CBA_fnc_addEventHandler;



["GRAD_VM_ACTION_TELEPORT_PHASE3", {
    params ["_object"];

    private _skyshield = (getPos _object) nearestObject "TIOW_Skyshield";

    {
        private _wait = _forEachIndex * 3;
        private _selection = _x;
        [{ 
            params ["_skyshield", "_selection"];

            _skyshield animate [("rot_" + _selection), 0];
            private _selectionPosition = _skyshield modelToWorld (_skyshield selectionPosition _selection);
            playSound3D ["WHobjects\buildings\skyshield\sounds\heavy_door.ogg", _skyshield, false, AGLtoASL _selectionPosition];
        }, [_skyshield, _selection], _wait] call CBA_fnc_waitAndExecute;
    } forEach ["wall_6","wall_7","wall_8", "wall_1","wall_2","wall_3","wall_4","wall_5"];
    // wall_5 is the one with the ramp

    [{
        ["GRAD_VM_phaseControl", [3,1]] call CBA_fnc_serverEvent;
    }, [], 21] call CBA_fnc_waitAndExecute;
    

}] call CBA_fnc_addEventHandler;

// animations ["rot_wall_1","rot_wall_2","rot_wall_3","rot_wall_4","rot_wall_5","rot_wall_6","rot_wall_7","rot_wall_8","rot_hatches","lamps_hide"]
// selections ["wall_1","wall_2","wall_3","wall_4","wall_5","wall_6","wall_7","wall_8","hatches","lamps_glow","group"]

/*

{ 
        [{  
            params ["_skyshield"]; hint str ("rot" + _x);
            
            _skyshield animate [("rot_" + _x), 1, 0.25];
            private _selectionPosition = _skyshield modelToWorld (_skyshield selectionPosition _x); 
            playSound3D ["WHobjects\buildings\skyshield\sounds\heavy_door.ogg", _selectionPosition]; 
        }, [GRAD_VM_skyshield], _forEachIndex] call CBA_fnc_waitAndExecute; 
    } forEach ["wall_1","wall_2","wall_3","wall_4","wall_5","wall_6","wall_7","wall_8"];


*/