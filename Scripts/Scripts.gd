extends KinematicBody2D

onready var game = get_node("/root/Game")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var prev_dir = Vector2(1,0)
var dir = Vector2(1,0)
var on_the_move = true

var moving = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	#print(get_node("/root/Game/Snake/Bodies").get_children())
	var is_moving = Input.is_action_pressed("move_up") || Input.is_action_pressed("move_down") || Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left")
	if  Input.is_action_pressed("move_down"):
		dir = Vector2(0,1)
	elif Input.is_action_pressed("move_up"):
		dir = Vector2(0,-1)
	elif Input.is_action_pressed("move_left"):
		dir = Vector2(-1,0)
	elif Input.is_action_pressed("move_right"):
		dir = Vector2(1,0)
	move()
	check_new_body()

func check_new_body():
	var temp = false
	for body in get_node("/root/Game/Snake/Bodies").get_children():
		temp = false
		for i in range(1,game.snake_parts.size()):
			if body.get_rid() == game.snake_parts[i].get_rid():
				temp = true
		if !temp:
			game.snake_parts.append(body)
			game.body_pos.append(body.position)
			game.body_dir.append(dir)


func move():
	prev_dir = dir
	position += dir * 4
	if game.snake_parts.size() != 0:
		for i in range(game.snake_parts.size() -1, -1,-1):
			game.snake_parts[i].move_body(i)
	
	

	

	
	