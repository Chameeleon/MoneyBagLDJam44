extends Area2D

var knockback = Vector2(0,-1000)
var hit = false
var hitpos = Vector2()
var hittimer = 0.0

func _physics_process(delta):

	if get_overlapping_bodies().size() > 0 :
		for i in range (0,get_overlapping_bodies().size()) :
			if get_overlapping_bodies()[i].get("money") :
				if get_overlapping_bodies()[i].isec < 0 :
					get_overlapping_bodies()[i].money -= 20
					get_overlapping_bodies()[i].knockback = knockback
					get_overlapping_bodies()[i].coyotetimer = -2
					get_overlapping_bodies()[i].isec = 1.0
					hit = true
					hitpos = get_overlapping_bodies()[i].global_position
					get_node("AnimatedSprite").global_position.x = hitpos.x
					get_node("AnimatedSprite").set_frame(0)
					get_node("AudioStreamPlayer").play(0.0)

	if hit == true :
		hittimer += delta
		if hittimer > 0.05 :
			get_node("AnimatedSprite").set_frame(get_node("AnimatedSprite").get_frame() + 1)
			hittimer = 0.0
		if get_node("AnimatedSprite").get_frame() == 3 :
			hit = false