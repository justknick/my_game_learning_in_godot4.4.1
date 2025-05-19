extends Area2D


func reset_world() -> void: 
	get_tree().change_scene_to_file("res://scenes/intro.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		#print_debug("hurt_tile touched by body: ", body)
		call_deferred("reset_world")
