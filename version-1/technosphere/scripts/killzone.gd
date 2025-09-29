extends Area2D

@onready var timer: Timer = $Timer
@onready var sfx_death: AudioStreamPlayer2D = $sfx_death

func _on_body_entered(body: Node2D) -> void:
	print("Maalesef Öldün..")
	Engine.time_scale = 0.5
	sfx_death.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
