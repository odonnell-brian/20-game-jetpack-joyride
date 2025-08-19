extends CharacterBody2D

@export_category("Components")

@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var jump_component: JumpComponent

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	jump_component.handle_jump(self, input_component.get_jump_input(), delta)

	move_and_slide()
