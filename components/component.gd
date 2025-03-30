class_name Component;
extends RefCounted;

var _position : Vector2i = Vector2i.ZERO;
var _rotation : int = 0;

signal output(from : Vector2i, to : Vector2i);
signal tile_updated(tile_coords : Vector2i, source_id : int, atlas_coords : Vector2i);



func _init(position : Vector2i, rotation : int) -> void:
	_position = position;
	_rotation = rotation;



func placed() -> void:
	pass;



func removed() -> void:
	tile_updated.emit(_position, -1, Vector2i(-1,-1));



func clicked() -> void:
	pass;



func tick_input(input : Array[Vector2i]) -> void:
	pass;



func tick_process() -> void:
	pass;



func tick_output() -> void:
	pass;



func get_position() -> Vector2i:
	return _position;



static func rotation_to_direction(rotation : int) -> Vector2i:
	match rotation % 4:
		0: return Vector2i.UP;
		1: return Vector2i.RIGHT;
		2: return Vector2i.DOWN;
		3: return Vector2i.LEFT;
	return Vector2i.UP;



func get_forward() -> Vector2i:
	return rotation_to_direction(_rotation + 0);



func get_backward() -> Vector2i:
	return rotation_to_direction(_rotation + 2);



func get_right() -> Vector2i:
	return rotation_to_direction(_rotation + 1);



func get_left() -> Vector2i:
	return rotation_to_direction(_rotation + 3);



func get_type() -> StringName:
	return &"";


func save_state() -> Variant:
	return null;



func post_load_state(data):
	pass;



func save() -> Dictionary:
	return {
		type      = get_type(),
		position  = {
			x = _position.x,
			y = _position.y,
		},
		rotation  = _rotation,
		state     = save_state(),
	}
