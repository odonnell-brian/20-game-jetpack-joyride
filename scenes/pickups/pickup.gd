class_name Pickup
extends Area2D

@export var scroll_component: ScrollComponent

var picked_up: bool = false
var pickup_audio: AudioStreamPlayer2D

func _ready() -> void:
	body_entered.connect(handle_collision)
	pickup_audio = get_node_or_null("AudioStreamPlayer2D")

func _process(delta: float) -> void:
	scroll_component.handle_scroll(self, delta)

func handle_collision(node: Node2D) -> void:
	if not node is Player:
		return

	(node as Player).pickup_collected.emit(self)

	if pickup_audio:
		pickup_audio.finished.connect(on_pickup_complete)
		pickup_audio.play()

	hide()

func on_pickup_complete() -> void:
	queue_free()
