private _tiger = player; private _dog = createAgent ["Alsatian_Sand_F", [70,0,0], [], 0, "NONE"]; 
private _tigerSmall =  createAgent ["Edaly_Tiger", [70,0,0], [], 0, "NONE"]; 
private _cock = createAgent ["Cock_random_F", [70,0,0], [], 0, "NONE"]; 
 
{ _x disableAI "ALL"; } forEach [_tiger, _dog, _tigerSmall, _cock]; 
 
_dog attachTo [_tiger, [0,0,0.3], "rigspine1", true]; 
_tigerSmall attachTo [_dog, [0,0,0.7], "spine", true]; 
_tigerSmall setObjectScale 0.3; 
_cock attachTo [_tigerSmall, [0,0,1.2],"rigspine2", true]; 
 

/*

private _tiger = createAgent ["Edaly_Tiger", [70,0,0], [], 0, "NONE"];
private _dog = createAgent ["Alsatian_Sand_F", [70,0,0], [], 0, "NONE"];
private _tigerSmall =  createAgent ["Edaly_Tiger", [70,0,0], [], 0, "NONE"];
private _cock = createAgent ["Cock_random_F", [70,0,0], [], 0, "NONE"];

{ _x disableAI "ALL"; } forEach [_tiger, _dog, _tigerSmall, _cock];

_dog attachTo [_tiger, [0,0,1.5], "rigspine2", true];
_tigerSmall attachTo [_dog, [0,0,1], "spine", true];
_tigerSmall setObjectScale 0.3;
_cock attachTo [_tigerSmall, [0,0,1.5],"rigspine2", true];


["rigpelvis",
"riglbleg1",
"riglbleg2",
"riglbleg3",
"riglblegankle",
"riglblegdigit11",
"riglblegdigit12",
"riglblegdigit21",
"riglblegdigit22",
"riglblegdigit31",
"riglblegdigit32",
"riglblegdigit41",
"riglblegdigit42",
"rigspine1",
"rigspine2",
"rigspine3",
"rigchest",
"rigneck1",
"rigneck2",
"rigneck3",
"rigneck4",
"righead",
"rigjaw1",
"rigtongue1",
"rigtongue2",
"rigtongue3",
"rigleye1",
"rigleyelid1",
"riglear1",
"riglear2",
"rigrear1",
"rigrear2",
"rigreye1",
"rigreyelid1",
"riglwhiskers11",
"riglwhiskers12",
"riglwhiskers21",
"riglwhiskers22",
"riglwhiskers31",
"riglwhiskers32",
"camo",
"rigrwhiskers31",
"rigrwhiskers32",
"injury_hands",
"injury_legs",
"head",
"camo1",
"spine3",
"lefthand",
"righthand",
"weapon",
"launcher",
"proxy:\a3\characters_f\proxies\weapon.001",
"proxy:\a3\characters_f\proxies\pistol.001",
"proxy:\a3\characters_f\proxies\binoculars.001",
"proxy:\a3\characters_f\proxies\launcher.001",
"proxy:\a3\characters_f\proxies\flag.001",
"proxy:\a3\characters_f\proxies\backpack.001",
"proxy:\a3\characters_f\proxies\glasses.001",
"rigrwhiskers11",
"rigrwhiskers12",
"rigrwhiskers21",
"rigrwhiskers22",
"riglnose",
"rigrnose",
"riglflegcollarbone",
"riglfleg1",
"riglfleg2",
"riglfleg3",
"riglflegankle","riglflegdigit11","riglflegdigit12","riglflegdigit1claw","riglflegdigit21","riglflegdigit22","riglflegdigit2claw","riglflegdigit31","riglflegdigit32","riglflegdigit3claw","riglflegdigit41","riglflegdigit42","riglflegdigit4claw","riglflegdigit5claw","rigrflegcollarbone","rigrfleg1","rigrfleg2","rigrfleg3","rigrflegankle","rigrflegdigit11","rigrflegdigit12","rigrflegdigit1claw","rigrflegdigit21","rigrflegdigit22","rigrflegdigit2claw","rigrflegdigit31","rigrflegdigit32","rigrflegdigit3claw","rigrflegdigit41","rigrflegdigit42","rigrflegdigit4claw","rigrflegdigit5claw","riglshoulderblade1","rigrshoulderblade1","rigtail1","rigtail2","rigtail3","rigtail4","rigtail5","rigtail6","rigrbleg1","rigrbleg2","rigrbleg3","rigrblegankle","rigrblegdigit11","rigrblegdigit12","rigrblegdigit21","rigrblegdigit22","rigrblegdigit31","rigrblegdigit32","rigrblegdigit41","rigrblegdigit42","proxy:\a3\characters_f\proxies\hmd.001","fur","proxy:\a3\characters_f\proxies\equipment.001","proxy:\a3\characters_f\proxies\headgear.001","proxy:\a3\characters_f\heads\bysta.001","hl","injury_body"]#

private _tiger = createAgent ["Edaly_Tiger", [70,0,0], [], 0, "NONE"];
private _dog = createAgent ["Alsatian_Sand_F", [70,0,0], [], 0, "NONE"];
private _tigerSmall =  createAgent ["Edaly_Tiger", [70,0,0], [], 0, "NONE"];
private _cock = createAgent ["Cock_random_F", [70,0,0], [], 0, "NONE"];

{ _x disableAI "ALL"; } forEach [_tiger, _dog, _tigerSmall, _cock];

_dog attachTo [_tiger, [0,0,1.5], "rigspine2", true];
_tigerSmall attachTo [_dog, [0,0,1], "spine", true];
_tigerSmall setObjectScale 0.3;
_cock attachTo [_tigerSmall, [0,0,1.5],"rigspine2", true];

{
    [{
        params ["_dog", "_tiger", "_selection"];

        _dog attachTo [_tiger, [0,0,0], _selection, true];
        systemchat _selection;
    }, [_dog, _tiger, _x], _forEachIndex*2] call CBA_fnc_waitAndExecute;

} forEach ["rigpelvis",
"riglbleg1",
"riglbleg2",
"riglbleg3",
"riglblegankle",
"riglblegdigit11",
"riglblegdigit12",
"riglblegdigit21",
"riglblegdigit22",
"riglblegdigit31",
"riglblegdigit32",
"riglblegdigit41",
"riglblegdigit42",
"rigspine1",
"rigspine2",
"rigspine3",
"rigchest",
"rigneck1",
"rigneck2",
"rigneck3",
"rigneck4",
"righead",
"rigjaw1",
"rigtongue1",
"rigtongue2",
"rigtongue3",
"rigleye1",
"rigleyelid1",
"riglear1",
"riglear2",
"rigrear1",
"rigrear2",
"rigreye1",
"rigreyelid1",
"riglwhiskers11",
"riglwhiskers12",
"riglwhiskers21",
"riglwhiskers22",
"riglwhiskers31",
"riglwhiskers32",
"camo",
"rigrwhiskers31",
"rigrwhiskers32",
"injury_hands",
"injury_legs",
"head",
"camo1",
"spine3"];*/