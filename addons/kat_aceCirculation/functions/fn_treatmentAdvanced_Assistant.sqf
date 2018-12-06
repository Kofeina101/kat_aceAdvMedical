/*
 * Author: Katalam
 * Will add a assistant for a operation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call kat_aceCirculation_fnc_treatmentAdvanced_Assistant;
 *
 * Public: No
 */

params ["_player", "_target"];

private _assistants = _target getVariable ["kat_aceCirculation_assistant", []];
if !(_assistants isEqualType []) then {_assistants = []};
private _newAss = _assistants + [_player];
_target setVariable ["kat_aceCirculation_assistant", _newAss];

[{
  params ["_player", "_target"];
  (_target distance2D _player) > 5;
}, {
  params ["_player", "_target"];
	private _assistants = _target getVariable ["kat_aceCirculation_assistant", []];
	if !(_assistants isEqualType []) then {_assistants = []};
	private _newAss = _assistants - [_player];
	_target setVariable ["kat_aceCirculation_assistant", _newAss];
  private _output = localize "STR_kat_aceAirway_overstretch_cancel"; // TO-DO localize
  [_output, 1.5, _player] call ace_common_fnc_displayTextStructured;
}, [_player, _target], 300, {
  params ["_player", "_target"];
	private _assistants = _target getVariable ["kat_aceCirculation_assistant", []];
	if !(_assistants isEqualType []) then {_assistants = []};
	private _newAss = _assistants - [_player];
	_target setVariable ["kat_aceCirculation_assistant", _newAss];
  private _output = localize "STR_kat_aceAirway_overstretch_cancel"; // TO-DO localize
  [_output, 1.5, _player] call ace_common_fnc_displayTextStructured;
}] call CBA_fnc_waitUntilAndExecute;
