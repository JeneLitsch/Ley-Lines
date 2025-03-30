extends Component;

var _input : bool;
var _state : bool;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();
	
	
	
func tick_process() -> void:
	_update_tile();
	_state = _input;
	_input = false;
	
	
func tick_output() -> void:
	if _state:
		output.emit(_position, _position + get_forward());



func _update_tile():
	tile_updated.emit(_position, 0, Vector2i(int(_input), _rotation));
	


func get_type() -> StringName:
	return &"conduit";
