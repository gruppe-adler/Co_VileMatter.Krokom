/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class VM {

  class common {
    tag = "GRAD_VM_common";
    file = "USER\functions\common";
    class replaceRoads { postInit = 1; };
    class objectIsOnScreen {};
    class ropeCreate;
  };

  class horrorEffects {
    tag = "GRAD_VM_horrorEffects";
    file = "USER\functions\horrorEffects";
    class stalked {};
  };

  class main {
    tag = "GRAD_VM_main";
    file = "USER\functions\main";
    class init { postInit = 1; };
  };

  class phase0 {
    tag = "GRAD_VM_phase0";
    file = "USER\functions\phase0";
    class blueLight;
    class flickerLight;
    class introText;
    class lightningBetween;
    class portalOpening;
    class sparksEffectClient { postInit = 1; };
    class sparksEffectServer;
    class sparksGetPos;
    class sparkSmall { postInit = 1; };
    class switch;
  };

  class phase1 {
    tag = "GRAD_VM_phase1";
    file = "USER\functions\phase1";
    class portalOpening;
    class stoneHengeFX;
  };

  class teleport {
    tag = "GRAD_VM_teleport";
    file = "USER\functions\teleport";
    class despawnEffect;
    class setPitchBankYaw;
    class teleport;
    class teleportFX;
    class teleportInit;
    class wormHole;
  };

};
