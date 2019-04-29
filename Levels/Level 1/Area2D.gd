extends Area2D

func _physics_process(delta):

	if get_overlapping_bodies().size() > 1 :
		get_tree().change_scene("res://Levels/Level 2/Level 2.tscn")
		ProjectSettings.set("FetchMoney",ProjectSettings.get("Player").money)