params ["_object"];


_object addAction
[
    "Kristall berühren",    
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        
         ["GRAD_VM_ACTION_start", [
            _target,
            player,
            "GRAD_VM_ACTION_TELEPORT_PHASE3"
        ]] call CBA_fnc_serverEvent;
    },
    nil,        
    1.5,        
    true,       
    true,       
    "",         
    "[3] call GRAD_VM_main_fnc_getPhaseProgress == 0",     
    10,         
    false,      
    "",         
    ""          
];