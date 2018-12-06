/*
 * Author: Katalam
 * Handle a operation to the unit.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, player] call kat_aceCirculation_fnc_handleOperation;
 *
 * Public: No
 */

params ["_target", "_unit"];

private _timeSpent = _target getVariable ["kat_aceCirculation_time_spent", 0];
private _timeToSpent = 150; // TO-DO localize
_timeToSpent / (0.75^(_target call kat_aceCirculation_fnc_countAssitant_Operation));
private _text = "Working the laptop"; // TO-DO localize

_timeToSpent = _timeToSpent - _timeSpent;


_target setVariable ["kat_aceCirculation_occupied", _unit, true];

if (_unit call ace_medical_fnc_isMedic == 1) then {
    _timeToSpent = _timeToSpent * 1.33;
};

[_timeToSpent, [_target, _unit], {
	// Finish code here
	params ["_args", "_elapsedTime"];
	_args params ["_target", "_unit"];

	_target setVariable ["kat_aceCirculation_time_spent", 0, true];
	_target setVariable ["kat_aceCirculation_occupied", objNull, true];

}, {
	// Failure code here
	params ["_args", "_elapsedTime"];
	_args params ["_target", "_unit"];

	if (_unit call ace_medical_fnc_isMedic == 1) then {
			_elapsedTime = _elapsedTime / 1.33;
	};

	private _timeSpent = (_target getVariable ["kat_aceCirculation_time_spent", 0]) + _elapsedTime;
	_target setVariable ["kat_aceCirculation_time_spent", _timeSpent, true];
	_target setVariable ["kat_aceCirculation_occupied", objNull, true];
}, _text, {
	// Conditional code here
	params ["_args"];
	_args params ["_target", "_unit"];

	if ((_target getVariable ["kat_aceCirculation_occupied", objNull]) != _unit) exitWith {
  	false;
	};
	true;
}] call ace_common_fnc_progressBar;
