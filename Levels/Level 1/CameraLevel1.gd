extends Camera2D

var PlayerPos = Vector2()

func _physics_process(delta):

	PlayerPos = ProjectSettings.get("PlayerPos")

	if PlayerPos.x < 512 :
		self.global_position = Vector2()
	elif PlayerPos.x >= 512 and PlayerPos.x < 1536 :
		self.global_position = Vector2(1024,0)
	elif PlayerPos.x >= 1536 and PlayerPos.x < 2560 : 
		self.global_position = Vector2(2048,0)
	elif PlayerPos.x > 2560 :
		self.global_position = Vector2(3072,0)







