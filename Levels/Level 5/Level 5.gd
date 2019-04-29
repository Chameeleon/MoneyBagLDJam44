extends Node2D

func _ready() :

	ProjectSettings.set("FetchBack",true)

func _physics_process(delta):

	if ProjectSettings.get("PlayerPos") :
		if ProjectSettings.get("PlayerPos").x > 3200 :
			ProjectSettings.set("FetchMoney",ProjectSettings.get("Player").money)
			get_tree().change_scene("res://Levels/Conglaturation/Conglaturation.tscn")