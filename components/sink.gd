extends Component;

var _input : bool = false;
var _is_active : bool = false;

func placed() -> void:
	_update_tile();



func tick(input : Array[Vector2i]) -> void:
	_input = not input.is_empty();
	if _is_active != _input:
		_update_tile();
		_is_active = _input;
	_input = false;



func _update_tile():
	tile_updated.emit(_position, 2, Vector2i(int(_input), 0));



func get_type() -> StringName:
	return &"sink";
