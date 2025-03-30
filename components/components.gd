extends RefCounted;

const Conduit = preload("res://components/conduit.gd");
const Source = preload("res://components/source.gd");
const Sink = preload("res://components/sink.gd");
const Splitter = preload("res://components/splitter.gd");
const Sequencer = preload("res://components/sequencer.gd");
const LogicAnd = preload("res://components/logic/logic_and.gd");
const LogicOr = preload("res://components/logic/logic_or.gd");
const LogicXor = preload("res://components/logic/logic_xor.gd");
const LogicNot = preload("res://components/logic/logic_not.gd");

const name_to_type = {
	conduit   = Conduit,
	source    = Source,
	sink      = Sink,
	splitter  = Splitter,
	sequencer = Sequencer,
	logic_and = LogicAnd,
	logic_or  = LogicOr,
	logic_xor = LogicXor,
	logic_not = LogicNot,
};
