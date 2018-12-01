/*
 * Author: shukari
 * Is the unit in a open or closed vehicle?
 *
 * When it's merged to CBA it will removed. All credits to shukari.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * open or closed vehicle <BOOLEAN>
 *
 * Example:
 * [player] call kat_aceExposure_fnc_isAttenuated;
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];
 // outside of the vehicle or turned out
if (isNull objectParent _unit) exitWith {false};
private _turnedOut = [_unit] call CBA_fnc_isTurnedOut;
if (_turnedOut) exitWith {false};
 // open vehicle
private _vehicle = vehicle _unit;
private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
 // class CfgSoundEffects >> class AttenuationsEffects
private _attenuationType = getText (_config >> "attenuationEffectType");
if (_attenuationType in ["OpenCarAttenuation", "OpenHeliAttenuation"]) exitWith {false};
 private _fullCrew = fullCrew _vehicle;
(_fullCrew select (_fullCrew findIf {_unit isEqualTo (_x param [0, objNull])})) params ["", "_role", "_cargoIndex", "_turretPath", "_isFFV"];
_role = toLower _role;
private _return = _isFFV;
 // override for enabledByAnimationSource FFVs
private _turret = [_vehicle, _turretPath] call CBA_fnc_getTurret;
private _enabledAnim = getText (_turret >> "enabledByAnimationSource");
if (!(_enabledAnim isEqualTo "") && {(_vehicle animationSourcePhase _enabledAnim) < 1}) then {
    _return = false;
};
 // API
private _attenuationAPI = _vehicle getVariable ["CBA_attenuatedRoles", []];
_attenuationAPI append (getArray (_config >> "CBA_attenuatedRoles"));
 if !(_attenuationAPI isEqualTo []) then {
    {
        _x params [["_configRole", "", [""]], ["_cargoOrTurretIndex", -1, [0]], ["_animation", "", [""]]];

        if (_configRole == _role && {_cargoOrTurretIndex isEqualTo _cargoIndex || _cargoOrTurretIndex isEqualTo _turretPath}) exitWith {
            _return = if !(_animation isEqualTo "") then {
                (_vehicle animationSourcePhase _animation) > 0
            } else {
                true // is everytime outside
            };
        };
    } forEach _attenuationAPI;
};
 // Fix for vanilla tank commanders
if (_return && {_role isEqualTo "commander"} && {!_turnedOut}) exitWith {true};
 // This exit is crucial for the difference between FFV and Override and normale roles
if (_return) exitWith {false}; // return
private _return = true;
 if (_role in ["gunner", "turret"]) exitWith {
    animationState _unit != getText (_turret >> "gunnerAction") // return
};
 if (_role isEqualTo "cargo") exitWith {
    private _attenuateCargo = getArray (_config >> "soundAttenuationCargo");
     // if attenuate array has less elements than the current cargo index, use the last value of the array
    private _cargoIndex = _cargoIndex min (count _attenuateCargo - 1);
     _attenuateCargo param [_cargoIndex, 1] != 0 // return
};
 // Specialcase
if (_return && {_role isEqualTo "gunner"} && {!_turnedOut}) exitWith {true}; // return
 _return
