extends Base_level

@onready var play_animation=$play_animation

func new_ready():
	Dialogic.signal_event.connect(on_dialogic_signal)



func on_dialogic_signal(argument: String):
	if argument=="off_lights":
		player.camera2d.start_shake(0.5, 10.0) 
		play_animation.monitoring = false
	
	player.set_physics_process(true)

func _on_play_animation_body_entered(body: Node2D) -> void:
	if body is Player:
		player.camera2d.start_shake(100, 5.0) 
		player.set_physics_process(false)
		Dialogic.start("res://dialogic_things/scene3/scene3_montana_bad_state.dtl")
