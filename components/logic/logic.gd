extends Component;

func placed() -> void:
	_update_tile(false);


func _operation(a : bool, b : bool) -> bool:
	return false;


func tick(input : Array[Vector2i]) -> void:
	var input_a = input.has(get_left());
	var input_b = input.has(get_right());
	var result = _operation(input_a, input_b);
	_update_tile(result);
	if result:
		output.emit(_position, _position + get_forward());



func _update_tile(_is_active : bool):
	tile_updated.emit(_position, -1, Vector2i(-1, -1));
	
