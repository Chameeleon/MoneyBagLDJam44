extends Node2D

var hat = StreamTexture.new()
var monocle = StreamTexture.new()

func _ready():

	get_node("Camera2D").current = true

	hat.load_path = "res://.import/Hat.png.png-cd95ef36b23a1094d19e1b33773a1092.stex"
	if ProjectSettings.get("Hat") == true :
		get_node("Sprite").set_texture(hat)
	monocle.load_path = "res://.import/Monocle.png-55ee1b3ed09173972fee2df7b78deae9.stex"
	if ProjectSettings.get("Monocle") == true :
		get_node("Sprite2").set_texture(monocle)
	ProjectSettings.set("FetchBack",true)