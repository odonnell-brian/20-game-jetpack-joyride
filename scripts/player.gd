extends CharacterBody2D

@export_category("Components")

@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var jump_component: JumpComponent
@export var animation_component: AnimationComponent

@export_category("Nodes")
@export var run_audio: AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta, input_component.get_jump_input())
	jump_component.handle_jump(self, input_component.get_jump_input(), delta)
	animation_component.handle_animation(jump_component.is_jumping, gravity_component.is_falling)

	if is_on_floor() and not run_audio.playing:
		run_audio.play()

	move_and_slide()
