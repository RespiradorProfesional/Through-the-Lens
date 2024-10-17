extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var lintern=$lintern
var light_active=false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if not light_active and Input.is_action_just_pressed("light_button"):
		light_active=true#esta variable es para que cuando la luz este activa el personaje no pueda parar de mirar en una direccion y va mas lento
		lintern.set_deferred("monitoring", true)
		lintern.visible=true

	elif light_active and Input.is_action_just_pressed("light_button"):
		light_active=false
		lintern.set_deferred("monitoring", false)
		lintern.visible=false
	

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction<0:
		$lintern.position=$light_left_marker.position
	elif direction>0:
		$lintern.position=$light_right_marker.position
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
