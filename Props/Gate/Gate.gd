extends Sprite

var opened = false
var setter = 0
var PlayerPos = Vector2()
var chest = StreamTexture.new()
var chest_interact = StreamTexture.new()
var chest_open = StreamTexture.new()
var required = 40

func _ready():

	chest.load_path = "res://.import/sprite_0.png-5a061ccfd52e711d5a44ac8f320ff9aa.stex"
	chest_interact.load_path = "res://.import/sprite_1.png-ffd5ac9e4cfb5ebbd4ce55b740923824.stex"
	chest_open.load_path = "res://.import/sprite_2.png-a06a653da1fadff02fef62f46bb7bad2.stex"

func _physics_process(delta):

	if opened == false :

		PlayerPos = ProjectSettings.get("PlayerPos")

		if Rect2(Vector2(-128,-128) + self.global_position,Vector2(256,128)).has_point(PlayerPos) :
			setter = 2
			if Input.is_action_pressed("ui_interact") and ProjectSettings.get("Player").money > required :
				setter = 3
				opened = true
				ProjectSettings.get("Player").money -= required
				get_node("StaticBody2D").queue_free()
				get_node("AudioStreamPlayer2D").play(0.0)
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