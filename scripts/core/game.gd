extends Node2D

@export_category("Settings")
@export var score_per_second: float = 15.0

@export_category("Nodes")
@export var score_display: ScoreDisplay

var score: float = 0.0
var player: Player

func _ready() -> void:
	Signals.player_death.connect(on_player_death)

func _process(delta: float) -> void:
	score += delta * score_per_second
	score_display.update_score(score)

func on_player_death() -> void:
	print("BOOM")
	pass
