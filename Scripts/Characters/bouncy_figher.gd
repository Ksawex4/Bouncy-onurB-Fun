extends CharacterBody2D

var speed = randf_range(Settings.Bouncy_onurB["MinSpeed"], Settings.Bouncy_onurB["MaxSpeed"]) * 60
var jumpHeight = randi_range(Settings.Bouncy_onurB["MinJumpHeight"], Settings.Bouncy_onurB["MaxJumpHeight"])
var gravity = randf_range(Settings.Bouncy_onurB["MinGravity"], Settings.Bouncy_onurB["MaxGravity"]) * 60
var direction = [-1, 1].pick_random()
var wallDelay = 0.0
var HP = 25

func _ready() -> void:
	$Name.text = Cuntrul.Names.pick_random()

func _physics_process(delta: float) -> void:
	
	if !is_on_floor() && !Cuntrul.OnurbsPaused:
		velocity.y += gravity * delta
	if is_on_floor() or is_on_wall():
		velocity.y = -jumpHeight
	velocity.x = speed * delta * direction
	
	if wallDelay > 0.0:
		wallDelay -= 0.1
	
	if is_on_wall() and wallDelay <= 0.0:
		wallDelay = 0.5
		direction = direction * -1
	
	if !Cuntrul.OnurbsPaused:
		move_and_slide()

func _on_hit_area_body_entered(body: Node2D) -> void:
	die()

func die():
	print("died")
	$Death.play()
	set_collision_mask_value(1, false)
	gravity = 0.0
	set_collision_layer_value(1, false)
	$WinArea.set_collision_mask_value(3, false)

func hurt(damage):
	$Sprite2D.modulate = Color(1,0,0,1)
	HP -= damage
	AmIDead()
	await get_tree().create_timer(0.4).timeout
	$Sprite2D.modulate = Color(1,1,1,1)

func AmIDead():
	print(HP)
	if HP <= 0:
		die()

func _on_death_finished() -> void:
	queue_free()

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body != self && randi_range(1,4) == 1:
		print("attack")
		body.hurt(1)
		$Attack.play()
		$Sprite2D.modulate = Color(0,1,0,1)
		await get_tree().create_timer(0.4).timeout
		$Sprite2D.modulate = Color(1,1,1,1)
