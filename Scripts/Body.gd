extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

var speed = 0
const MAXSPEED = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	pass

func follow_player():
	position = get_node("/root/Game").snake_parts.pop_front()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
