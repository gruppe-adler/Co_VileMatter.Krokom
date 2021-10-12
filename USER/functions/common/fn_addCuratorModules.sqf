["Vile Matter", "Kill Hitler", {
     params ["_position", "_object"];
     
     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] spawn GRAD_VM_phase2_fnc_suicideHitler;
     };
}] call zen_custom_modules_fnc_register;