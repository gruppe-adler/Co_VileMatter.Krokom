class vm_vilematter_phase1 {

    class AllUnits {
        uniform[] = {"JMSL_Barb_clot_2_blue_F_CombatUniform", "JMSL_Barb_tunic_3_brownL_F_CombatUniform", "JMSL_Barb_clot_2_black_F_CombatUniform", "JMSL_Barb_clot_2_blue_F_CombatUniform"};
        vest[] = {"JMSL_Barb_SkinArmor_1_A", "JMSL_Barb_SkinArmor_2_A", "JMSL_Barb_SkinArmor_3_A", "JMSL_Barb_SkinArmor_4_A"};
        backpack = "";
        primaryWeapon = "";
        primaryWeaponMagazine = "";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponOptics = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
        handgunWeaponMagazine = "";
        binoculars = "";
        map = "";
        compass = "";
        watch = "";
        gps = "";
        radio = "";
    };

    class Type {
        //Rifleman
        class Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine= "";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            backpack = "";
            headgear = "JMSL_Celtic_Helmet_2_stal_H";
            nvgoggles = "";
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine= "";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "JMSL_Celt_CapeMail_1_A";
            backpack = "";
        };

        //Asst. Gunner (MMG) / Ammo Bearer
        class soldier_A_F: Soldier_F {
            primaryWeapon = "JMSL_W_Longbow";
            primaryWeaponMagazine= "JMSL_WM_Arrow_Mag";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "JMSL_Celt_CapeMail_1_A";
            addItemsToBackpack[] = { LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag")};
            backpack = "JMSL_back_arrowpack_full_1";
            nvgoggles = "";
            };

        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {
        };

        //Asst. Missile Specialist (AA)
        class soldier_AAA_F: Soldier_F {
        };

        //Asst. Missile Specialist (AT)
        class soldier_AAT_F: Soldier_F {
            primaryWeapon = "JMSL_W_Longbow";
            primaryWeaponMagazine= "JMSL_WM_Arrow_Mag";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "JMSL_Celt_CapeMail_1_A";
            nvgoggles = "";
            backpack = "JMSL_back_arrowpack_full_1";
            addItemsToBackpack[] = { LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag")};
        };

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine= "";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "JMSL_Celt_CapeMail_1_A";
            backpack = "";
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            primaryWeapon = "JMSL_W_Longbow";
            primaryWeaponMagazine= "JMSL_WM_Arrow_Mag";
            handgunWeapon = "RM_Fire_Torch";
            handgunWeaponMuzzle = "RM_torch_fluid";
            vest = "JMSL_Celt_CapeMail_1_A";
            addItemsToBackpack[] = {"RM_torch_fluid"};
            backpack = "JMSL_back_arrowpack_full_1";
            addItemsToBackpack[] = { LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag")};
        };

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
        };

        //Grenadier
        class Soldier_GL_F: Soldier_F {
        };

        //Heavy Gunner (MMG)
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine= "";
            primaryWeaponPointer = "";
            primaryWeaponMuzzle = "";
            handgunWeapon = "JMSL_W_Melee_Celt_sword_1";
            vest = "JMSL_Celt_CapeMail_1_A";
        };

        //Gunner (HMG/GMG)
        class support_MG_F: Soldier_F {
        };

        //Marksman
        class soldier_M_F: Soldier_F {
        };

        //Missile Specialist (AA)
        class soldier_AA_F: Soldier_F {
        };

        //Missile Specialist (AT)
        class soldier_AT_F: Soldier_F {
        };

        //Repair Specialist
        class soldier_repair_F: Soldier_F {
        };

        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            primaryWeapon = "JMSL_W_Longbow";
            primaryWeaponMagazine= "JMSL_WM_Arrow_Mag";
            vest = "JMSL_Celt_CapeMail_1_A";
            backpack = "JMSL_back_arrowpack_full_1";
            headgear = "JMSL_Celtic_Helmet_2_1_stal_H";
            handgunWeapon = "RM_Fire_Torch";
            handgunWeaponMuzzle = "RM_torch_fluid";
            addItemsToBackpack[] = { LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag")};
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            primaryWeapon = "JMSL_W_Longbow";
            primaryWeaponMagazine= "JMSL_WM_Arrow_Mag";
            handgunWeapon = "RM_Fire_Torch";
            handgunWeaponMuzzle = "RM_torch_fluid";
            vest = "JMSL_Celt_CapeMail_1_A";
            backpack = "JMSL_back_arrowpack_full_1";
            headgear = "JMSL_Celtic_Helmet_1_stal_H";
            nvgoggles = "";
            addItemsToBackpack[] = { LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag"), LIST_20("JMSL_WM_Arrow_Mag")};
        };
    };
};
