extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var game = get_node("/root/Game")
var body = preload("res://Mini Scenes/Body.tscn")
onready var head = get_node("/root/Game/Snake/Head")
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
			add_body()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func add_body():
	var instanced_body = body.instance()
	var index = game.snake_parts.size()
	if index == 0:
		instanced_body.position = head.position
	else:
		instanced_body.position = game.snake_parts[index-1].position
	get_node("/root/Game/Snake/Bodies").add_child(instanced_body)
#func _process(delta):
#	pass
