extends "res://ui/menus/run/difficulty_selection/difficulty_selection.gd"

const SOULSTONE_SELECTION_SCN_PATH = "res://mods-unpacked/SteveImm-SoulStone/extensions/ui/menus/run/difficulty_selection/soulstone_selection.tscn"

var _soulstone_selection = preload(SOULSTONE_SELECTION_SCN_PATH).instance()

onready var _vbox_container = $MarginContainer / VBoxContainer

func _ready():
	_vbox_container.add_child(_soulstone_selection)
