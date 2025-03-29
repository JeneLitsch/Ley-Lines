extends Component;

var _input : bool = false;
var _state : bool = false;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();


	
func tick_process() -> void:
	if _state != _input:
		_update_tile();
		_state = _input;
	_input = false;



func tick_output() -> void:
	pass;


func _update_tile():
	tile_updated.emit(_position, 2, Vector2i(int(_input), 0));
