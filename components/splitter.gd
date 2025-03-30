extends Component;

var _input : bool;
var _is_active : bool;

func placed() -> void:
	_update_tile();



func tick_input(input : Array[Vector2i]) -> void:
	_input = input.has(get_backward());
	
	
	
func tick_process() -> void:
	_update_tile();
	_is_active = _input;
	_input = false;
	
	
	
func tick_output() -> void:
	if _is_active:
		output.emit(_position, _position + get_left());
		output.emit(_position, _position + get_forward());
		output.emit(_position, _position + get_right());



func _update_tile():
	tile_updated.emit(_position, 3, Vector2i(int(_input), _rotation));
	


func get_type() -> StringName:
	return &"splitter";
