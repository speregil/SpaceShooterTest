extends Node2D

var asteroid_scene: PackedScene = load("res://scenes/asteroid.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_asteroid_timer_timeout() -> void:
	var new_asteroid = asteroid_scene.instantiate()
	$Asteroids.add_child(new_asteroid)


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
