extends Label

func _process(_delta: float) -> void:
	text = "Speed: %s" % Engine.time_scale
