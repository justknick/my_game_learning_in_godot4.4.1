extends Area2D

@export var calls_method_name: String = "lava_block"
@onready var sizzle_sfx: AudioStreamPlayer = $SizzleSFX


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method(calls_method_name) and !body.is_hurt:
			body.lava_block(body)
			sizzle_sfx.play()
		else:
			print_debug(calls_method_name, " method not exist for:", body)
