extends Area2D

@export var new_scene : String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().change_scene_to_file(new_scene)
		GlobalData.last_position_player=null
		GlobalData.scene_player=new_scene
