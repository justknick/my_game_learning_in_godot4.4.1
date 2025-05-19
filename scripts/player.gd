extends CharacterBody2D

class_name Player

@export var speed: float = 300.0
@export var speed_multiplier: int = 2

@onready var debug_state: Label = $debug_state

var is_in_fast_block_state: bool = false

const JUMP_VELOCITY = -400.0

# for reseting the level when player is defeated
var is_resetting


func _ready() -> void:
	label()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	jump()
	# Get the input direction and handle the movement/deceleration.
	movement()
	
	label() 
	
	move_and_slide()


## DEBUG STUFF
func label() -> void:
	debug_state.text = "fast block: " + str(is_in_fast_block_state)


## Player Controls
func movement() -> void: 
	if !is_in_fast_block_state:
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)


func jump() -> void: 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY



## Player Interaction with Map
func fast_block(active: bool) -> void: 
	if active:
		is_in_fast_block_state = true
		speed = 800.0
		velocity.x = speed
	else:
		is_in_fast_block_state = false
		speed = 300.0
		movement()


func bounce(bounce_vel: float) -> void: 
	velocity.y = bounce_vel
