extends "logic.gd";


func _operation(a : bool, b : bool) -> bool:
	return a or b;


func _update_tile():
	tile_updated.emit(_position, 5, Vector2i(int(_result), _rotation));
