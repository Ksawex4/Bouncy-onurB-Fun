extends Window

func _on_block_pressed() -> void:
	Cuntrul.SelectedBlock = Vector2i(1,0)

func _on_kill_block_pressed() -> void:
	Cuntrul.SelectedBlock = Vector2i(0,1)

func _on_close_requested() -> void:
	hide()

func _on_win_block_pressed() -> void:
	Cuntrul.SelectedBlock = Vector2i(1,1)

func _on_bouncy_fighter_pressed() -> void:
	Cuntrul.SelectedBounce = "BouncyFighter"

func _on_bouncy_onur_b_pressed() -> void:
	Cuntrul.SelectedBounce = "Bouncy_onurB"

func _on_one_way_pressed() -> void:
	Cuntrul.SelectedBlock = "OneWay"

func _on_remove_all_one_ways_pressed() -> void:
	for child in get_tree().get_nodes_in_group("OneWays"):
		child.queue_free()
