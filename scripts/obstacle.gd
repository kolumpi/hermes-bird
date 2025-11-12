extends StaticBody2D

var move_speed: float = 150.0  # Pixel pro Sekunde

func _process(delta):
	position.x -= move_speed * delta

	# Wenn das Hindernis links raus ist, löschen 
	if position.x < -200:
		queue_free()
