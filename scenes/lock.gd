extends StaticBody2D


func unlock() -> void:
	hide()
	#set_deferred("monitoring", false)
	queue_free()
