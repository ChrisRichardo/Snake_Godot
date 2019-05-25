extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)# Replace with function body.

func _physics_process(delta):
	var bodies = move_and_collide(Vector2(0,0))
	if bodies:
		var bodies_collide = bodies.collider
		if bodies_collide.is_in_group("Head"):
			queue_free()
			get_node("/root/Game").spawn_food()
			get_node("/root/Game").length += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
