class_name Component;
extends RefCounted;

var _position : Vector2i = Vector2i.ZERO;
var _rotation : int = 0;

signal output(from : Vector2i, to : Vector2i);
signal tile_updated(tile_coords : Vector2i, source_id : int, atlas_coords : Vector2i);



func _init(position : Vector2i, rotation : int) -> void:
	_position = position;
	_rotation = rotation;



func _placed() -> void:
	pass;



func _removed() -> void:
	tile_updated.emit(_position, -1, Vector2i(-1,-1));



func _clicked() -> void:
	pass;



func _tick_input(input : Array[Vector2i]) -> void:
	pass;



func _tick_process() -> void:
	pass;



func _tick_output() -> void:
	pass;



func get_position() -> Vector2i:
	return _position;


func get_forward() -> Vector2i:
	match _rotation:
		0: return Vector2i.UP;
		1: return Vector2i.RIGHT;
		2: return Vector2i.DOWN;
		3: return Vector2i.LEFT;
	return Vector2i.UP;
