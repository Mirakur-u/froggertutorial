extends CanvasLayer

class_name UI

const MAX_TIMER_VALUE = 30

signal timer_runs_out

@onready var lives_container: HBoxContainer = $MarginContainer/HBoxContainer/LivesContainer
@onready var timeout_timer: Timer = $TimeoutTimer
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var center_container: CenterContainer = $MarginContainer/CenterContainer
@onready var game_result_label: Label = $MarginContainer/CenterContainer/PanelContainer/VBoxContainer/GameResultLabel
@onready var panel_container: PanelContainer = $MarginContainer/CenterContainer/PanelContainer

var life_texture = preload("res://Assets/FroggerIdle.png")
var lifex_texture: Array[TextureRect] = []


func set_lives(lives_amount: int):
	for i in lives_amount:
		var texture_rect = TextureRect.new()
		texture_rect.custom_minimum_size = Vector2(32,16)
		texture_rect.texture = life_texture
		lives_container.add_child(texture_rect)
		lifex_texture.append(texture_rect) 



func _ready() -> void:
	timeout_timer.timeout.connect(on_timeout)
	timeout_timer.start()



func on_timeout():
	var new_progress_bar_value = progress_bar.value -1
	progress_bar.set_value(new_progress_bar_value)
	if new_progress_bar_value == 0:
		timer_runs_out.emit()
		timeout_timer.stop()
	

func reset_timer():
	progress_bar.set_value(MAX_TIMER_VALUE)
	timeout_timer.start()

func lose_life():
	var life_texture = lifex_texture.pop_back()
	life_texture.queue_free()

func show_win_ui():
	timeout_timer.stop()
	game_result_label.text = "You Won!"
	panel_container.theme_type_variation = "PanelContainer"
	center_container.show()
	


func show_lose_ui():
	timeout_timer.stop()
	game_result_label.text = "You Lost!"
	panel_container.theme_type_variation = "Red"
	center_container.show()

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
