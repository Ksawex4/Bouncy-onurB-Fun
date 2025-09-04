extends Sprite2D

func _ready() -> void:
	if OS.get_name() != "Android":
		hide()
