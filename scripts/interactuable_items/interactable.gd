extends Area2D
class_name Interactable

@export var new_route : String
var body_in_interact=false

func _process(delta: float) -> void:
	if body_in_interact:
		if Input.is_action_just_pressed("interact"):
			interact()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body_in_interact=true

func _on_body_exited(body: Node2D) -> void:
	body_in_interact=false

#Sustituir interact si no habre una nueva escena

func interact():
	get_tree().change_scene_to_file(new_route)
