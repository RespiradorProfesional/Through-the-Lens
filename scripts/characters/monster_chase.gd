extends CharacterBody2D

@onready var marked_final=$Marker2D
var position_final
const SPEED=200

func _ready() -> void:
	position_final=marked_final.position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if global_position.x< position_final.x:
		var direction := 1
		velocity.x = direction * SPEED
		move_and_slide()
