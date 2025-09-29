extends Node2D

const SPEED = 40                 # hareket hızı
const STEP_SIZE = 32             # 1 blok boyutu (TileMap ölçüsüne göre)
const RANGE = STEP_SIZE * 2      # sağa/sola 2 blok (64 px)

var start_pos: Vector2
var direction := 1                # 1 = sağa, -1 = sola

func _ready():
	start_pos = global_position

func _process(delta):
	# hareket et
	global_position.x += direction * SPEED * delta

	# sınırları kontrol et
	if global_position.x >= start_pos.x + RANGE:
		direction = -1
	elif global_position.x <= start_pos.x - RANGE:
		direction = 1
