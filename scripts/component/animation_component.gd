class_name AnimationComponent
extends Node

@export_category("Nodes")
@export var animated_sprite: AnimatedSprite2D

func handle_animation(is_jumping: bool, is_falling: bool) -> void:
	var animation_name = "run"

	if is_jumping:
		animation_name = "jump"
	elif is_falling:
		animation_name = "fall"

	if animated_sprite.animation != animation_name:
		animated_sprite.play(animation_name)
