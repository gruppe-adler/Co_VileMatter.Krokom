/*

["dummyheadgear.p3d","a3\weapons_f\dummyheadgear.p3d",false]

Headgear_H_LIB_US_Helmet_CO

TIOW_Tau_HelmetB2_VL

model = "\40k_tau\Headgear\HelmetB2.p3d";

model = "JMSL_roman\helms\LegionerHelmet_1_2.p3d";
picture = "\JMSL_roman\ico\Ico_helm_leggal.paa";
model = "JMSL_roman\helms\LegionerHelmet_1.p3d";
model = "JMSL_roman\helms\LegionerHelmet_2.p3d";
model = "JMSL_roman\helms\LegionerHelmet_3.p3d";
model = "\JMSL_roman\weapon\gladius_1.p3d";
model = "\JMSL_roman\weapon\aquila.p3d";

*/

// store for immediate access
gradVM_wormholePipes = [];
gradVM_wormholeProps = [];
gradVM_cameraBank = 0;
gradVM_cameraBankChange = 0.02;

private _startpoint = [-100,0,8000];

for "_i" from 0 to 100 do {
    _startpoint set [1, (_i*2.85)];
    private _concretePipe = createSimpleObject ["Land_ConcretePipe_F", _startpoint, true];
    gradVM_wormholePipes pushbackunique _concretePipe;

    if (_i == 100) then {
        private _endCube = createSimpleObject ["Land_VR_Shape_01_cube_1m_F", _startpoint, true];
        _endCube setObjectScale 5;
        gradVM_wormholeProps pushbackunique _endCube;
    };
};

private _firstPipePos = getPos (gradVM_wormholePipes select 0);
_firstPipePos set [2, (_firstPipePos select 2) - 1.5];
gradVM_cameraPosition = _firstPipePos;
