extends CharacterBody2D

var acceleration = 20
var lastJump = 0
var jumpCooldown = 600

@export var throwableBoxScene: PackedScene

func _ready():
	Global.alive = true
	startGame()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		var obstacle = throwableBoxScene.instantiate()
		obstacle.position = Vector2(100, 100)
		add_child(obstacle)

func _physics_process(_delta: float):
	if Global.alive:
		movement()

func movement():

	if Input.is_action_just_pressed("Jump"):
		if Time.get_ticks_msec() > lastJump + jumpCooldown:    
			velocity.y = -600 - (velocity.y * 0.3       )
			
			
			lastJump = Time.get_ticks_msec()
	
	if velocity.y < 1000: # Gravitation
		velocity.y = velocity.y + acceleration
		
		
	move_and_slide()
	
	
	for i in get_slide_collision_count():
		var col = get_slide_collision(i).get_collider()

		if col.is_in_group("deadly"):
			die()

		#if col.is_in_group("coins"):
		#	col.collect()  # oder queue_free()
		
 

func die():
	Global.alive = false
	
	var tree = get_tree()
		
	if tree != null:
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
	else:
		printerr("Error while loading deathscreen.")
	
	
func startGame():
	Global.alive = true
	Global.score = 0
	position.x = 0
	position.y = 0
	velocity.x = 0
	velocity.y = 0
	
func increaseScore():
	if Global.alive:
		Global.score = Global.score + 1
