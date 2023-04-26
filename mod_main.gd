extends Node

const MYMODNAME_MOD_DIR = "SteveImm-SoulStone/"
const MYMODNAME_LOG = "SteveImm-SoulStone"

# Declare member variables here. Examples:
var dir = ""
var ext_dir = ""
var trans_dir = ""


# Called when the node enters the scene tree for the first time.
func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MYMODNAME_LOG)
	dir = modLoader.UNPACKED_DIR + MYMODNAME_MOD_DIR
	# ext_dir = dir + "extensions/"
	# trans_dir = dir + "translations/"

	# Add extensions
	# modLoader.install_script_extension(ext_dir + "main.gd")

	# Add translations
	# modLoader.add_translation_from_resource(trans_dir + "modname_text.en.translation")

func _ready():
	ModLoaderUtils.log_info("Done", MYMODNAME_LOG)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
