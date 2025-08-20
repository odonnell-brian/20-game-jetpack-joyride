extends CharacterBody2D

@export_category("Components")

@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var jump_component: JumpComponent
@export var animation_component: AnimationComponent

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta, input_component.get_jump_input())
	jump_component.handle_jump(self, input_component.get_jump_input(), delta)
	animation_component.handle_animation(jump_component.is_jumping, gravity_component.is_falling)

	move_and_slide()
