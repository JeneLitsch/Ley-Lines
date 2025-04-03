extends "logic.gd";


func _operation(a : bool, b : bool) -> bool:
	return a and b;



func _update_tile(is_active : bool):
	tile_updated.emit(_position, 4, Vector2i(int(is_active), _rotation));



func get_type() -> StringName:
	return &"logic_and";
