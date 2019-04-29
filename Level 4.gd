extends Node2D

func _ready() :

	ProjectSettings.set("FetchBack",true)

func _physics_process(delta):

	if ProjectSettings.get("PlayerPos") :
		if ProjectSettings.get("PlayerPos").x > 2304 :
			ProjectSettings.set("FetchMoney",ProjectSettings.get("Player").money)
			get_tree().change_scene("res://Levels/Level 5/Level 5.tscn")