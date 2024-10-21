extends Area2D

@export var new_scene : String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GlobalData.last_position_player=null
		GlobalData.scene_player=new_scene
		call_deferred("change_scene_deferred", new_scene)

func change_scene_deferred(new_scene: String) -> void:
	get_tree().change_scene_to_file(new_scene)
