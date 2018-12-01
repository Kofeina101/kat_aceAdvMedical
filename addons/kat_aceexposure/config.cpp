#include "BIS_AddonInfo.hpp"
class CfgPatches
{
    class kat_aceExposure
    {
        units[] = {

		};
        weapons[] = {

		};
        requiredVersion = 1.80;
        requiredAddons[] = {
			"ace_medical",
      "cba_settings"
		};
		version = "0.1";
		versionStr = "0.1";
		author = "[SeL] Katalam";
		authorUrl = "http://spezialeinheit-luchs.de/";
    };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
};

class CfgFunctions {
	class kat_aceExposure {
    file = "kat_aceExposure\functions";
		class functions {
        class events{};
        class handleInit{};
        class init{};
        class isAttenuated{};
        class isInside{};
        class mainLoop{};
        class registerSettings{};
		};
	};
};

class Extended_PreInit_EventHandlers {
	class kat_aceExposure_preInit {
		init = "call kat_aceExposure_fnc_registerSettings";
	};
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class kat_aceExposure_init {
            init = "_this call kat_aceExposure_fnc_handleInit";
        };
    };
};
class Extended_PostInit_EventHandlers {
  class kat_aceExposure_postInit {
    init = "call kat_aceExposure_fnc_events";
  };
};

class cfgVehicles {
class Man;
	class CAManBase: Man {
		class ACE_Actions {
      class ACE_Torso {
        class Temperature {
          displayName = $STR_KAT_aceCirculation_Inject_Painkillers;
          condition = "[_player, _target, 'hand_l', 'Temperature'] call ace_medical_fnc_canTreatCached";
          statement = "[_player, _target, 'hand_l', 'Temperature'] call ace_medical_fnc_treatment";
        };
      };
    };
  };
};

class ACE_Medical_Actions {
	class Advanced {
    class Temperature {
      displayName = "$STR_kat_aceAirway_Larynx_Display";
      displayNameProgress = $STR_kat_aceAirway_action_placing;
      category = "airway";
      treatmentLocations[] = {"All"};
      allowedSelections[] = {"head"};
      allowSelfTreatment = 0;
      requiredMedic = 1;
      treatmentTime = 5;
      items[] = {"KAT_larynx"};
      condition = "!([_target] call ace_common_fnc_isAwake) && (missionNamespace getVariable ['kat_aceExposure_enable',true])";
      patientStateCondition = 0;
      callbackSuccess = "[_player, _target, 'Larynxtubus'] call kat_aceAirway_fnc_treatmentAdvanced_airway";
      callbackFailure = "";
      callbackProgress = "";
      itemConsumed = 1;
      animationPatient = "";
      animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
      animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
      animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
      animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
      animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
      animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
      litter[] = {};
    };
	};
};
