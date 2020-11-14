/// @func brb_open(filename)
///
/// @desc   Open the given .phy file and return the index of the ds_map data structure
///
/// @param  {string} filename (json-based "*.phy")
///
///	@return {map} Handle to physics description (root node of a nested data structure)
///
///	Remarks	 :	none
///
#macro phy_debug_render_all phy_debug_render_aabb|phy_debug_render_collision_pairs|phy_debug_render_coms|phy_debug_render_core_shapes|phy_debug_render_joints|phy_debug_render_obb|phy_debug_render_shapes

function brb_open(argument0) {
	var file = file_text_open_read(argument0);
	if (file == -1) {
	    return -1;		// Early out
	}
	var json_string = "";
	while (!file_text_eof(file)) {
		json_string += file_text_readln(file);
	}
	file_text_close(file);

	return json_decode(json_string);
}