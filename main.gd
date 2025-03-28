extends Node2D;

const CompConduit = preload("res://components/conduit.gd");
const CompInput = preload("res://components/input.gd");
const CompOutput = preload("res://components/output.gd");


var _edit_mode : bool = false;
var _selected_component = CompConduit;


func _ready() -> void:
	%Circuit.place_component(CompInput.new(Vector2i(0,0)));
	%Circuit.place_component(CompConduit.new(Vector2i(1,0)));
	%Circuit.place_component(CompConduit.new(Vector2i(2,0)));
	%Circuit.place_component(CompConduit.new(Vector2i(3,0)));
	%Circuit.place_component(CompConduit.new(Vector2i(4,0)));
	%Circuit.place_component(CompOutput.new(Vector2i(5,0)));



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("primary_click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		if _edit_mode:
			%Circuit.place_component(_selected_component.new(coords));
		else:
			%Circuit.click_at(coords);
	if event.is_action_pressed("secondary_click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		%Circuit.remove_component_at(coords);
		
	if event.is_action_pressed("change_mode"):
		_toggle_edit_mode();
	
	if event.is_action_pressed("debug_1"):
		_selected_component = CompConduit;
		print(_selected_component);
	
	if event.is_action_pressed("debug_2"):
		_selected_component = CompInput;
	
	if event.is_action_pressed("debug_3"):
		_selected_component = CompOutput;



func _toggle_edit_mode():
	_edit_mode = !_edit_mode;
	if _edit_mode:
		print("Edit mode activated");
	else:
		print("Edit mode deactivated");
