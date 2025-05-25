extends Node2D

@onready var spawn_point: Marker2D = $SpawnPoint
@onready var player: Player = $Player


func _ready() -> void: 
	spawn_player()
	PlayerValues.reset_world.connect(_on_death_area_body_entered)


func spawn_player() -> void:
	player.global_position = spawn_point.global_position


func reset_world() -> void: 
	PlayerValues.reset_keys()
	get_tree().change_scene_to_file("res://scenes/intro.tscn")


func _on_death_area_body_entered(body: Node2D) -> void:
	if body is Player:
		call_deferred("reset_world")
	else:
		call_deferred("queue_free")
