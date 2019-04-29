extends Sprite

var opened = false
var setter = 0
var PlayerPos = Vector2()
var chest = StreamTexture.new()
var chest_interact = StreamTexture.new()
var chest_open = StreamTexture.new()
var required = 100
var hat = StreamTexture.new()

func _ready():

	chest.load_path = "res://.import/sprite_0.png-65feddd4fe8522f26e259b299dfa78a2.stex"
	chest_interact.load_path = "res://.import/sprite_1.png-50ef471e83a2d63f7625e24f3c8eb314.stex"
	chest_open.load_path = "res://.import/sprite_2.png-57b2f126d11c69ba51d8d249a1e16ab6.stex"
	hat.load_path = "res://.import/Hat.png.png-cd95ef36b23a1094d19e1b33773a1092.stex"

func _physics_process(delta):

	if opened == false :

		PlayerPos = ProjectSettings.get("PlayerPos")

		if Rect2(Vector2(-128,-128) + self.global_position,Vector2(256,128)).has_point(PlayerPos) :
			setter = 2
			if Input.is_action_pressed("ui_interact") and ProjectSettings.get("Player").money > required :
				setter = 3
				opened = true
				ProjectSettings.get("Player").money -= required
				ProjectSettings.get("Player").get_node("Sprite2").set_texture(hat)
				ProjectSettings.set("Hat",true)
				get_node("AudioStreamPlayer").play(0.0)
		else :
			setter = 1

		if setter != 0 :
			if setter == 1 :
				set_texture(chest)
			if setter == 2 :
				set_texture(chest_interact)
			if setter == 3 :
				set_texture(chest_open)
			setter = 0