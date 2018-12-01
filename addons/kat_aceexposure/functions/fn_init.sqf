/*
 * Author: Katalam
 * Initializes unit variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_aceExposure_fnc_init;
 *
 * Public: No
 */

params ["_unit"];

_unit setVariable ["kat_aceExposure_temperature", 36.7, true];
