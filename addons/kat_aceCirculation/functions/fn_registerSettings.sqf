/*
 * Author: Katalam
 * CBA Settings function
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call kat_aceCirculation_fnc_registerSettings;
 *
 * Public: No
 */

#define CBA_SETTINGS_CAT "KAT - ACE Circulation"

//Enable aceCirculation things
[
	"kat_aceCirculation_enable",
	"CHECKBOX",
	localize "STR_kat_aceCirculation_SETTING_ENABLE",
	CBA_SETTINGS_CAT,
	[true],
	true
] call CBA_Settings_fnc_init;

//Enable internal injuries
[
	"kat_aceCirculation_internalInjuries_enable",
	"CHECKBOX",
	localize "STR_kat_aceCirculation_SETTING_internalInjuries",
	CBA_SETTINGS_CAT,
	[true],
	true
] call CBA_Settings_fnc_init;

// internal Injuries probability
[
	"kat_aceCirculation_internalInjuries_probability",
	"SLIDER",
	localize "STR_kat_aceAirway_SETTING_collapsed", // TO-DO loalize
	CBA_SETTINGS_CAT,
	[0, 100, 5, 0],
	true
] call CBA_Settings_fnc_init;

nil;
