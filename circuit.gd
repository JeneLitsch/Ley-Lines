class_name Circuit;
extends Node2D

const Comp = preload("res://components/components.gd")

var _components: Array[Component] = [];
var _coord_to_components: Dictionary[Vector2i, Component] = {};
var _ouputs: Dictionary[Vector2i, Array] = {};



func click_at(coords : Vector2i) -> void:
	print(coords);
	for c in _components:
		if c.get_position() == coords:
			c.clicked();



func place_component(component : Component):
	if has_component_at(component.get_position()):
		remove_component_at(component.get_position());

	_components.push_back(component);
	component.output.connect(_on_component_output);
	component.tile_updated.connect(_on_component_tile_updated);
	component.placed();
	_coord_to_components[component.get_position()] = component;



func remove_component_at(coord : Vector2i):
	if _coord_to_components.has(coord):
		var component = _coord_to_components[coord];
		component.removed();
		_components.erase(component);
		_coord_to_components.erase(coord);
	


func has_component_at(coord : Vector2i):
	return _coord_to_components.has(coord);



func _on_component_output(from : Vector2i, to : Vector2i):
	var default : Array[Vector2i] = [];
	_ouputs.get_or_add(to, default).push_back(from - to);



func _on_component_tile_updated(tile_coords : Vector2i, source_id : int, atlas_coords : Vector2i):
	%Tiles.set_cell(tile_coords, source_id, atlas_coords, 0);



func tick() -> void:
	var _input = _ouputs;
	_ouputs = {};
	for c in _components:
		var default : Array[Vector2i] = [];
		var input = _input.get(c.get_position(), default);
		c.tick(input);



static func load(data : Variant) -> Circuit:
	var circuit = preload("res://circuit.tscn").instantiate();
	for cd in data.components:
		var comp_type = Comp.name_to_type[cd.type];
		var comp : Component = comp_type.new(Vector2i(cd.position.x, cd.position.y), cd.rotation);
		circuit.place_component(comp);
		comp.post_load_state(cd.state);
	for td in data.transfers:
		var to = Vector2i(td.to.x, td.to.y);
		var directions : Array[Vector2i] = []
		for dd in td.directions:
			var dir = Vector2i(dd.x, dd.y);
			directions.push_back(dir);  
		circuit._ouputs[to] = directions;
	return circuit;


func save() -> Dictionary:
	var components_data = [];
	for component in _components:
		components_data.push_back(component.save());
	var transfers_data = [];
	for to in _ouputs.keys():
		var elem = {
			to = {
				x = to.x,
				y = to.y,
			},
			directions = []
		};
		for direction in _ouputs.keys():
			elem.directions.push_back({
				x = direction.x,
				y = direction.y,
			});
		transfers_data.push_back(elem);
	return {
		components = components_data,
		transfers = transfers_data,
	}
