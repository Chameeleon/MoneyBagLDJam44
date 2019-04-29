extends Area2D

var dir = Vector2()

func _physics_process(delta):

	self.global_position += dir * delta

	if get_overlapping_bodies().size() > 0 :
		for i in range (0,get_overlapping_bodies().size()) :
			if get_overlapping_bodies()[i].get("money") :
				if get_overlapping_bodies()[i].isec < 0 :
					get_overlapping_bodies()[i].money -= 20
					get_overlapping_bodies()[i].isec = 1.0
				get_node("AudioStreamPlayer").play(0.0)
		self.queue_free()