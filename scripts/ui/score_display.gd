class_name ScoreDisplay
extends Control

@export_category("Nodes")
@export var score_label: Label

func update_score(score: float) -> void:
	score_label.text = str(floori(score))
