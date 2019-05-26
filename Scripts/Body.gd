extends KinematicBody2D

onready var game = get_node("/root/Game")
onready var head = get_node("/root/Game/Snake/Head")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var temp_add = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true) # Replace with function body.

func move_body(index : int):
	if index == 0:
		
#		if head.prev_dir == Vector2(0,-1):
#			temp_add = Vector2(0,16)
#		elif head.prev_dir == Vector2(0,1):
#			temp_add = Vector2(0,-16)
#		elif head.prev_dir == Vector2(1,0):
#			temp_add = Vector2(-16,0)
#		elif head.prev_dir == Vector2(1,0):
#			temp_add = Vector2(16,0)
			
		position = game.body_pos[index] 
		game.body_pos[index] = head.position 
		game.body_dir[index] = head.prev_dir 
	else:
#		if game.body_dir[index] == Vector2(0,-1):
#			temp_add = Vector2(0,16)
#		elif game.body_dir[index]== Vector2(0,1):
#			temp_add = Vector2(0,-16)
#		elif game.body_dir[index] == Vector2(1,0):
#			temp_add = Vector2(-16,0)
#		elif game.body_dir[index] == Vector2(1,0):
#			temp_add = Vector2(16,0)
		position = game.body_pos[index] 
		game.body_pos[index] = game.body_pos[index-1] 
		game.body_dir[index] = game.body_dir[index-1]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
