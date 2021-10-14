["Vile Matter - Common", "Respawn Player", {
     params ["_position", "_object"];
     
     if (isPlayer _x) then {
          [_object] remoteExec ["GRAD_VM_common_fnc_respawnPlayer", _object];
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Spawn marching Roman Soldiers", {
     params ["_position", "_object"];
     
     [ASLtoAGL _position, 90] call GRAD_VM_phase1_fnc_spawnMarchingColumn;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Remove Formation", {
     params ["_position", "_object"];
     
     private _leader = nearestObject [ASLtoAGL _position, "Roman_legioner_cent_IMS_red"];
     if (!isNull _leader && {_leader getVariable ["GRAD_VM_inFormation", false]}) then {
          _leader setVariable ["GRAD_VM_inFormation", false, true];
          hint "released leader";
     } else {
          hint "no leader found";
     };
}] call zen_custom_modules_fnc_register;



["Vile Matter - Phase 2", "Kill Hitler", {
     params ["_position", "_object"];
     
     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] spawn GRAD_VM_phase2_fnc_suicideHitler;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "Spawn Lion", {
     params ["_positionASL", "_object"];
     
     private _tiger = (creategroup east) createUnit ["Edaly_Tiger", ASLtoAGL _positionASL, [], 0, "CAN_COLLIDE"];
     _tiger setObjectTextureGlobal [0, "USER\images\lion_small.paa"];
     _tiger setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0,0,0,0)"];


    

     _tiger addAction
     [
          "Stretch",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               _target playMoveNow "TigerStretch";
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

     _tiger addAction
     [
          "Lie Down",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               _target playMoveNow "TigerLyingIdle";
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


      _tiger addAction
     [
          "Sleep",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               _target playMoveNow "TigerSleep";
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