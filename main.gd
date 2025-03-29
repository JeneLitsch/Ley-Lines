extends Node2D;

const CompConduit = preload("res://components/conduit.gd");
const CompSource = preload("res://components/source.gd");
const CompSink = preload("res://components/sink.gd");
const CompSplitter = preload("res://components/splitter.gd");
const CompLogicAnd = preload("res://components/logic_and.gd");
const CompLogicOr = preload("res://components/logic_or.gd");


var _edit_mode : bool = false;
var _selected_component : Script = null;
var _place_rotation : int = 0;
var _place_position : Vector2i = Vector2i.ZERO;
var _time_accumulator : float = 0;
var _simulation_speed = 1.0;



func _update_cursor():
	%Cursor.clear();
	%Cursor.set_cell(_place_position, 0, Vector2i(0, _place_rotation), 0);



func _physics_process(delta: float) -> void:
	_time_accumulator += delta * 16.0 * _simulation_speed;
	while _time_accumulator >= 1.0:
		_time_accumulator -= 1.0;
		%Circuit.tick();



func _process(delta: float) -> void:
	%Selector.visible = Input.is_action_pressed("open_selector");



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		_place_position = coords;
		_update_cursor();
		
	if event.is_action_pressed("primary_click"):
		if _selected_component and not %Selector.visible:
			%Circuit.place_component(_selected_component.new(_place_position, _place_rotation));
		else:
			%Circuit.click_at(_place_position);
			
	if event.is_action_pressed("secondary_click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		%Circuit.remove_component_at(coords);
	
	if event.is_action_pressed("rotate_l"):
		_place_rotation = (_place_rotation + 3) % 4;
		_update_cursor();
	
	if event.is_action_pressed("rotate_r"):
		_place_rotation = (_place_rotation + 1) % 4;
		_update_cursor();


func _on_component_selected(component: Script) -> void:
	_selected_component = component


func _on_selector_simulation_speed_changed(speed: float) -> void:
	_simulation_speed = speed;
