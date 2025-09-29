extends CharacterBody2D

const SPEED = 130.0
const CROUCH_SPEED = 60.0   # eğilme sırasında yavaş hız
const JUMP_VELOCITY = -350.0
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump
@onready var animated_sprite = $AnimatedSprite2D

 
func _physics_process(delta: float) -> void:
	# Yerçekimi
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Zıplama
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play() 

	var direction := Input.get_axis("move_left", "move_right")

	# Sprite flip
	if direction > 0:
		animated_sprite.flip_h = true	
	elif direction < 0:
		animated_sprite.flip_h = false
	
	# Animasyonlar
	if is_on_floor():
		if Input.is_action_pressed("crouch"):
			animated_sprite.play("crouch")
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	# Hareket
	var speed = SPEED
	if Input.is_action_pressed("crouch"):
		speed = CROUCH_SPEED  # eğilirken daha yavaş hareket etsin
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
