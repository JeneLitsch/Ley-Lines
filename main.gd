extends Node2D;


var _edit_mode : bool = false;
var _selected_component : Script = null;
var _place_rotation : int = 0;
var _place_position : Vector2i = Vector2i.ZERO;
var _time_accumulator : float = 0.0;
var _simulation_speed = 1.0;
var _circuit : Circuit;


func _ready() -> void:
	_circuit = preload("res://circuit.tscn").instantiate();
	add_child(_circuit);


func _update_cursor():
	%Cursor.clear();
	%Cursor.set_cell(_place_position, 0, Vector2i(0, _place_rotation), 0);



func _physics_process(delta: float) -> void:
	_time_accumulator += delta * 16.0 * _simulation_speed;
	while _time_accumulator >= 1.0:
		_time_accumulator -= 1.0;
		_circuit.tick();



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
			_circuit.place_component(_selected_component.new(_place_position, _place_rotation));
		else:
			_circuit.click_at(_place_position);
			
	if event.is_action_pressed("secondary_click"):
		var mouse_position = get_global_mouse_position();
		var coords = %Grid.local_to_map(mouse_position);
		_circuit.remove_component_at(coords);
	
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


func _on_selector_open_requested() -> void:
	%OpenFileDialog.visible = true;



func _on_selector_save_requested() -> void:
	%SaveFileDialog.visible = true;



func _on_open_file_dialog_file_selected(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.READ);
	var data = JSON.parse_string(file.get_as_text(true));
	remove_child(_circuit);
	_circuit.queue_free();
	_circuit = Circuit.load(data);
	_time_accumulator = 1.0;
	add_child(_circuit);



func _on_save_file_dialog_file_selected(path: String) -> void:
	var data = _circuit.save();
	var file = FileAccess.open(path, FileAccess.WRITE);
	file.store_string(JSON.stringify(data, "\t"));
