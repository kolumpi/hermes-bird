extends TextureRect

@export var scroll_speed: Vector2 = Vector2(-50, 0)  # Pixel/Sek

func _process(delta):
	position += scroll_speed * delta

	if position.x <= -texture.get_width():
		position.x += texture.get_width()
