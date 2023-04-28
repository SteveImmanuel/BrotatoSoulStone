extends "res://singletons/run_data.gd"

func get_revive_stats() -> Array:
	var revive_item:ItemData = null
	var revive_count: int = 0
	
	for item in items:
		if item.my_id == 'item_soulstone':
			revive_count += 1
			revive_item = item
	return [revive_count, revive_item]
	
