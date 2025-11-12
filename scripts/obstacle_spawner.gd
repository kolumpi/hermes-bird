extends Node2D

@export var obstacle_scene: PackedScene
var spawn_interval: float = 3
var spawn_x: float = 2100   # X-Position (rechts außerhalb des Screens)
var min_y: float = 0
var max_y: float = 1080

var timer: float = 0.0     

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_obstacle()

func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position = Vector2(spawn_x, randf_range(min_y, max_y))
	add_child(obstacle)
