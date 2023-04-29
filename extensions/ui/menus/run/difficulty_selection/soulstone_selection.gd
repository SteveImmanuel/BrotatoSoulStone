class_name SoulstoneSelection
extends Control

const SOULSTONE_DATA_PATH = "res://mods-unpacked/SteveImm-SoulStone/content/items/soulstone/soulstone_data.tres"

var _nb_soulstone:int = 0
var _soulstone_item:Resource

onready var _counter_label:Label = $HBoxContainer / CounterLabel

func _ready():
	_soulstone_item = load(SOULSTONE_DATA_PATH)
	_counter_label.text = str(_nb_soulstone)
	

func _on_DecrementCounterButton_pressed():
	if _nb_soulstone > 0:
		_nb_soulstone -= 1
		RunData.remove_item(_soulstone_item)
	_counter_label.text = str(_nb_soulstone)
	

func _on_IncrementCounterButton_pressed():
	_nb_soulstone += 1
	RunData.add_item(_soulstone_item)
	_counter_label.text = str(_nb_soulstone)
	
	
	
