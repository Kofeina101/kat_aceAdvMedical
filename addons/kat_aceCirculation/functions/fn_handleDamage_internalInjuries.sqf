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

params ["_unit", "_selectionName", "_amountOfDamage", "", "_typeOfDamage"];

if !(kat_aceCirculation_internalInjuries_enable) exitWith {};

if (_amountOfDamage > 0.75) then {
  if (random(100) <= kat_aceCirculation_internalInjuries_probability) then {
    private _selection = _unit getVariable ["kat_aceCirculation_internalInjuries", [0,0,0,0,0,0]];
    private _selectionNumber = [_selectionName] call ace_medical_fnc_selectionNameToNumber;
    private _woundSource = getArray (configfile >> "ACE_Medical_Advanced" >> "Injuries" >> "internal" >> "artery" >> "causes");
    if !(_typeOfDamage in _woundSource || _woundSource isEqualTo "All") exitWith {};
    if !((_selection select _selectionNumber) > 0) then {
      _selection set [_selectionNumber, 1];
      _unit setVariable ["kat_aceCirculation_internalInjuries", _selection, true];
    };
  };
};

private _selection = _unit getVariable ["kat_aceCirculation_internalInjuries", [0,0,0,0,0,0]];
private _selectionNumber = [_selectionName] call ace_medical_fnc_selectionNameToNumber;
private _internalInjury = [configfile >> "ACE_Medical_Advanced" >> "Injuries" >> "Internal", 1, true, true] call BIS_fnc_returnChildren;

private _amount = _internalInjury select {_amountOfDamage >= getNumber (_internalInjury >> "minDamage") && _amountOfDamage <= getNumber (_internalInjury >> "maxDamage")};
private _select = _amount select {_selectionName in getArray (_internalInjury >> "selections") || "All" in getArray (_internalInjury >> "selections")};
private _causes = _select select {_typeOfDamage in getArray (_internalInjury >> "causes")};
if (count _causes > 1) then {_causes = selectRandom _causes};
if (count _causes == 0) exitWith {};
if !((_selection select _selectionNumber) > 0) then {
  _selection set [_selectionNumber, 1];
  _unit setVariable ["kat_aceCirculation_internalInjuries", _selection, true];
};
