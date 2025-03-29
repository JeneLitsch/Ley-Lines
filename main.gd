extends Node2D;

const CompConduit = preload("res://components/conduit.gd");
const CompSource = preload("res://components/source.gd");
const CompSink = preload("res://components/sink.gd");
const CompSplitter = preload("res://components/splitter.gd");
const CompLogicAnd = preload("res://components/logic_and.gd");
const CompLogicOr = preload("res://components/logic_or.gd");


var _edit_mode : bool = false;
var _selected_component = CompConduit;
var _place_rotation : int = 0;
var _place_position : Vector2i = Vector2i.ZERO;


func _ready() -> void:
	%Circuit.place_component(CompSource.new(Vector2i(0,0), 1));
	%Circuit.place_component(CompConduit.new(Vector2i(1,0), 1));
	%Circuit.place_component(CompConduit.new(Vector2i(2,0), 1));
	%Circuit.place_component(CompConduit.new(Vector2i(3,0), 1));
	%Circuit.place_component(CompConduit.new(Vector2i(4,0), 1));
	%Circuit.place_component(CompSink.new(Vector2i(5,0), 1));



func _update_cursor():
	%Cursor.clear();
	%Cursor.set_cell(_place_position, 0, Vector2i(0, _place_rotation), 0);



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		print(coords);
		_place_position = coords;
		_update_cursor();
	if event.is_action_pressed("primary_click"):
		if _edit_mode:
			%Circuit.place_component(_selected_component.new(_place_position, _place_rotation));
		else:
			%Circuit.click_at(_place_position);
	if event.is_action_pressed("secondary_click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		%Circuit.remove_component_at(coords);
		
	if event.is_action_pressed("change_mode"):
		_toggle_edit_mode();
	
	if event.is_action_pressed("rotate_l"):
		_place_rotation = (_place_rotation + 3) % 4;
		_update_cursor();
	
	if event.is_action_pressed("rotate_r"):
		_place_rotation = (_place_rotation + 1) % 4;
		_update_cursor();
	
	if event.is_action_pressed("debug_1"):
		_selected_component = CompConduit;
		print(_selected_component);
	
	if event.is_action_pressed("debug_2"):
		_selected_component = CompSource;
	
	if event.is_action_pressed("debug_3"):
		_selected_component = CompSink;

	if event.is_action_pressed("debug_4"):
		_selected_component = CompSplitter;

	if event.is_action_pressed("debug_5"):
		_selected_component = CompLogicAnd;
		
	if event.is_action_pressed("debug_6"):
		_selected_component = CompLogicOr;




func _toggle_edit_mode():
	_edit_mode = !_edit_mode;
	if _edit_mode:
		print("Edit mode activated");
	else:
		print("Edit mode deactivated");
