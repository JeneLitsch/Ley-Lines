extends Component;

var _input : bool = false;


func _placed() -> void:
	tile_updated.emit(_position, Vector2i(int(_input), 2));



func _tick_input(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();


	
func _tick_process() -> void:
	if _input:
		print("on");
	tile_updated.emit(_position, Vector2i(int(_input), 2));
	_input = false;



func _tick_output() -> void:
	pass;
