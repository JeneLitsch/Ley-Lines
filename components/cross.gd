extends Component;

func placed() -> void:
	_update_tile(false);



func tick(input : Array[Vector2i]) -> void:
	var input_a = input.has(get_backward());
	var input_b = input.has(get_left());
	_update_tile(input_a or input_b);
	if input_a:
		output.emit(_position, _position + get_forward());
	if input_b:
		output.emit(_position, _position + get_right());



func _update_tile(is_active : bool):
	tile_updated.emit(_position, 9, Vector2i(int(is_active), _rotation));
	


func get_type() -> StringName:
	return &"conduit";
