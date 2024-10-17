extends Interactable

@export var texture_door : Texture
@export var texture_panel : Texture

@onready var panel_code=$panel_code
@onready var panel_textfield=$panel_code/TextEdit

@export var player : Player
@export var code : String

func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		player.set_physics_process(true)
		panel_code.visible=false

func interact():
	player.set_physics_process(false)
	panel_code.visible=true

func _on_button_pressed() -> void:
	if panel_textfield.text==code:
		print("Crema")
	else:
		print("MAL")
