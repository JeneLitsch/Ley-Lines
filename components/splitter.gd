extends Component;


func placed() -> void:
	_update_tile(false);



func tick(input : Array[Vector2i]) -> void:
	var is_active = input.has(get_backward());
	_update_tile(is_active);
	if is_active:
		output.emit(_position, _position + get_left());
		output.emit(_position, _position + get_forward());
		output.emit(_position, _position + get_right());



func _update_tile(is_active : bool):
	tile_updated.emit(_position, 3, Vector2i(int(is_active), _rotation));
	


func get_type() -> StringName:
	return &"splitter";
