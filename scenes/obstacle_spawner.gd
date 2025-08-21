class_name ObstacleManager
extends Node

@export_category("Nodes")
@export var spawn_timer: Timer
@export var marker_spawns: Dictionary[Marker2D, ObstacleSpawn]

@export_category("Settings")
@export var min_spawn_time = 2.0
@export var max_spawn_time = 3.0

func _ready() -> void:
	spawn_timer.timeout.connect(do_spawn)
	do_spawn()

func do_spawn() -> void:
	var marker_index = randi_range(0, marker_spawns.size() - 1)
	var possible_markers = marker_spawns.keys()

	var marker: Marker2D = possible_markers[marker_index]
	var obstacle_spawn := marker_spawns.get(marker) as ObstacleSpawn

	var obstacle_index = randi_range(0, obstacle_spawn.obstacles.size() - 1)
	var obstacle := obstacle_spawn.obstacles[obstacle_index].instantiate() as Node2D

	obstacle.position = marker.position
	add_child(obstacle)

	spawn_timer.start(randf_range(min_spawn_time, max_spawn_time))
