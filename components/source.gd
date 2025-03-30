extends Component;

var _is_active : bool = false;



func placed() -> void:
	_update_tile();



func clicked() -> void:
	_is_active  = !_is_active;
	_update_tile();



func tick_process() -> void:
	pass;


func tick_output() -> void:
	if _is_active:
		output.emit(_position, _position - Vector2i(1,0));
		output.emit(_position, _position + Vector2i(1,0));
		output.emit(_position, _position - Vector2i(0,1));
		output.emit(_position, _position + Vector2i(0,1));



func _update_tile():
	tile_updated.emit(_position, 1, Vector2i(int(_is_active), 0));



func get_type() -> StringName:
	return &"source";



func save_state() -> Variant:
	return _is_active;


func post_load_state(data):
	_is_active = data;
	_update_tile();
