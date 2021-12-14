params ["_object"];


_object addAction
[
    "Move Lever",    
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        
         ["GRAD_VM_ACTION_start", [
            _target,
            player,
            "GRAD_VM_ACTION_TELEPORT_PHASE2"
        ]] call CBA_fnc_serverEvent;
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