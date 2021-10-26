params ["_object"];

while { _object getVariable ["GRAD_VM_blinkScreen", true] } do {

    _object setObjectTexture [1, "USER\functions\phase0\pw.paa"];
    sleep 0.5;
    _object setObjectTexture [1, "USER\functions\phase0\pw2.paa"];
    sleep 0.5;
};
