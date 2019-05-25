extends Node2D

var snake_parts = []
var length = 0 setget set_score
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_score(value):
	length = value
	get_node("Length").set_text("Length: " + str(length))
# Called when the node enters the scene tree for the first time.
func _ready():
	#snake_parts.push_back(get_node("Snake/Head").position)
	spawn_food()

func spawn_food():
	randomize()
	var food = preload("res://Mini Scenes/Food.tscn").instance()
	var x = rand_range(20,1004)
	var y = rand_range(32,544)
	var pos = Vector2(x,y)
	food.set_position(pos)
	get_node("Foods").add_child(food)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
