extends Sprite

var opened = false
var setter = 0
var PlayerPos = Vector2()
var chest = StreamTexture.new()
var chest_interact = StreamTexture.new()
var chest_open = StreamTexture.new()

func _ready():

	chest.load_path = "res://.import/sprite_0.png-76b2e2c41dc21a085c567bf66668eb28.stex"
	chest_interact.load_path = "res://.import/sprite_1.png-1a044835b848254fa0f4254cae5cfdb3.stex"
	chest_open.load_path = "res://.import/sprite_2.png-c85bd6925ab3f5f90c1cb49774f19e93.stex"

func _physics_process(delta):

	if opened == false :

		PlayerPos = ProjectSettings.get("PlayerPos")

		if Rect2(Vector2(-128,-128) + self.global_position,Vector2(256,256)).has_point(PlayerPos) :
			setter = 2
			if Input.is_action_pressed("ui_interact") :
				setter = 3
				opened = true
				ProjectSettings.get("Player").money = 140
				get_node("RichTextLabel").set_percent_visible(1.0)
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