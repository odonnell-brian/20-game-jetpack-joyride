class_name GameOverController
extends Control

func _ready() -> void:
	%RestartButton.pressed.connect(on_restart)
	hide()

func show_game_over(score: int):
	%ScoreLabel.text = %ScoreLabel.text.replace("%score%", str(score))
	show()

func on_restart() -> void:
	Signals.restart_level.emit()
