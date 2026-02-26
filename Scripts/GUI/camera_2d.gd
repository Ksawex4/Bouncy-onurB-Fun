extends Camera2D

@onready var joystick = $CanvasLayer/MobileControls/Joystick

func _ready() -> void:
	if OS.get_name() == "Android":
		$CanvasLayer/Label.text = "ESC - quit game
B - spawn Bouncy onurB at the small black cursor in the middle of your screen
DEL - delete all bouncy onurbs
Joystick - move camera (press the joystick first before other buttons, dont know how to fix it currently)
- Button - move camera out
+ Button - move camera in
A - place a block
R - remove a block
Shift - move/zoom camera faster and spawn onurbs faster
F1 - hide/show this label
I - open the selection menu"

func _physics_process(delta: float) -> void:
	var axis = Vector2(Input.get_axis("camLeft", "camRight"), Input.get_axis("camUp", "camDown"))
	if OS.get_name() == "Android":
		axis = joystick.posVector
	var run = 5
	if Input.is_action_pressed("shift"):
		run = 1
	if !Cuntrul.FollowNode:
		position.x += 100 * axis.x * delta * run
		position.y += 100 * axis.y * delta * run
	elif Cuntrul.node != null:
		position = Cuntrul.node.position
	
	if OS.get_name() != "Android":
		Cuntrul.UpdateMousePos(get_global_mouse_position())
	else:
		Cuntrul.UpdateMousePos(global_position)
	
	if Input.is_action_just_pressed("labelToggle"):
		$CanvasLayer/Label.visible = not $CanvasLayer/Label.visible
	
	if Input.is_action_pressed("camOut"):
		var bob = 0.05
		if Input.is_action_pressed("shift"):
			bob = 0.1
		zoom += Vector2(bob, bob)
	
	if Input.is_action_pressed("camIn"):
		var bob = 0.05
		if Input.is_action_pressed("shift"):
			bob = 0.1
		if zoom > Vector2(0.1, 0.1):
			zoom -= Vector2(bob, bob)
