extends TextureRect

func _process(delta):
	position.x += -(Global.backgroundScrollSpeed) * delta

	if position.x <= -texture.get_width():
		position.x += texture.get_width()
