/// @func brb_get_body(map, density, scale)
///
/// @desc   Get the body of the given object if it has defined one
///         To be used with exporter version 0.7.2
///
/// @param  {map}  map      the map to get the body from
/// @param  {real} density  the density to be used
/// @param  {real} scale    global scale factor to apply to the fixtures
/// 
/// @return {list} A list of fixtures
///
#macro RIGIDBODY_VERSION	"0.7.2"

function brb_get_body(argument0, argument1, argument2) {
	var map_object_data = argument0,
	    density = argument1,
	    scale = is_undefined(argument2) ? 1 : argument2;

	if (ds_map_exists(map_object_data, "physics")) {
		var map_physics_data = map_object_data[?"physics"];
		var dimensions = map_object_data[?"object"][?"dimensions"];
		var shape = map_physics_data[?"collision_shape"];
		var shape = map_physics_data[?"collision_shape"];
	
		var lst_fixtures = ds_list_create();
	
		// Create a single fixture in those cases where we know we only have one
		if (shape != "MESH") {
			var fix = physics_fixture_create();
			brb_apply_fix_settings(fix,map_physics_data, density);
			ds_list_add(lst_fixtures,fix);		// Add it to the list already...
		}
	
		switch(shape) {
			case "BOX":
				physics_fixture_set_box_shape(fix,
	                dimensions[|0]/2 * scale,
	                dimensions[|1]/2 * scale
	            );
				break;
			case "CAPSULE":
			case "CYLINDER":
			case "SPHERE":
			case "CONE":
				physics_fixture_set_circle_shape(fix,dimensions[|0]/2 * scale);
				break;
			case "CONVEX_HULL":
				//physics_fixture_set_polygon_shape(fix);
				break;
			case "MESH":
				// We may have multiple chain fixtures. Load them all and add to the list
				var lst_coords_data = map_physics_data[?"coords"];
				for(var i = 0;i < ds_list_size(lst_coords_data);i++) {
					var lst_current = lst_coords_data[|i];
					var fix = physics_fixture_create();
					physics_fixture_set_chain_shape(fix, true);
					//physics_fixture_set_polygon_shape(fix);		// TESTING
					brb_apply_fix_settings(fix,map_physics_data, density);
					ds_list_add(lst_fixtures,fix);
				
					for(var j = 0;j < ds_list_size(lst_current);j++) {
					//for(var j = ds_list_size(lst_current)-1;j > 0;j--) {
						var lst_coords = lst_current[|j];
						physics_fixture_add_point(fix,lst_coords[|0] * scale,-lst_coords[|1] * scale);
					}
				}
				break;
			default:
				break;
		}
		return lst_fixtures;
	} else {
		return -1;
	}
}