extends CanvasLayer

@onready var key_value: Label = $MarginContainer/VBoxContainer/KeysContainer/KeyValue
@onready var heart_1: TextureRect = $MarginContainer/VBoxContainer/HeartsContainer/Heart1
@onready var heart_2: TextureRect = $MarginContainer/VBoxContainer/HeartsContainer/Heart2
@onready var heart_3: TextureRect = $MarginContainer/VBoxContainer/HeartsContainer/Heart3


func _ready() -> void: 
	PlayerValues.keys_value_changed.connect(on_keys_value_changed)
	PlayerValues.hearts_value_changed.connect(on_hearts_value_changed)


func on_keys_value_changed() -> void: 
	key_value.text = str(PlayerValues.keys_amount)


func on_hearts_value_changed() -> void: 
	match(PlayerValues.hearts_amount):
		0: 
			heart_1.hide()
			heart_2.hide()
			heart_3.hide()
		1: 
			heart_1.show()
			heart_2.hide()
			heart_3.hide()
		2: 
			heart_1.show()
			heart_2.show()
			heart_3.hide()
		3: 
			heart_1.show()
			heart_2.show()
			heart_3.show()
	
