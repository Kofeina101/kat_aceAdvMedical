/*
 * Author: Katalam
 * Handle the assistants for operation.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * 0: How many assistants available? <NUMBER>
 *
 * Example:
 * [player] call kat_aceCirculation_fnc_countAssistant_Operation;
 *
 * Public: No
 */

params ["_target"];

private _assistants = _target getVariable ["kat_aceCirculation_assistant", []];
if !(_assistants isEqualType []) exitWith {0};
private _counts = count _assistants;
_counts;
