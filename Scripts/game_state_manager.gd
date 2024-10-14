extends Node

class_name GameState

@onready var player: Player = $"../Player"
@onready var home_slots: HomeSlots = $"../HomeSlots"
@onready var ui: UI = $"../UI"






func _ready():
	home_slots.all_home_slots_filled.connect(on_all_home_slots_filled)
	home_slots.home_slot_filled.connect(on_home_slot_filled)
	player.life_lost.connect(on_player_life_lost)
	player.game_lost.connect(on_game_lost)
	ui.timer_runs_out.connect(kill_player)
	ui.set_lives(player.lives)


func on_player_life_lost():
	ui.reset_timer()
	

func on_game_lost():
	ui.show_lose_ui()


func kill_player():
	player.die()
	ui.lose_life()
	

func on_home_slot_filled():
	player.reset_player()


func on_all_home_slots_filled():
	ui.show_win_ui()
