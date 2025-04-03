extends "logic.gd";


func _operation(a : bool, b : bool) -> bool:
	return a or b;


func _update_tile(is_active : bool):
	tile_updated.emit(_position, 5, Vector2i(int(is_active), _rotation));



func get_type() -> StringName:
	return &"logic_or";
