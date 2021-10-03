/*

    server side, manages phase 1

*/

if (!isServer) exitWith {};

// todo insert correct object


[{
    gradVM_portalPhase_1 > 0
},
{
  // [stoneHengerCenter] remoteExec ["GRAD_VM_phase1_fnc_stoneHengeFX", [0,-2] select isDedicated, true];
},[]] call CBA_fnc_waitUntilAndExecute;
