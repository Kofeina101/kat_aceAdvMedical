/*
 * Author: Katalam
 * Handle the unit init.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_aceCirculation_fnc_handleInit;
 *
 * Public: No
 */

params ["_unit"];

if !(kat_aceCirculation_internalInjuries_enable) then {
	_unit addEventHandler ["HandleDamage", {_this call kat_aceCirculation_fnc_handleDamage_internalInjuries;}];
};

_unit call kat_aceCirculation_fnc_init;
