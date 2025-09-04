extends CharacterBody2D

var speed = randf_range(Settings.Bouncy_onurB["MinSpeed"], Settings.Bouncy_onurB["MaxSpeed"]) * 60
var jumpHeight = randi_range(Settings.Bouncy_onurB["MinJumpHeight"], Settings.Bouncy_onurB["MaxJumpHeight"])
var gravity = randf_range(Settings.Bouncy_onurB["MinGravity"], Settings.Bouncy_onurB["MaxGravity"]) * 60
var direction = [-1, 1].pick_random()
var wallDelay = 0.0
var r = randf_range(Settings.Bouncy_onurB["MinR"], Settings.Bouncy_onurB["MaxR"])
var g = randf_range(Settings.Bouncy_onurB["MinG"], Settings.Bouncy_onurB["MaxG"])
var b = randf_range(Settings.Bouncy_onurB["MinB"], Settings.Bouncy_onurB["MaxB"])
var a = randf_range(Settings.Bouncy_onurB["MinA"], Settings.Bouncy_onurB["MaxA"])
var HP = 1
var maxJumps = randi_range(Settings.Bouncy_onurB["MinMaxJumps"], Settings.Bouncy_onurB["MaxMaxJumps"])
var jumps = 0

func _ready() -> void:
	$Sprite2D.modulate = Color(r,g,b, a)
	$Name.text = Cuntrul.Names.pick_random()
	Settings.connect("UpdateCollision", Callable(self, "_update_collision"))
	_update_collision()

func _physics_process(delta: float) -> void:
	if !is_on_floor() && !Cuntrul.OnurbsPaused:
		velocity.y += gravity * delta
	if is_on_floor() and maxJumps != 0 or is_on_wall() and jumps < maxJumps:
		if is_on_floor():
			jumps = 0
		velocity.y = -jumpHeight
		jumps += 1
	velocity.x = speed * delta * direction
	
	if wallDelay > 0.0:
		wallDelay -= 0.1
	
	if is_on_wall() and wallDelay <= 0.0:
		wallDelay = 0.5
		direction = direction * -1
	
	if !Cuntrul.OnurbsPaused:
		move_and_slide()

func _on_hit_area_body_entered(_body: Node2D) -> void:
	die()

func hurt(damage):
	$Sprite2D.modulate = Color(1,0,0,1)
	HP -= damage
	AmIDead()
	await get_tree().create_timer(0.4).timeout
	$Sprite2D.modulate = Color(r,g,b,a)

func AmIDead():
	print(HP)
	if HP <= 0:
		die()

func die():
	$Death.play()
	set_collision_mask_value(1, false)
	gravity = 0.0
	set_collision_layer_value(1, false)
	$WinArea.set_collision_mask_value(3, false)

func _update_collision():
	if Settings.Collision:
		set_collision_layer_value(1, true)
	else:
		set_collision_layer_value(1, false)

func _on_win_area_body_entered(_body: Node2D) -> void:
	Cuntrul.MoveCamTo(self)
	$Win.play()

func _on_death_finished() -> void:
	queue_free()
