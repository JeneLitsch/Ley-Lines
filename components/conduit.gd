extends Component;

func placed() -> void:
	_update_tile(false);



func tick(input : Array[Vector2i]) -> void:
	var is_active = not input.is_empty();
	_update_tile(is_active);
	if is_active:
		output.emit(_position, _position + get_forward());



func _update_tile(is_active : bool):
	tile_updated.emit(_position, 0, Vector2i(int(is_active), _rotation));
	


func get_type() -> StringName:
	return &"conduit";
