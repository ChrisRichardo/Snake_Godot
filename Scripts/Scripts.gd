extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 10.0
var tile_size = 32.0
const MAXSPEED = 300

var init_pos = Vector2()
var dir = Vector2()
var counter = 0.0

var moving = false

func _ready():
	init_pos = position
	set_process(true)

func _physics_process(delta):
	
	if not moving:
		set_dir()
	elif dir != Vector2():
		get_node("/root/Game").snake_parts.append(position)
		if(get_node("/root/Game").snake_parts.size() >= 5):
			get_node("/root/Game/Snake/Body").follow_player()
		move(delta)
	else:
		moving = false
	
func set_dir():
	dir = get_dir()
	
	if dir.x != 0 or dir.y != 0:
		moving = true
		init_pos = position
		
func get_dir():
	var x = 0
	var y = 0
	
	if dir.y == 0:
		x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if dir.x == 0:
		y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
		
	return Vector2(x,y)
	
func move(delta):
	counter += delta * speed
	
	if counter >= 1.0:
		if position.x <= 20 || position.x >= 1002 || position.y <= 20 || position.y >= 544 :
			return
		position = init_pos + dir * tile_size
		counter = 0.0
		moving = false
	else:
		if position.x <= 20 || position.x >= 1002 || position.y <= 20 || position.y >= 544 :
			return
		position = init_pos + dir * tile_size * counter
		
		