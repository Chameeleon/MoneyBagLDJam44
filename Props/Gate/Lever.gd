extends Sprite

var opened = false
var setter = 0
var PlayerPos = Vector2()
var chest = StreamTexture.new()
var chest_interact = StreamTexture.new()
var required = 40

func _ready():

	chest.load_path = "res://.import/sprite_0.png-5a061ccfd52e711d5a44ac8f320ff9aa.stex"
	chest_interact.load_path = "res://.import/sprite_1.png-ffd5ac9e4cfb5ebbd4ce55b740923824.stex"

func _physics_process(delta):

	if opened == false :

		PlayerPos = ProjectSettings.get("PlayerPos")

		if Rect2(Vector2(-128,-128) + self.global_position,Vector2(256,256)).has_point(PlayerPos) :
			setter = 2
			if Input.is_action_just_pressed("ui_interact") :
				get_child(0).position.y -= 64
				if get_child(0).global_position.y < 280 :
					get_child(0).global_position.y = 480
				get_node("AudioStreamPlayer").play(0.0)
		else :
			setter = 1

		if setter != 0 :
			if setter == 1 :
				set_texture(chest)
			if setter == 2 :
				set_texture(chest_interact)