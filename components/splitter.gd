extends Component;

var _input : bool;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	_input = input.has(get_backward());
	
	
	
func tick_process() -> void:
	_update_tile();
	
	
	
func tick_output() -> void:
	if _input:
		output.emit(_position, _position + get_left());
		output.emit(_position, _position + get_forward());
		output.emit(_position, _position + get_right());
	_input = false;



func _update_tile():
	tile_updated.emit(_position, 3, Vector2i(int(_input), _rotation));
	
