extends Window

func _on_collision_pressed() -> void:
	Settings.Collision = not Settings.Collision
	$Collision.text = "Collision: %s" % Settings.Collision
	Settings.emit_signal("UpdateCollision")

func _on_close_requested() -> void:
	hide()

func ChangeValue(what: String, toWhat: float):
	Settings.Bouncy_onurB[what] = toWhat

func _on_min_speed_text_submitted(new_text: String) -> void:
	ChangeValue("MinSpeed", float(new_text))
	$MinSpeed.placeholder_text = "MinSpeed: %s" % Settings.Bouncy_onurB["MinSpeed"]
	$MinSpeed.text = ""

func _on_max_speed_text_submitted(new_text: String) -> void:
	ChangeValue("MaxSpeed", float(new_text))
	$MaxSpeed.placeholder_text = "MaxSpeed: %s" % Settings.Bouncy_onurB["MaxSpeed"]
	$MaxSpeed.text = ""

func _on_min_jump_height_text_submitted(new_text: String) -> void:
	ChangeValue("MinJumpHeight", float(new_text))
	$MinJumpHeight.placeholder_text = "MinJumpHeight: %s" % Settings.Bouncy_onurB["MinJumpHeight"]
	$MinJumpHeight.text = ""

func _on_max_jump_height_text_submitted(new_text: String) -> void:
	ChangeValue("MaxJumpHeight", float(new_text))
	$MaxJumpHeight.placeholder_text = "MaxJumpHeight: %s" % Settings.Bouncy_onurB["MaxJumpHeight"]
	$MaxJumpHeight.text = ""

func _on_min_gravity_text_submitted(new_text: String) -> void:
	ChangeValue("MinGravity", float(new_text))
	$MinGravity.placeholder_text = "MinGravity: %s" % Settings.Bouncy_onurB["MinGravity"]
	$MinGravity.text = ""

func _on_max_gravity_text_submitted(new_text: String) -> void:
	ChangeValue("MaxGravity", float(new_text))
	$MaxGravity.placeholder_text = "MaxGravity: %s" % Settings.Bouncy_onurB["MaxGravity"]
	$MaxGravity.text = ""

func _on_min_rgba_text_submitted(new_text: String) -> void:
	var args = new_text.split(" ")
	if args.size() >= 4:
		ChangeValue("MinR", float(args[0]))
		ChangeValue("MinG", float(args[1]))
		ChangeValue("MinB", float(args[2]))
		ChangeValue("MinA", float(args[3]))
		$MinRGBA.placeholder_text = "MinRGBA: %s %s %s %s" % [Settings.Bouncy_onurB["MinR"],Settings.Bouncy_onurB["MinG"],Settings.Bouncy_onurB["MinB"],Settings.Bouncy_onurB["MinA"]]
		$MinRGBA.text = ""

func _on_max_rgba_text_submitted(new_text: String) -> void:
	var args = new_text.split(" ")
	if args.size() >= 4:
		ChangeValue("MaxR", float(args[0]))
		ChangeValue("MaxG", float(args[1]))
		ChangeValue("MaxB", float(args[2]))
		ChangeValue("MaxA", float(args[3]))
		$MaxRGBA.placeholder_text = "MaxRGBA: %s %s %s %s" % [Settings.Bouncy_onurB["MaxR"],Settings.Bouncy_onurB["MaxG"],Settings.Bouncy_onurB["MaxB"],Settings.Bouncy_onurB["MaxA"]]
		$MaxRGBA.text = ""

func _on_min_max_jumps_text_submitted(new_text: String) -> void:
	ChangeValue("MinMaxJumps", float(new_text))
	$MinMaxJumps.placeholder_text = "MinMaxJumps: %s" % Settings.Bouncy_onurB["MinMaxJumps"]
	$MinMaxJumps.text = ""

func _on_max_max_jumps_text_submitted(new_text: String) -> void:
	ChangeValue("MaxMaxJumps", float(new_text))
	$MaxMaxJumps.placeholder_text = "MaxMaxJumps: %s" % Settings.Bouncy_onurB["MaxMaxJumps"]
	$MaxMaxJumps.text = ""
