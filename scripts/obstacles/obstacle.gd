extends Node2D

@export_category("Nodes")
@export var scroll_component: ScrollComponent

func _ready() -> void:
	if not scroll_component:
		scroll_component = $ScrollComponent

func _physics_process(delta: float) -> void:
	scroll_component.handle_scroll(self, delta)
