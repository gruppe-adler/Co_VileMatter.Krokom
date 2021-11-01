params ["_tiger"];

_tiger addAction
[
     "Stretch",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          [_target, "TigerStretch"] remoteExec ["switchMove"];
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
    "Make vulnerable",  // title
    {
         params ["_target", "_caller", "_actionId", "_arguments"]; // script

         [_target, true] remoteExec ["allowDamage", _target];
         systemChat "vulnerable";
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
   "Make invincible",  // title
   {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        [_target, false] remoteExec ["allowDamage", _target];
        systemChat "invincible";
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
     "ATTACK",  // title
     {
          params ["_target", "_caller", "_actionId", "_arguments"]; // script

          [_target, (selectRandom ["TigerAttack", "TigerAttackClaws"])] remoteExec ["switchMove"];
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

          [_target, "TigerLyingIdle"] remoteExec ["switchMove"];
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


          [_target, "TigerSleep"] remoteExec ["switchMove"];
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

          private _sound = selectRandom ["GRAD_VM_lion_scream_1", "GRAD_VM_lion_scream_2", "GRAD_VM_lion_scream_3", "GRAD_VM_lion_scream_4"];
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
