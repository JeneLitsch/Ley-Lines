class_name Component;
extends RefCounted;

var _position : Vector2i = Vector2i.ZERO;

signal output(from : Vector2i, to : Vector2i);
signal tile_updated(tile_coords : Vector2i, tex_coords : Vector2i);

func _init(position : Vector2i) -> void:
	_position = position;

func _placed() -> void:
	pass;

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
