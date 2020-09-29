/// @func brb_delete_body(body)
///
/// @desc delete the given body
///
/// @param {map} a valid body as returned by brb_get_body
///	To be used with exporter version 0.7.2
///

for(var i = 0;i < ds_list_size(argument0);i++) {
	physics_fixture_delete(argument0[|i]);
}
ds_list_destroy(argument0);