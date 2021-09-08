/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class VM {
    tag = "GRAD_VM";
    class common {
        file = "USER\functions\utilities";
        class replaceRoads { postInit = 1; };
        class objectIsOnScreen {};
    };

    class phase0 {
        file = "USER\functions\phase0";
        class blueLight { postInit = 1; };
    };

    class horrorEffects {
        file = "USER\functions\horrorEffects";
        class stalked {};
    };
};
