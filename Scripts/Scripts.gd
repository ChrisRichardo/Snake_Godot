extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2()

const UP = Vector2(0,-1)
const DOWN = Vector2(0,1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)

var velocity = Vector2()

var speed = 0
const MAXSPEED = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if Input.is_action_pressed("move_up") || Input.is_action_pressed("move_down") || Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		speed = MAXSPEED
		if Input.is_action_pressed("move_up"):
			direction = UP
		if Input.is_action_pressed("move_down"):
			direction = DOWN
		if Input.is_action_pressed("move_left"):
			direction = LEFT
		if Input.is_action_pressed("move_right"):
			direction = RIGHT
	else :
		speed = 0
		
	velocity = speed * direction * delta
#warning-ignore:return_value_discarded
	var kb2d = move_and_collide(velocity)
	if kb2d:
		var collideWith = kb2d.collider
		
		if collideWith.is_in_group("Food"):
			collideWith.queue_free()
			get_node("/root/Game").spawn_food()
			get_node("/root/Game").length += 1
			
	#if kb2d == KinematicCollision2D.new(1