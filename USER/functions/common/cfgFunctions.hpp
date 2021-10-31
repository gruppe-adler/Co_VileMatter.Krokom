class GRAD_VM_common {
    tag = "GRAD_VM_common";
    class common {
       
        file = "USER\functions\common";
        class actionEventhandlerClient { postInit = 1; };
        class actionEventhandlerServer { postInit = 1; };
        class actionEventhandlerSwitch { postInit = 1; };
        class activateAction;
        class addCuratorModules { preInit = 1; };

        class curatorEventhandler { postInit = 1; };
        class curatorShowFeedbackMessage;
        class replaceRoads { preInit = 1; };
        class objectIsOnScreen {};
        class ropeCreate;
        class setObjectScaleSafe;
        class respawnPlayer;
        class healSelf;
        class checkLifestate { postInit = 1; };
    };
};
