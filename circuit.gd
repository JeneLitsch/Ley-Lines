extends Node2D

var _components: Array[Component] = [];
var _ouputs: Dictionary[Vector2i, Array] = {};

const CompConduit = preload("res://components/conduit.gd");
const CompInput = preload("res://components/input.gd");
const CompOutput = preload("res://components/output.gd");





func _ready() -> void:
	_add_component(CompInput.new(Vector2i(0,0)));
	_add_component(CompConduit.new(Vector2i(1,0)));
	_add_component(CompConduit.new(Vector2i(2,0)));
	_add_component(CompConduit.new(Vector2i(3,0)));
	_add_component(CompConduit.new(Vector2i(4,0)));
	_add_component(CompOutput.new(Vector2i(5,0)));

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Circuit.local_to_map(mouse_position);
		print(coords);
		for c in _components:
			if c.get_position() == coords:
				c._clicked();


func _add_component(component : Component):
	_components.push_back(component);
	component.output.connect(_on_component_output);
	component.tile_updated.connect(_on_component_tile_updated);
	component._placed();



func _on_component_output(from : Vector2i, to : Vector2i):
	var default : Array[Vector2i] = [];
	_ouputs.get_or_add(to, default).push_back(from);



func _on_component_tile_updated(tile_coords : Vector2i, atlas_coords : Vector2i):
	%Circuit.set_cell(tile_coords, 0, atlas_coords, 0);



func _tick() -> void:
	print("TICK");
	print(_ouputs);
	
	
	var _input = _ouputs;
	for c in _components:
		var default : Array[Vector2i] = [];
		var input = _input.get(c.get_position(), default);
		c._tick_input(input);
	
	for c in _components:
		c._tick_process();
		
	_ouputs = {};
	for c in _components:
		c._tick_output();
