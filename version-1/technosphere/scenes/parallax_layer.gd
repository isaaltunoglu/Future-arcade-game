extends ParallaxLayer

@export var map_size: Vector2 = Vector2(1920, 1080) # <-- Haritanın boyutunu buradan ayarla

func _ready():
	resize_to_map()
	get_viewport().connect("size_changed", Callable(self, "resize_to_map"))

func resize_to_map():
	var screen_size = get_viewport().get_visible_rect().size

	for child in get_children():
		if child is Sprite2D and child.texture:
			var tex_size = child.texture.get_size()
			if tex_size.x == 0 or tex_size.y == 0:
				continue

			# Sprite tüm map + ekran kenarlarını kaplayacak şekilde ölçeklenir
			var target_size = map_size + screen_size
			var scale_x = target_size.x / tex_size.x
			var scale_y = target_size.y / tex_size.y

			# Ölçeği uygula
			child.scale = Vector2(scale_x, scale_y)

			# Sol üstten hizala
			child.centered = false
			child.position = Vector2.ZERO
