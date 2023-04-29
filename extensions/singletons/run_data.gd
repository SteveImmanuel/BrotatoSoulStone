extends "res://singletons/run_data.gd"

func init_effects() -> Dictionary:
	var result:Dictionary = .init_effects()
	result['soulstone'] = 0
	return result
