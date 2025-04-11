extends Control

@export var level: PackedScene

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_packed(level)
