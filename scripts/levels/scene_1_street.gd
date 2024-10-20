extends Base_level


func new_ready():
	Dialogic.signal_event.connect(on_dialogic_signal)
	Dialogic.start("res://dialogic_things/scene1/scene1_start_game.dtl")
	player.set_physics_process(false)


func on_dialogic_signal(argument: String):
	if argument=="finish_dialogue":
		player.set_physics_process(true)
