extends Node

## Variables 
var keys_amount: int = 0
var hearts_amount: int = 3


## Signals
signal keys_value_changed
signal hearts_value_changed
signal reset_world(body: Node2D)


## When Player loses, reset level
func reset_keys() -> void: 
	keys_amount = 0
	hearts_amount = 3


## When Player collects a key, add 1 point to the score
func alter_keys(value: int) -> void: 
	keys_amount += value
	#print("Total Keys: ", keys_amount) 
	keys_value_changed.emit()


## When Player gets hurt/gains health
func alter_hearts(value: int) -> int: 
	hearts_amount += value
	#print("Total Hearts: ", hearts_amount) 
	hearts_value_changed.emit()
	return hearts_amount
