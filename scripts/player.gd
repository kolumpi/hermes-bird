extends CharacterBody2D

var acceleration = 20
var lastJump = 0
var jumpCooldown = 600

var gameRunning = true

func _ready():
	startGame()

func _physics_process(_delta: float):
	if gameRunning:
		movement()

func movement():

	if Input.is_action_just_pressed("ui_accept"):
		if Time.get_ticks_msec() > lastJump + jumpCooldown:    
			velocity.y = -800
			
			lastJump = Time.get_ticks_msec()
	
	if velocity.y < 1000: # Gravitation
		velocity.y = velocity.y + acceleration
		
		
	move_and_slide()
	
	#for i in range(get_slide_collision_count()):
	#	var collision = get_slide_collision(i)
	#	var collider = collision.get_collider()
	#	if collider != null:
	#		print("Kollision mit:", collider.name)
	#		startGame()
	
	if get_slide_collision_count() > 0:
		die()
 

func die():
	gameRunning = false
	startGame()
	
func startGame():
	gameRunning = true
	position.x = 0
	position.y = 0
	velocity.x = 0
	velocity.y = 0.01
	
	
