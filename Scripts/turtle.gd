extends Area2D

class_name Turtle

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func set_sprite_rotation_degrees(degrees):
	sprite_2d.rotation_degrees = degrees
