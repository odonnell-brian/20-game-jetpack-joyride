extends Node2D

@export_category("Settings")
@export var score_per_second: float = 15.0

@export_category("Nodes")
@export var score_display: ScoreDisplay
@export var game_over_screen: GameOverController

var score: float = 0.0
var player: Player

func _ready() -> void:
	get_tree().paused = false
	Signals.player_death.connect(on_player_death)
	Signals.restart_level.connect(on_restart_level)

func _process(delta: float) -> void:
	if not get_tree().paused:
		score += delta * score_per_second
		score_display.update_score(get_score_int())

func on_player_death() -> void:
	get_tree().paused = true
	game_over_screen.show_game_over(get_score_int())

func get_score_int() -> int:
	return floori(score)

func on_restart_level() -> void:
	get_tree().call_deferred("reload_current_scene")
