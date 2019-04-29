extends KinematicBody2D

var timer = 0.0

func _physics_process(delta):

	if timer < 10 :
		timer += delta

	if timer > 2 :
		var scene = load("res://Enemy/Bullet/Bullet.tscn")
		var instance = scene.instance()
		instance.dir = Vector2(150,0)
		instance.global_position = self.global_position + Vector2(33,0)
		get_parent().get_parent().add_child(instance)
		timer = 0