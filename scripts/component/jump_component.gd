class_name JumpComponent
extends Node

@export_category("Settings")

@export var jump_velocity: float = -200.0
@export var jump_accel: float = 1250.0

var is_jumping: bool = false

func handle_jump(body: CharacterBody2D, jump_pressed: bool, delta: float) -> void:
	if jump_pressed:
		var new_velocity = move_toward(body.velocity.y, jump_velocity, jump_accel * delta)
		body.velocity.y = new_velocity

	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
