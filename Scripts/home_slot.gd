extends Area2D

class_name HomeSlot

signal frog_entered_home

@onready var home_frog_sprite: Sprite2D = $HomeFrogSprite



func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		frog_entered_home.emit()
		home_frog_sprite.show()
