class_name JumpComponent
extends Node

@export_category("Settings")

@export var jump_velocity: float = -150.0
@export var jump_accel: float = 1000.0

@export_category("Optional Nodes")
@export var audio_player: AudioStreamPlayer2D

var is_jumping: bool = false

func handle_jump(body: CharacterBody2D, jump_pressed: bool, delta: float) -> void:
	if jump_pressed:
		var new_velocity = move_toward(body.velocity.y, jump_velocity, jump_accel * delta)
		body.velocity.y = new_velocity

	is_jumping = jump_pressed

	play_audio()

func play_audio() -> void:
	if not audio_player:
		return

	if audio_player.playing and not is_jumping:
		audio_player.stop()
	elif not audio_player.playing and is_jumping:
		audio_player.play()
