
["Vile Matter - Phase 2", "Kill Hitler", {
     params ["_position", "_object"];
     
     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] spawn GRAD_VM_phase2_fnc_suicideHitler;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "Spawn Lion", {
     params ["_positionASL", "_object"];
     
     private _tiger = createUnit  ["Edaly_Tiger", ASLtoAGL _positionASL, [], 0, "CAN_COLLIDE"];
     _tiger setObjectTextureGlobal [1, "USER\images\lion_small.paa"];
     _tiger setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0,0,0,0)"];


     _tiger addAction
     [
          "title",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               private _sound = selectRandom [
                    "tiger_roar_1",
                    "tiger_roar_2",
                    "tiger_roar_3",
                    "tiger_roar_4"
               ];

               [_tiger, _sound] remoteExec ["say3D"];
          },
          nil,      // arguments
          1.5,      // priority
          true,          // showWindow
          true,          // hideOnUse
          "",            // shortcut
          "_target == _this",   // condition
          50,            // radius
          false,         // unconscious
          "",            // selection
          ""             // memoryPoint
     ];

     
}] call zen_custom_modules_fnc_register;