extends Camera2D

@onready var light_area=$light_area
@onready var captured_area=$captured_area
# Velocidad de movimiento de la cámara
var speed := 200
var limite_right
var limite_left
var limite_top
var limite_bot

signal area_detected_light(area)
signal area_detected_photo(area)

func _ready() -> void:
	limite_right=$limit_right.global_position.x
	limite_left=$limit_left.global_position.x
	limite_top=$limit_top.global_position.y
	limite_bot=$limit_bottom.global_position.y
	
	captured_area.set_deferred("monitoring", false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		print(GlobalData.scene_player)
		get_tree().change_scene_to_file(GlobalData.scene_player)

	if light_area.visible and Input.is_action_just_pressed("light_button"):
		light_area.visible=false
		light_area.set_deferred("monitoring", false)
	elif Input.is_action_just_pressed("light_button"):
		light_area.visible=true
		light_area.set_deferred("monitoring", true)
	
	if Input.is_action_just_pressed("ui_accept"):
		captured_area.set_deferred("monitoring", true)
		$captured_timer.start()

func _process(delta):

	var direction = Vector2.ZERO
	# Capturamos el input del jugador para mover la cámara
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	# Normalizamos el vector de dirección para tener un movimiento uniforme en diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	var new_position=position+(direction * speed * delta)
	
	if new_position.x<limite_right and new_position.x>limite_left:
		position.x = new_position.x
	if new_position.y<limite_bot and new_position.y>limite_top:
		position.y = new_position.y


func _on_light_area_area_entered(area: Area2D) -> void:
	area_detected_light.emit(area)


func _on_captured_area_area_entered(area: Area2D) -> void:
	area_detected_photo.emit(area)


func _on_captured_timer_timeout() -> void:
	captured_area.set_deferred("monitoring", false)
