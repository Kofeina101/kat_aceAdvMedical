/*
 * Author: Katalam
 * Handler for internal injuries.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "leg_l", 2] call kat_aceAirway_fnc_handleDamage_internalInjuries;
 *
 * Public: No
 */

params ["_unit", "_selectionName", "_amountOfDamage"];

if !(kat_aceCirculation_internalInjuries_enable) exitWith {};

if (_amountOfDamage > 0.75) then {
  if (random(100) <= kat_aceCirculation_internalInjuries_probability) then {
    private _selection = _unit getVariable ["kat_aceCirculation_internalInjuries", [0,0,0,0,0,0]];
    private _selectionNumber = [_selectionName] call ace_medical_fnc_selectionNameToNumber;
    if !((_selection select _selectionNumber) > 0) then {
      _selection set [_selectionNumber, 1];
      _unit setVariable ["kat_aceCirculation_internalInjuries", _selection, true];
    };
  };
};
