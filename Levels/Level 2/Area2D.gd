extends Area2D

var ducttapetimer = 0.0

func _ready():
	pass

func _physics_process(delta):
	if ducttapetimer > 5 :
		if ProjectSettings.get("PlayerPos") :
			if ProjectSettings.get("PlayerPos").x > 512 :
				ProjectSettings.set("FetchMoney",30)
				get_tree().change_scene("res://Levels/Level 3/Level 3.tscn")

	else :
		ducttapetimer += delta