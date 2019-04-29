extends Node2D



func _ready():

	ProjectSettings.set("FetchBack",true)
	get_node("Gate").required = 110


