extends Node2D


func _ready() -> void: 
	pass


func _process(_delta: float) -> void: 
	pass


func reset_world() -> void: 
	get_tree().change_scene_to_file("res://scenes/intro.tscn")


func _on_death_area_body_entered(body: Node2D) -> void:
	if body is Player:
		call_deferred("reset_world")
