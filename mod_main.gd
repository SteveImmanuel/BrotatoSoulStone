extends Node

const MOD_DIR = "SteveImm-SoulStone/"
const MOD_LOG = "SteveImm-SoulStone"

var dir = ""
var ext_dir = ""
var trans_dir = ""


func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	# trans_dir = dir + "translations/"

	# Add extensions
	modLoader.install_script_extension(ext_dir + "main.gd")

	# Add translations
	# modLoader.add_translation_from_resource(trans_dir + "modname_text.en.translation")

func _ready():
	ModLoaderUtils.log_info("Done", MOD_LOG)
	
