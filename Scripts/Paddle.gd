extends KinematicBody2D

const ball_scene = preload("res://Mini Scenes/Ball.tscn")
var ball : RigidBody2D

var game_over = false setget set_game_over

func set_game_over(value):
	game_over = value

func _ready():
	set_physics_process(true)
	set_process_input(true)
	pass

func _physics_process(_delta):
	var y = position.y
	var mouse_x = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x, y)

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if !is_instance_valid(ball):
			ball = ball_scene.instance()
			ball.set_position(get_position() - Vector2(0,16))
			get_tree().get_root().add_child(ball)
			
			if game_over:
				get_node('/root/World').new_game = true
