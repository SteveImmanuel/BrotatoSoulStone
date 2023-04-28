extends Node

const MOD_DIR = "SteveImm-SoulStone/"
const MOD_LOG = "SteveImm-SoulStone"

var dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	var ext_dir = dir + "extensions/"
	var trans_dir = dir + "translations/"

	# Add extensions
	modLoader.install_script_extension(ext_dir + "main.gd")
	modLoader.install_script_extension(ext_dir + "singletons/run_data.gd")

	# Add translations
	modLoader.add_translation_from_resource(trans_dir + "soulstone_text.en.translation")

func _ready():
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	var content_dir = dir + "content_data/"
	
	ContentLoader.load_data(content_dir + "soulstone_items.tres", MOD_LOG)
	ModLoaderUtils.log_info("Done", MOD_LOG)
	
