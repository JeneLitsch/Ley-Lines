extends Component;

var _input : bool;
var _state : bool;

func placed() -> void:
	_update_tile();


	
func tick(input : Array[Vector2i]) -> void:
	_input = not input.has(get_backward());
	_update_tile();
	_state = _input;
	if _input:
		output.emit(_position, _position + get_forward());
	_input = false;



func _update_tile():
	tile_updated.emit(_position, 7, Vector2i(int(_input), _rotation));
	



func get_type() -> StringName:
	return &"logic_not";
