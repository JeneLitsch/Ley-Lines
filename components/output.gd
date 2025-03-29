extends Component;

var _input : bool = false;


func _placed() -> void:
	_update_tile();



func _tick_input(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();


	
func _tick_process() -> void:
	if _input:
		print("on");
	_update_tile();
	_input = false;



func _tick_output() -> void:
	pass;


func _update_tile():
	tile_updated.emit(_position, 2, Vector2i(int(_input), 0));
