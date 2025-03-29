extends Component;

var _input : bool;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	if input.has(get_backward()):
		_input = !_input;
	
	
	
func tick_process() -> void:
	_update_tile();
	
	
	
func tick_output() -> void:
	if _input:
		output.emit(_position, _position + get_forward());



func _update_tile():
	tile_updated.emit(_position, 8, Vector2i(int(_input), _rotation));
	
