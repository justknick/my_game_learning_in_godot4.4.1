extends Area2D

## Enter the applicble function name from the player script
@export var calls_method_name: String = "fast_block"


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method(calls_method_name):
			body.fast_block(true)
		else:
			print_debug(calls_method_name, " method not exist for:", body)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method(calls_method_name):
			body.fast_block(false)
		else:
			print_debug(calls_method_name, " method not exist for:", body)
