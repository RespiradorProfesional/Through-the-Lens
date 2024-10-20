extends Interactable

@export var dialogic_route : String

func _ready() -> void:
	Dialogic.signal_event.connect(on_dialogic_signal)

func interact():
	player.set_physics_process(false)
	Dialogic.start(dialogic_route)


func on_dialogic_signal(argument: String):
	if argument=="finish_dialogue":
		player.set_physics_process(true)
