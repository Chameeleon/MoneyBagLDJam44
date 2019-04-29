extends Node2D

var ducttapetimer = 0.0

func _ready():
	ProjectSettings.set("FetchBack",true)

func _physics_process(delta):


	if ducttapetimer > 2.0 :
		if ProjectSettings.get("PlayerPos") :
			if ProjectSettings.get("PlayerPos").x > 832 and ProjectSettings.get("PlayerPos").x < 1024 :
				ProjectSettings.set("FetchBack",true)
				ProjectSettings.set("FetchMoney",140)
			elif ProjectSettings.get("PlayerPos").x > 1700 :
				ProjectSettings.set("FetchBack",true)
				ProjectSettings.set("FetchMoney",ProjectSettings.get("Player").money)
				get_tree().change_scene("res://Levels/Level 4/Level 4.tscn")
	else :
		ducttapetimer += delta