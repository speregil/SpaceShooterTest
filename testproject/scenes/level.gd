extends Node2D

var asteroid_scene: PackedScene = load("res://scenes/asteroid.tscn")

func _on_asteroid_timer_timeout() -> void:
	var new_asteroid = asteroid_scene.instantiate()
	$Asteroids.add_child(new_asteroid) # Replace with function body.
