extends CanvasLayer



const CompConduit = preload("res://components/conduit.gd");
const CompSource = preload("res://components/source.gd");
const CompSink = preload("res://components/sink.gd");
const CompSplitter = preload("res://components/splitter.gd");
const CompLogicAnd = preload("res://components/logic_and.gd");
const CompLogicOr = preload("res://components/logic_or.gd");
const CompLogicXor = preload("res://components/logic_xor.gd");
const CompLogicNot = preload("res://components/logic_not.gd");



signal component_selected(component : Script);



func _on_interact_pressed() -> void:
	component_selected.emit(null);


func _on_conduit_pressed() -> void:
	component_selected.emit(CompConduit);


func _on_source_pressed() -> void:
	component_selected.emit(CompSource);


func _on_sink_pressed() -> void:
	component_selected.emit(CompSink);


func _on_splitter_pressed() -> void:
	component_selected.emit(CompSplitter);


func _on_and_pressed() -> void:
	component_selected.emit(CompLogicAnd);


func _on_or_pressed() -> void:
	component_selected.emit(CompLogicOr);


func _on_xor_pressed() -> void:
	component_selected.emit(CompLogicXor);


func _on_not_pressed() -> void:
	component_selected.emit(CompLogicNot);
