extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.score > Global.highScore:
		Global.highScore = Global.score
		
	$HighscoreLabel.text = "Highscore: " + str(Global.highScore)
	$ScoreLabel.text = "Your Score: " + str(Global.score)

func on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
