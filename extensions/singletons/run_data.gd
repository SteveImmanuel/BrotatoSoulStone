extends "res://singletons/run_data.gd"

func get_revive_item() -> ItemData:
	# Guaranteed to find one soulstone item
	var revive_item: ItemData
	for item in items:
		if item.my_id == 'item_soulstone':
			revive_item = item
			break
			
	return revive_item
	
func init_effects() -> Dictionary:
	var result:Dictionary = .init_effects()
	result['soulstone'] = 0
	return result
