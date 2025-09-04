extends Node2D

var posVector: Vector2

func _ready() -> void:
	if OS.get_name() != "Android":
		queue_free()

func _physics_process(_delta: float) -> void:
	Input.action_release("camRight")
	Input.action_release("camLeft")
	Input.action_release("camDown")
	Input.action_release("camUp")
	if posVector.x > 0.25:
		Input.action_press("camRight")
	elif posVector.x < -0.25:
		Input.action_press("camLeft")
	
	if posVector.y > 0.25:
		Input.action_press("camDown")
	elif posVector.y < -0.25:
		Input.action_press("camUp")
