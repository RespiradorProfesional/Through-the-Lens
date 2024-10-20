extends Base_level

func _on_play_animation_body_entered(body: Node2D) -> void:
	if body is Player:
		print("AA")
