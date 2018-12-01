/*
 * Author: Katalam
 * Handles unit init.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_aceExposure_fnc_handleInit;
 *
 * Public: No
 */

params ["_unit"];

if !(kat_aceExposure_enable) exitWith {};

_unit call kat_aceExposure_fnc_init;
