extends CharacterBody2D

var acceleration = 15
var jumpCooldown = 0

func _ready():
	startGame()

func _physics_process(_delta: float):
	movement()

func movement():

	if Input.is_action_just_pressed("ui_up"):
		if Time.get_ticks_msec() > jumpCooldown:
			velocity.y = -800
			
			jumpCooldown = Time.get_ticks_msec() + 600
	
	if velocity.y < 1000:
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
	startGame()
	
func startGame():
	position.x = 0
	position.y = 0
	velocity.x = 0
	velocity.y = 0
	
