/// @func brb_apply_fix_settings(fixture, map, density)
///
/// @desc Applies the settings in the JSON to the given fixture
///
/// @param fixture
/// @param map
/// @param density
///
///	To be used with exporter version 0.7.2
///
function brb_apply_fix_settings(argument0, argument1, argument2) {

	var fix = argument0, map_physics_data = argument1, density = argument2;
	physics_fixture_set_density(fix,density);
	physics_fixture_set_angular_damping(fix,map_physics_data[?"angular_damping"]);
	physics_fixture_set_linear_damping(fix,map_physics_data[?"linear_damping"]);
	physics_fixture_set_restitution(fix,map_physics_data[?"restitution"]);
	physics_fixture_set_friction(fix,map_physics_data[?"friction"]);
	physics_fixture_set_collision_group(fix,map_physics_data[?"collision_group"]);


}
