extends ParallaxBackground

@export var map_size: Vector2 = Vector2(1920, 1080) # Harita boyutu
@export var zoom_factor: float = 0.8 # 1.0 = normal, 0.8 = biraz uzaklaştır

func _ready():
	resize_to_map()
	get_viewport().connect("size_changed", Callable(self, "resize_to_map"))

func resize_to_map():
	var screen_size = get_viewport().get_visible_rect().size

	for layer in get_children():
		if layer is ParallaxLayer:
			for sprite in layer.get_children():
				if sprite is Sprite2D and sprite.texture:
					var tex_size = sprite.texture.get_size()
					if tex_size.x == 0 or tex_size.y == 0:
						continue

					# Sprite'ı ekran boyutuna göre ölçekle ve zoom factor uygula
					var scale_x = (screen_size.x / tex_size.x) * zoom_factor
					var scale_y = (screen_size.y / tex_size.y) * zoom_factor
					sprite.scale = Vector2(scale_x, scale_y)

					# Sol üstten hizala yerine alt kısmı ekrana dayayalım
					sprite.centered = false
					sprite.position = Vector2(0, screen_size.y - tex_size.y * scale_y)
