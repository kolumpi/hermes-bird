extends StaticBody2D

var move_speed = Global.obstacleBaseSpeed * randf_range(0.9, 1.1)

func _process(delta):
	position.x -= move_speed * delta

	# Wenn das Hindernis links raus ist, löschen 
	if position.x < -200:
		queue_free()
		
	if Global.alive == false:
		queue_free()
