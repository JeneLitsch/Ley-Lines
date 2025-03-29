extends Node2D

var _components: Array[Component] = [];
var _coord_to_components: Dictionary[Vector2i, Component] = {};
var _ouputs: Dictionary[Vector2i, Array] = {};



func click_at(coords : Vector2i) -> void:
	print(coords);
	for c in _components:
		if c.get_position() == coords:
			c._clicked();



func place_component(component : Component):
	if has_component_at(component.get_position()):
		remove_component_at(component.get_position());

	_components.push_back(component);
	component.output.connect(_on_component_output);
	component.tile_updated.connect(_on_component_tile_updated);
	component._placed();
	_coord_to_components[component.get_position()] = component;



func remove_component_at(coord : Vector2i):
	if _coord_to_components.has(coord):
		var component = _coord_to_components[coord];
		component._removed();
		_components.erase(component);
		_coord_to_components.erase(coord);
	


func has_component_at(coord : Vector2i):
	return _coord_to_components.has(coord);



func _on_component_output(from : Vector2i, to : Vector2i):
	var default : Array[Vector2i] = [];
	_ouputs.get_or_add(to, default).push_back(from);



func _on_component_tile_updated(tile_coords : Vector2i, source_id : int, atlas_coords : Vector2i):
	%Tiles.set_cell(tile_coords, source_id, atlas_coords, 0);



func _tick() -> void:
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
