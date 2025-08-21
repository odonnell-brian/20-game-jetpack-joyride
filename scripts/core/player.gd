class_name Player
extends CharacterBody2D

const OBSTACLE_GROUP: String = "obstacle"

@export_category("Components")

@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var jump_component: JumpComponent
@export var animation_component: AnimationComponent

@export_category("Nodes")
@export var run_audio: AudioStreamPlayer2D

func _ready() -> void:
	$HitBox.area_entered.connect(handle_collision)
	$HitBox.body_entered.connect(handle_collision)

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta, input_component.get_jump_input())
	jump_component.handle_jump(self, input_component.get_jump_input(), delta)
	animation_component.handle_animation(jump_component.is_jumping, gravity_component.is_falling)

	if is_on_floor() and not run_audio.playing:
		run_audio.play()

	$Particle.emitting = jump_component.is_jumping

	move_and_slide()

func handle_collision(node: Node2D) -> void:
	if Utils.is_in_group(node, OBSTACLE_GROUP):
		Signals.player_death.emit()
