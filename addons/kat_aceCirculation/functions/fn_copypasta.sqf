private _timeSpent = _target getVariable ["diw_time_spent", 0];
private _timeToSpent = 150;
private _text = "Working the laptop";
_timeToSpent = _timeToSpent - _timeSpent;
_target setVariable ["diw_occupied", ace_player, true];
if(ace_player isKindOf "C_Man_casual_6_F") then {
    _timeToSpent = _timeToSpent / 2;
    _text = "Hacking the mainframe";
};
[_timeToSpent, [_target],
    {
        params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
        _args params ["_target"];
        // success code here
    },
    {
        // interruption code
        params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
        _args params ["_target"];
        if ((_target getVariable ["diw_occupied", objNull]) == ace_player) then {
            if (ace_player isKindOf "C_Man_casual_6_F") then {
                _elapsedTime = _elapsedTime * 2;
            };
            private _timeSpent = (_target getVariable ["diw_time_spent",0]) + _elapsedTime;
            _target setVariable ["diw_time_spent", _timeSpent, true];
            _target setVariable ["diw_occupied", objNull, true];
        };
    },
    _text,
    {
        // continue code
        params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
        _args params ["_target"];
        if ((_target getVariable ["diw_occupied", objNull]) != ace_player) exitWith {
            false
        };
        true
    }] call ace_common_fnc_progressBar;
