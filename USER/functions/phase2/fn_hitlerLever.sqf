params ["_object"];


_object addAction
[
    "Hebel bewegen",    
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        
        _target animate ["lever_rot", 1, 0.25];
        playSound3D [getMissionPath "USER\sounds\lever.ogg", _target];

        [{
            ["GRAD_VM_phaseControl", [2,1]] call CBA_fnc_serverEvent;
        }, [], 3.5] call CBA_fnc_waitAndExecute;
    },
    nil,        
    1.5,        
    true,       
    true,       
    "",         
    "[2] call GRAD_VM_main_fnc_getPhaseProgress == 0",     
    2,         
    false,      
    "",         
    ""          
];