extends Node2D

class_name  TurtleSection
const TURTLE_SIZE = 64


@onready var turtle_scene = preload("res://Scenes/turtle.tscn")

var turtle_count = 3
var movement_direction = 1

func _ready() -> void:
	var section_length = turtle_count * TURTLE_SIZE
	for i in turtle_count:
		var turtle = turtle_scene.instantiate() as Turtle
		add_child(turtle)
		
		
		if movement_direction == 1:
			turtle.set_sprite_rotation_degrees(180)
		
		turtle.position.x = TURTLE_SIZE / 2 - TURTLE_SIZE * i
	

func get_section_length():
	return turtle_count * TURTLE_SIZE
