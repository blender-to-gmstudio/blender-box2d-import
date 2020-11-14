/// @description Test object
map_data = brb_open("physics_rbworld.phy");
lst_objects = brb_objects(map_data);
map_obj_data = lst_objects[|3];
body = brb_get_body(map_obj_data, 0, 1);
brb_close(map_data);
brb_bind_body(body, id);
brb_delete_body(body);