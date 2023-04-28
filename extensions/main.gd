extends "res://main.gd"

const MOD_LOG = "SteveImm-SoulStone | main.gd"

var _is_reviving = false

func _ready():
	ModLoaderUtils.log_info("Ready", MOD_LOG)

func _on_player_died(_p_player) -> void:
	ModLoaderUtils.log_info("Player died", MOD_LOG)
	if RunData.effects['soulstone'] > 0:
		var revive_item = RunData.get_revive_item()
		_is_reviving = true
		_player_life_bar.hide()
		RunData.remove_item(revive_item)
		RunData.current_wave -= 1
		_wave_cleared_label.text = 'REVIVE'
		clean_up_room(false, false, false)
		_wave_timer.stop()
		_wave_timer.tick_timer.stop()
		_end_wave_timer.start()
		ModLoaderUtils.log_info("Reviving, remaining revive: %s" % RunData.effects['soulstone'], MOD_LOG)
	else:
		ModLoaderUtils.log_info("Revive unavailable, die for real", MOD_LOG)
		._on_player_died(_p_player)
		
func _on_EndWaveTimer_timeout()->void :
	DebugService.log_data("_on_EndWaveTimer_timeout")
	_end_wave_timer_timedout = true
	_ui_dim_screen.dim()
	_ui_consumables_to_process.modulate = Color.white
	_ui_upgrades_to_process.modulate = Color.white
	_wave_cleared_label.hide()
	_wave_timer_label.hide()
	
	if _landmine_timer:
		_landmine_timer.stop()
		
	if not _is_reviving and (_is_run_lost or is_last_wave() or _is_run_won):
		DebugService.log_data("end run...")
		RunData.run_won = not _is_run_lost
		print(RunData.is_testing)
		if RunData.is_testing:
			var _error = get_tree().change_scene(MenuData.editor_scene)
		else :
			var _error = get_tree().change_scene("res://ui/menus/run/end_run.tscn")
	else :
		DebugService.log_data("process consumables and upgrades...")
		MusicManager.tween( - 8)
		if _consumables_to_process.size() > 0:
			for consumable in _consumables_to_process:
				var fixed_tier = - 1
				
				if consumable.my_id == "consumable_legendary_item_box":
					fixed_tier = Tier.LEGENDARY
				
				var item_data = ItemService.process_item_box(RunData.current_wave, consumable, fixed_tier)
				_item_box_ui.set_item_data(item_data)
				yield (_item_box_ui, "item_box_processed")
				_ui_consumables_to_process.remove_element(consumable)
		
		if _upgrades_to_process.size() > 0:
			for upgrade_to_process in _upgrades_to_process:
				_upgrades_ui.show_upgrade_options(upgrade_to_process)
				yield (_upgrades_ui, "upgrade_selected")
				_ui_upgrades_to_process.remove_element(upgrade_to_process)
		
		DebugService.log_data("display challenge ui...")
		if _is_chal_ui_displayed:
			yield (_challenge_completed_ui, "finished")
		
		var _error = get_tree().change_scene("res://ui/menus/shop/shop.tscn")
