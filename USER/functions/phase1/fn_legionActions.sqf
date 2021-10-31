params ["_leader"];

_leader addAction
[
     "Let formation lose - ATTACK",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          _target setVariable ["GRAD_VM_inFormation", false, true];
          (group _target) setBehaviour "AWARE";
          { _x setUnitPos "UP"; } forEach (units (group _target));
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


_leader addAction
[
     "Marching Sound",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          playSound3D [getMissionPath "USER\sounds\marchingsoldiers.ogg", _target, false, ASLtoAGL (position _target), 1, 1, 2000];
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


_leader addAction
[
     "Marching Sound",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          playSound3D [getMissionPath "USER\sounds\marchingsoldiers.ogg", _target, false, ASLtoAGL (position _target), 1, 1, 2000];
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

_leader addAction
[
     "Blow Horn 1 Sound",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          playSound3D [getMissionPath "USER\sounds\romanhorns.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
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


_leader addAction
[
     "Blow Horn 2 Sound",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          playSound3D ["Roman_props\sounds\Roman_horn_corn.ogg", objNull, false, ASLtoAGL _position, 1, 1, 2000];
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
