extends Component;

var _state : bool;

func placed() -> void:
	_update_tile();



func tick(input : Array[Vector2i]) -> void:
	if input.has(get_backward()):
		_state = !_state;
	_update_tile();
	if _state:
		output.emit(_position, _position + get_forward());
	


func _update_tile():
	tile_updated.emit(_position, 8, Vector2i(int(_state), _rotation));
	


func get_type() -> StringName:
	return &"sequencer";



func save_state():
	return _state;



func post_load_state(data):
	_state = !data;
	_update_tile();
