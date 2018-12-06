/*
 * Author: Katalam
 * Main loop for body temperature.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_aceExposure_fnc_mainLoop;
 *
 * Public: No
 */

[{
	params ["_unit"];
	private _oldTemp = _unit getVariable ["kat_aceExposure_temperature", 37.7];
	if (_unit call kat_aceExposure_fnc_isInside || _unit call kat_aceExposure_fnc_isAttenuated) then {
		[_unit, CBA_MissionTime] call kat_aceExposure_fnc_heat;
	};
}, 1, [_this]] call CBA_fnc_addPerFrameHandler;

/*
 * Body temperature is in the morning at a minimum: 36.5
 * in afternoon at a maximum: 37.8
 * When its too cold you can't aim perfectly 'cause the body lowers the circulation in the extremities
 * Rain, underwater, jacket, wind, blood pressure, inside vehicle, open vehicle or not
 *
 * rain between 1 ... 0;
 * underwater <BOOLEAN>;
 * in Water surfaceIsWater <BOOLEAN>;
 * jacket "U_B_CombatUniform_mcam_tshirt" base class;
 * wind <ARRAY> [x,y,0] in m/s
 * bloodpressure <ARRAY> [down, up];
 * vehicle player
 * open vehicle -> isAttenuated;
 *
 * Config: Clothes isolation value
 * Function: Clothes wet
 * Function: Clothes dry
 * Function: Main Loop
 * Function: heat
 *
 *
 *
 */
