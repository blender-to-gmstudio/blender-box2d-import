/// @func brb_close(brb_map)
///
/// @desc   Close/Free the data structure
///
/// @param  {map} brb_map a ds_map data structure as returned by brb_open
function brb_close(argument0) {

	ds_map_destroy(argument0);


}
