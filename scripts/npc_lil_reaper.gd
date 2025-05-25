extends Area2D

@export var lock: StaticBody2D

@onready var objective_text: RichTextLabel = $ObjectiveText
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var typing_sfx: AudioStreamPlayer = $TypingSFX

var dialog_show = "Find the keys"
var dialog_success = "Nice work. You may enter"


func _ready() -> void:
	objective_text.hide()


func interact(active: bool) -> void:
	if active:
		# display quest dialog
		if PlayerValues.keys_amount < 3:
			objective_text.text = dialog_show
			animation_player.play("show_objective")
		# display success dialog
		elif PlayerValues.keys_amount >= 3:
			objective_text.text = dialog_success
			animation_player.play("success")
	elif !active:
		objective_text.hide()


func unlock() -> void:
	if lock != null:
		if lock.visible == true:
			lock.unlock()
			#lock.queue_free()


func play_button_sound() -> void: 
	typing_sfx.play()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		interact(true)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		interact(false)
