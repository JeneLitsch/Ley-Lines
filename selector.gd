extends CanvasLayer

const Comp = preload("res://components/components.gd");



signal component_selected(component : Script);
signal simulation_speed_changed(speed : float);
signal save_requested();
signal open_requested();


func _ready() -> void:
	_on_slider_value_changed(%SimulationSpeed/Slider.value)
	


func _on_interact_pressed() -> void:
	component_selected.emit(null);


func _on_conduit_pressed() -> void:
	component_selected.emit(Comp.Conduit);


func _on_source_pressed() -> void:
	component_selected.emit(Comp.Source);


func _on_sink_pressed() -> void:
	component_selected.emit(Comp.Sink);


func _on_splitter_pressed() -> void:
	component_selected.emit(Comp.Splitter);


func _on_and_pressed() -> void:
	component_selected.emit(Comp.LogicAnd);


func _on_or_pressed() -> void:
	component_selected.emit(Comp.LogicOr);


func _on_xor_pressed() -> void:
	component_selected.emit(Comp.LogicXor);


func _on_not_pressed() -> void:
	component_selected.emit(Comp.LogicNot);


func _on_sequencer_pressed() -> void:
	component_selected.emit(Comp.Sequencer);


func _on_cross_pressed() -> void:
	component_selected.emit(Comp.Cross);


func _on_slider_value_changed(value: float) -> void:
	var speed = pow(2, value);
	%SimulationSpeed/Value.text = "%sx" % speed;
	simulation_speed_changed.emit(speed);


func _on_save_pressed() -> void:
	save_requested.emit();


func _on_open_pressed() -> void:
	open_requested.emit();
