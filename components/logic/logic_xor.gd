extends "logic.gd";


func _operation(a : bool, b : bool) -> bool:
	return a != b;


func _update_tile(is_active : bool):
	tile_updated.emit(_position, 6, Vector2i(int(is_active), _rotation));



func get_type() -> StringName:
	return &"logic_xor";
