extends Node2D

@onready var animation_player=$AnimationPlayer
@onready var label=$AnimationPlayer/Label
@onready var camera=$Camera2D

func exit_cam():
	camera.set_process(false)
	animation_player.play("photo_realized")
	label.position=$Camera2D.position

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name=="photo_realized":
		get_tree().change_scene_to_file("res://scene/test/test_level.tscn")

func _on_camera_2d_area_detected_light(area: Area2D) -> void:
	if area is Monster:
		monster_detected_light(area)

func _on_camera_2d_area_detected_photo(area: Area2D) -> void:
	if area is Monster:
		monster_detected_photo(area)

#Modificar en las clases hijas

func monster_detected_light(monster: Area2D) -> void:
	pass

func monster_detected_photo(monster: Area2D) -> void:
	exit_cam()
