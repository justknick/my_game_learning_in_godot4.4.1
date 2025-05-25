extends Area2D

@onready var key_jingle_sfx: AudioStreamPlayer = $KeyJingleSFX


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		PlayerValues.alter_keys(1)
		key_jingle_sfx.play()
		hide()
		set_deferred("monitoring", false)


func _on_key_jingle_sfx_finished() -> void:
	queue_free()
	## eventually replace this 
	print("key collected") 
