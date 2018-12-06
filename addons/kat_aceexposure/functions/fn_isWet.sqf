/*
 * Author: Katalam
 * Checks: Is unit clothes wet?
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is wet <BOOLEAN>
 *
 * Example:
 * [player] call kat_aceExposure_fnc_isWet;
 *
 * Public: No
 */

params ["_unit"];

private _return = false;

// exit true if unit stand in sea water
if (surfaceIsWater position _unit) exitWith {
	_unit setVariable ["kat_aceExposure_clothesWet", false, true];
	true;
};
// exit true if unit is underwater
if (underwater _unit) exitWith {
	_unit setVariable ["kat_aceExposure_clothesWet", false, true];
	true;
};
// exit true if rain intensity is over 0.5
if (rain > 0.5) exitWith {
	_unit setVariable ["kat_aceExposure_clothesWet", false, true];
	true;
};
// when it rains change missionNamespace variable
if (rain > 0 && !(missionNamespace getVariable ["kat_aceExposure_rain", [false, CBA_MissionTime]] select 0)) then {
	missionNamespace setVariable ["kat_aceExposure_rain", [true, CBA_MissionTime]];
};
// if it does not rain and rain is 500 frames ago change missionNamespace variable
if ((rain == 0) && (missionNamespace getVariable ["kat_aceExposure_rain", [false, CBA_MissionTime]] select 1 > (CBA_MissionTime + 300))) then {
	_unit setVariable ["kat_aceExposure_clothesWet", false, true];
};
// when it rains easily for more then 500 frames change clothes to wet
if ((missionNamespace getVariable ["kat_aceExposure_rain", [false, CBA_MissionTime]]) select 1 > (CBA_MissionTime + 300)) then {
	_unit setVariable ["kat_aceExposure_clothesWet", true, true];
	_return = true;
};

_return;
