extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var Animated_Sprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		Animated_Sprite2D.flip_h = false
	elif direction < 0:
		Animated_Sprite2D.flip_h = true
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor():
		if direction == 0:
			Animated_Sprite2D.play("idle")
		else:
			Animated_Sprite2D.play("run")
	else:
		Animated_Sprite2D.play("jump")

	move_and_slide()


func _on_coin_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
