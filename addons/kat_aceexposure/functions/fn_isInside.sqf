/*
 * Author: Katalam
 * Checks: Is unit inside a house?
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is inside <BOOLEAN>
 *
 * Example:
 * [player] call kat_aceExposure_fnc_isInside;
 *
 * Public: No
 */

params ["_unit"];

private _Pos = getPosWorld _unit;
private _height = getPosWorld _unit vectorAdd [0, 0, 50];
private _intersections = lineIntersectsSurfaces [_Pos, _height, _unit, objNull, true, 1, "GEOM", "NONE"];
(_intersections select 0) params ["","","","_house"];
if (_house isKindOf "House") exitWith {true};
false;
