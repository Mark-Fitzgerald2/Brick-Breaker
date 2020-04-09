extends RigidBody2D

export var SPEEDUP = 20
const MAXSPEED = 600
var bodies

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += 5
			body.queue_free()
		
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized()*min(speed+SPEEDUP, MAXSPEED)
			set_linear_velocity(velocity)

	if get_position().y > get_viewport_rect().end.y:
		get_node('/root/World').game_over = true
		queue_free()
