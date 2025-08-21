class_name ScrollComponent
extends Node

@export_category("Settings")
@export var speed_x: float = -100.0
@export var speed_y: float = 0.0

func handle_scroll(node: Node2D, delta: float) -> void:
	node.position += Vector2(delta * speed_x, delta * speed_y)
