extends Component;

var _active : bool = false;



func _placed() -> void:
	tile_updated.emit(_position, Vector2i(int(_active), 0));



func _clicked() -> void:
	_active = !_active;



func _tick_process() -> void:
	tile_updated.emit(_position, Vector2i(int(_active), 0));



func _tick_output() -> void:
	if _active:
		output.emit(_position, _position - Vector2i(1,0));
		output.emit(_position, _position + Vector2i(1,0));
		output.emit(_position, _position - Vector2i(0,1));
		output.emit(_position, _position + Vector2i(0,1));
