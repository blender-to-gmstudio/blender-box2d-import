/// @func brb_bind_body(body, obj)
///
/// @desc Bind the given body to the current instance
/// 
/// @param {list} body The list of fixtures as returned by brb_get_body
///
/// To be used with exporter version 0.7.2
///
function brb_bind_body(argument0, argument1) {

	for(var i = 0;i < ds_list_size(argument0);i++) {
		physics_fixture_bind(argument0[|i], argument1);
	}


}
