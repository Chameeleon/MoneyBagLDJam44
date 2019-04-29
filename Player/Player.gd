extends KinematicBody2D

var money = 140
var LastMoney = 0.0
var motion = Vector2()
var knockback = Vector2()
var knockbacktimer = 0.0
var isec = 0.0
var coyotetimer = 0.0
var MoneyBag = StreamTexture.new()
var walkcycle = 0.0
var hat = StreamTexture.new()
var monocle = StreamTexture.new()

func _ready():

	hat.load_path = "res://.import/Hat.png.png-cd95ef36b23a1094d19e1b33773a1092.stex"
	if ProjectSettings.get("Hat") == true :
		get_node("Sprite2").set_texture(hat)
	monocle.load_path = "res://.import/Monocle.png-55ee1b3ed09173972fee2df7b78deae9.stex"
	if ProjectSettings.get("Monocle") == true :
		get_node("Sprite3").set_texture(monocle)

func _physics_process(delta):

	if ProjectSettings.get("FetchBack") == true :
		money = ProjectSettings.get("FetchMoney")
		ProjectSettings.set("FetchBack",false)

	if Input.is_action_pressed("ui_restart") :
		get_tree().reload_current_scene()
	if money <= 0 :
		get_tree().reload_current_scene()

	ProjectSettings.set("PlayerPos",self.global_position)
	ProjectSettings.set("Player",self)

	if isec > -1 :
		isec -= delta
	if knockbacktimer > -1 :
		knockbacktimer -= delta
	if coyotetimer > -1 :
		coyotetimer -= delta

# Moving

	motion.y += 25

# Duct tape solution, looks bad
# DON'T TOUCH THE DUCT TAPE

	if test_move(self.global_transform,Vector2(0,1)) :
		coyotetimer = 0.5

	if knockbacktimer < 0 :

		motion.x = 0
	
		if Input.is_action_pressed("ui_left") :
			motion.x -= 350
			walkcycle += delta
			get_node("AnimatedSprite").set_flip_h(true)
			get_node("AnimatedSprite").position = Vector2(32,-30)
			get_node("AnimatedSprite")
			get_node("Sprite").set_flip_h(true)
			get_node("Sprite").position = Vector2(68,0)
			get_node("Sprite2").position = Vector2(30,0)
			get_node("Sprite3").position = Vector2(48,30)
		elif Input.is_action_pressed("ui_right") :
			motion.x += 350
			walkcycle += delta
			get_node("AnimatedSprite").set_flip_h(false)
			get_node("AnimatedSprite").position = Vector2(-32,-30)
			get_node("Sprite2").position = Vector2(38,0)
			get_node("Sprite").set_flip_h(false)
			get_node("Sprite").position = Vector2()
			get_node("Sprite3").position = Vector2(60,30)
		else :
			walkcycle = 0
	
		if Input.is_action_pressed("ui_jump") and coyotetimer > 0 :
			motion.y -= 850 + ((100 - money) * 2)
			get_node("AudioStreamPlayer").play(0.0)
			coyotetimer = -1

	motion += knockback

# ALSO DUCT TAPE DON'T TOUCH
# YES IT WORKS, DON'T TOUCH

	if knockback != Vector2() :
		knockback = Vector2()

	if motion.y < -1000 :
		motion.y = -1000

	motion = move_and_slide(motion,Vector2(0,-1))
	get_node("Camera2D/CanvasLayer/Label").set_text(str(money))

	if LastMoney != money :

		if money > 300 :
			MoneyBag.load_path = "res://.import/sprite_0.png-79d39963a2accc6a1e2f13cd1f5c051f.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 260 and money <= 300 :
			MoneyBag.load_path = "res://.import/sprite_1.png-37ff22a86d06e9c6bf813eeee5fb6c25.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 220 and money <= 260 :
			MoneyBag.load_path = "res://.import/sprite_2.png-bbab249f7d4580b828b978d5ef35f1ac.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 140 and money <= 180 :
			MoneyBag.load_path = "res://.import/sprite_3.png-b58b610976dd724fbb125687c1decaae.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 100 and money <= 140 :
			MoneyBag.load_path = "res://.import/sprite_4.png-9d9a367f7f9dedca24c0972d6e26b1e6.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 60 and money <= 100 :
			MoneyBag.load_path = "res://.import/sprite_5.png-588684e7e18646879ce1d62c10afef13.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money > 20 and money <= 60 :
			MoneyBag.load_path = "res://.import/sprite_6.png-09f87b76e838f24334aa268f892e6a4a.stex"
			get_node("Sprite").set_texture(MoneyBag)
		if money <= 20 :
			MoneyBag.load_path = "res://.import/sprite_7.png-b1d1819f6c95465269cd4c42520efed8.stex"
			get_node("Sprite").set_texture(MoneyBag)

	if walkcycle > 0.15 :
		get_node("AnimatedSprite").set_frame(get_node("AnimatedSprite").get_frame() + 1)
		walkcycle = 0.0
	if get_node("AnimatedSprite").get_frame() == 3 :
		get_node("AnimatedSprite").set_frame(0)

	if not is_on_floor() : 
		get_node("AnimatedSprite").set_frame(3)

	LastMoney = money

















