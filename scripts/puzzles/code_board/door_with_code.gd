extends Interactable

@onready var door_sprite=$door

@onready var panel_code=$panel_code
@onready var panel_textfield=$panel_code/TextEdit

@export var code : String
@export var door_close_texture : Texture
@export var door_open_texture : Texture

func _ready() -> void:
	door_sprite.texture=door_close_texture

func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		player.set_physics_process(true)
		panel_code.visible=false

func interact():
	player.set_physics_process(false)
	panel_code.visible=true

func _on_button_pressed() -> void:
	if panel_textfield.text==code:
		door_sprite.texture=door_open_texture
		$StaticBody2D/CollisionShape2D.disabled = true
		print("Crema")
	else:
		print("MAL")
