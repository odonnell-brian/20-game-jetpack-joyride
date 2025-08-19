class_name InputComponent
extends Node

func get_jump_input() -> bool:
	return Input.is_action_pressed("jump")
