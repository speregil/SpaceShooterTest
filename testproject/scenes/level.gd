extends Node2D

var asteroid_scene: PackedScene = load("res://scenes/asteroid.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health: int = 5

func _ready():
	get_tree().call_group('ui', 'set_health', health)
	
func _on_asteroid_timer_timeout() -> void:
	var new_asteroid = asteroid_scene.instantiate()
	$Asteroids.add_child(new_asteroid)
	new_asteroid.connect('collision', on_asteroid_collision)
	
func on_asteroid_collision():
	health -= 1
	print(health)
	get_tree().call_group('ui', 'set_health', health)
	if health < 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
