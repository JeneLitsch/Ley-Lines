extends Component;

var _active : bool = false;



func placed() -> void:
	_update_tile();



func clicked() -> void:
	_active = !_active;
	_update_tile();



func tick_process() -> void:
	pass;


func tick_output() -> void:
	if _active:
		output.emit(_position, _position - Vector2i(1,0));
		output.emit(_position, _position + Vector2i(1,0));
		output.emit(_position, _position - Vector2i(0,1));
		output.emit(_position, _position + Vector2i(0,1));



func _update_tile():
	tile_updated.emit(_position, 1, Vector2i(int(_active), 0));
