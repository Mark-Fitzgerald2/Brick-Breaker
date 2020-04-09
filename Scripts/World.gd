extends Node2D

var score = 0 setget set_score

var game_over = false setget set_game_over
var game_over_instance : Label
const game_over_scene = preload("res://Mini Scenes/Game Over.tscn")

var new_game = false setget set_new_game
var level_complete = false setget set_level_complete

func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(score))
	
func set_level_complete(value):
	level_complete = value
	if level_complete:
		get_tree().change_scene("res://Scenes/LevelTwo.tscn")

func set_game_over(value):
	game_over = value
	if game_over:
		game_over_instance = game_over_scene.instance()
		game_over_instance.set_position(Vector2(130,150))
		get_tree().get_root().add_child(game_over_instance)
		get_node("/root/World/Paddle").game_over = game_over
		
func set_new_game(value):
	new_game = value 
	if new_game:
		game_over_instance.queue_free()
		get_tree().change_scene("res://Scenes/LevelOne.tscn")
