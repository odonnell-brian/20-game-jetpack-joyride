class_name GravityComponent
extends Node

@export_category("Settings")

## The rate at which the CharacterBody2D will fall, in pixels per second
@export var gravity: float = 750

var is_falling = false

func handle_gravity(body: CharacterBody2D, delta: float, is_jumping: bool) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta

	is_falling = !is_jumping and !body.is_on_floor()
