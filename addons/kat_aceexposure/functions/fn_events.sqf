/*
 * Author: Katalam
 * CBA Events function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call kat_aceExposure_fnc_events;
 *
 * Public: No
 */

if !(kat_aceExposure_enable) exitWith {};

//["", {_this call kat_aceExposure_fnc_}] call CBA_fnc_addEventHandler;
missionNamespace setVariable ["kat_aceExposure_rain", [false, CBA_MissionTime]];
