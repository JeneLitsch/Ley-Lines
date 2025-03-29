extends Component;

var _input_a : bool;
var _input_b : bool;
var _result : bool;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	_input_a = input.has(get_left());
	_input_b = input.has(get_right());



func _operation(a : bool, b : bool) -> bool:
	return false;


func tick_process() -> void:
	_result = _operation(_input_a, _input_b);
	_update_tile();
	
	
	
func tick_output() -> void:
	if _result:
		output.emit(_position, _position + get_forward());



func _update_tile():
	tile_updated.emit(_position, -1, Vector2i(-1, -1));
	
