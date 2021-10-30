["Vile Matter - Common", "Respawn Player", {
     params ["_position", "_object"];

     if (isPlayer _x) then {
          [_object] remoteExec ["GRAD_VM_common_fnc_respawnPlayer", _object];
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Common", "Wake up Player", {
     params ["_position", "_object"];

     if (isPlayer _x) then {
          _object setUnconscious false;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Common", "Heal Player", {
     params ["_position", "_object"];

     if (isPlayer _x) then {
          [_object] remoteExec ["GRAD_VM_common_fnc_healSelf", _object];
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 0", "Destroy Zentrifuge Hall", {
     params ["_position", "_object"];

     [] call GRAD_VM_phase0_fnc_DestroyHall;
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 1", "Spawn marching Roman Soldiers", {
     params ["_position", "_object"];

     [ASLtoAGL _position, 90] call GRAD_VM_phase1_fnc_spawnMarchingColumn;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Spawn Roman on Horse", {
     params ["_position", "_object"];

     [ASLtoAGL _position, 90] call GRAD_VM_phase1_fnc_spawnHorseRoman;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Marching Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\marchingsoldiers.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Roman Horns Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\romanhorns.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Roman Horns Sound 2", {
     params ["_position", "_object"];

     playSound3D ["Roman_props\sounds\Roman_horn_corn.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Barb Horn", {
     params ["_position", "_object"];

     playSound3D ["Roman_props\sounds\barb_horn_3.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Distant Battle Sound", {
     params ["_position", "_object"];

     playSound3D [getMissionPath "USER\sounds\phase1_battlesound_1.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Remove Formation", {
     params ["_position", "_object"];


     private _leader = (ASLtoAGL _position) nearEntities ["Roman_legioner_cent_IMS_red", 10];
     if (count _leader > 0) then {
          _leader = _leader#0;
     };
     if (!isNull _object) then {
          _leader = _object;
     };
     if (!isNull _leader && {_leader getVariable ["GRAD_VM_inFormation", false]}) then {
          _leader setVariable ["GRAD_VM_inFormation", false, true];
          hint "released leader";
     } else {
          hint "no leader found";
     };
}] call zen_custom_modules_fnc_register;

/*
["Vile Matter - Phase 1", "Add enhanced Horse Sound", {
     params ["_position", "_object"];

     [_object] call GRAD_VM_phase1_fnc_horseSound;

}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 1", "Remove enhanced Horse Sound", {
     params ["_position", "_object"];

     _object setVariable ["GRAD_VM_horseSound", false, true];
     
}] call zen_custom_modules_fnc_register;
*/

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


      _tiger addAction
     [
          "Growl",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               private _sound = selectRandom ["GRAD_VM_lion_growl_1", "GRAD_VM_lion_growl_2", "GRAD_VM_lion_growl_3"];
               [_target, _sound] remoteExec ["say3D"];
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
          "Scream",  // title
          {
               params ["_target", "_caller", "_actionId", "_arguments"]; // script

               private _sound = selectRandom ["GRAD_VM_lion_scream_1", "GRAD_VM_lion_scream_2", "GRAD_VM_lion_scream_3", "GRAD_VM_lion_scream_4", "GRAD_VM_lion_scream_5"];
               [_target, _sound] remoteExec ["say3D"];
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


["Vile Matter - Phase 2", "Spawn Hitler", {
     params ["_position", "_object"];

     [] remoteExec ["GRAD_VM_phase2_fnc_spawnHitler", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Hitler Speech Long", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeechAlternative", [0,-2] select isDedicated];
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Hitler Speech Random Ranting", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] remoteExec ["GRAD_VM_phase2_fnc_hitlerSpeech", 2];
     };
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 2", "Kill Hitler", {
     params ["_position", "_object"];

     if (_object getVariable ["GRAD_VM_isHitler", false]) then {
          [_object] spawn GRAD_VM_phase2_fnc_suicideHitler;
     };
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Start Bunker Bombardment", {
     params ["_position", "_object"];

      [] remoteExec ["GRAD_VM_phase2_fnc_bunkerBombardment", 2];
}] call zen_custom_modules_fnc_register;


["Vile Matter - Phase 2", "Stop Bunker Bombardment", {
     params ["_position", "_object"];

      GRAD_VM_phase2_bunkerBombardment = false; publicVariable "GRAD_VM_phase2_bunkerBombardment";

     [{
          GRAD_VM_phase2_bunkerBombardment = nil; publicVariable "GRAD_VM_phase2_bunkerBombardment";
     }, [], 2] call CBA_fnc_waitAndExecute;
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 3", "Spawn Battleship", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_phase3_shipJumpActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Spawn Battleship' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_phase3_shipJumpActivated", true, true];
     [] remoteExec ["Grad_VM_phase3_fnc_battleshipJump", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 3", "Spawn Guardsman", {
     params ["_position", "_object"];

     [_position, _object] spawn {
          params ["_position", "_object"];

          private _pad = createVehicle ["Land_HelipadEmpty_F", ASLToAGL _position, [], 0, "CAN_COLLIDE"];

          [_pad] remoteExec ["Grad_VM_phase3_fnc_guardsmenSpawnEffect", [0, -2] select isMultiplayer];
          sleep 0.1;
          private _group = createGroup independent;
          private _unit = _group createUnit [selectRandom ["TIOW_Cad_GM776th_Indep", "TIOW_Cad_SGT776th_Indep", "TIOW_Cad_VET776th_Indep"], _pad, [], 0, "NONE"];
          // _unit setDir (getDir _x);
          [_unit, ["Teleport_phase3", 500, 0.85]] remoteExec ["say3D", [0, -2] select isMultiplayer];

          deleteVehicle _pad;
     };
    
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 4", "Start Outro", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_outro_outroActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Start Outro' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_outro_outroActivated", true, true];
     [] remoteExec ["Grad_VM_outro_fnc_initOutro", 2];
}] call zen_custom_modules_fnc_register;

["Vile Matter - Phase 4", "Start Earthquake", {
     params ["_position", "_object"];

     private _alreadyActivated = missionNamespace getVariable ["GRAD_VM_phase4_earthquakeActivated", false];
     if (_alreadyActivated) exitWith {
          systemChat "'Start Earthquake' has already been activated!";
     };
     missionNamespace setVariable ["GRAD_VM_phase4_earthquakeActivated", true, true];
     [] remoteExec ["GRAD_VM_phase4_fnc_initPhase4Effects", 2];
}] call zen_custom_modules_fnc_register;

{
     _x addEventHandler ["CuratorGroupPlaced", {
           params ["_curator", "_group"];

           if (faction leader _group == "LIB_WEHRMACHT") then {
               private _groupNew = createGroup east;
               (units _group) joinSilent _groupNew;
           };
     }];

     _x addEventHandler ["CuratorObjectPlaced", {
          params ["_curator", "_entity"];

          if (faction _entity == "LIB_WEHRMACHT") then {
               private _groupNew = createGroup east;
               [_entity] joinSilent _groupNew;
           };
     }];

} forEach allCurators;


["Vile Matter - Common", "Fix SetObjectScale", {
     params ["_position", "_object"];

     private _allObjects = missionNamespace getVariable ["GRAD_VM_scaledObjects", []];
   {
       _x params ["_object", "_scale"];
       _object setObjectScale _scale;
   } forEach _allObjects;
   
}] call zen_custom_modules_fnc_register;
