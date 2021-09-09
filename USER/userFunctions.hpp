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
        class lightningBetween;
        class portalOpening_phase0;
        class blueLight { postInit = 1; };
        class sparksEffectClient { postInit = 1; };
        class sparksEffectServer;
        class sparksGetPos;
        class sparkSmall { postInit = 1; };
    };

    class horrorEffects {
        file = "USER\functions\horrorEffects";
        class stalked {};
    };
};
