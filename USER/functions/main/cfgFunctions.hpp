class GRAD_VM_main {
  tag = "GRAD_VM_main";

  class main {
      file = "USER\functions\main";
      class getCurrentPhase;
      class getCurrentTeleportTarget; 
      class getPhaseMaxProgress;
      class getPhaseProgress;
      class init { postInit = 1; };
      class initPhase0;
      class initPhase1;
      class initPhase2;
      class initPhase3;
      class phaseEventHandler { postInit = 1; };
   };
};
