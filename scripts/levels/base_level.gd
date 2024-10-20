extends Node
class_name Base_level

@onready var player=$Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalData.last_position_player!=null:
		player.global_position =GlobalData.last_position_player
	
	new_ready()


#para sustituir

func new_ready():
	pass
