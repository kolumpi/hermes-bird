extends TextureRect

@export var scroll_speed: Vector2 = Vector2(-50, 0)  # Pixel pro Sekunde

func _process(delta):
	position += scroll_speed * delta

	# Optional: Reset, wenn es zu weit verschoben ist
	if position.x <= -texture.get_width():
		position.x += texture.get_width()
