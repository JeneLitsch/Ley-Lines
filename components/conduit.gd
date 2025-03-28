extends Component;

var _input : bool;

func _placed() -> void:
	tile_updated.emit(_position, Vector2i(int(_input), 1));



func _tick_input(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();
	
	
	
func _tick_process() -> void:
	tile_updated.emit(_position, Vector2i(int(_input), 1));
	
	
	
func _tick_output() -> void:
	if _input:
		output.emit(_position, _position + Vector2i(1,0));
	_input = false;
