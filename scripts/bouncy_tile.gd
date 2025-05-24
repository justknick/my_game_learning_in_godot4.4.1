extends Area2D

## Enter the applicble function name from the player script
@export var calls_method_name: String = "bounce"
@export var bounce_velocity: float = -500.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method(calls_method_name):
			body.bounce(bounce_velocity)
			#animated_sprite_2d.play("bounce")
			animation_player.play("bounce")
		else:
			print_debug(calls_method_name, " method not exist for:", body)
