extends Window

func _on_continue_pressed() -> void:
	Cuntrul.OnurbsPaused = false
	hide()

func _on_settings_pressed() -> void:
	var Settingz = get_tree().current_scene.get_node("Settings")
	Settingz.show()

func _on_export_level_pressed() -> void:
	Cuntrul.ExportLevel()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_clear_level_pressed() -> void:
	Cuntrul.OnurbsPaused = false
	Cuntrul.FollowNode = false
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/level.tscn")

func _on_load_level_pressed() -> void:
	if FileAccess.file_exists("user://Level.tscn") and OS.get_name() != "Android":
		get_tree().call_deferred("change_scene_to_file", "user://Level.tscn")
	elif OS.get_name() == "Android" and FileAccess.file_exists(Cuntrul.AndroidPath + "Level.tscn"):
		get_tree().call_deferred("change_scene_to_file", Cuntrul.AndroidPath + "Level.tscn")
