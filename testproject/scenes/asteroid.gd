extends Area2D

@export var min_speed: int = 200
@export var max_speed: int = 500
var speed: int
@export var min_rotation_speed = 40
@export var max_rotation_speed = 100
var rotation_speed: int
var direction_x: float

signal collision
 
func _ready():
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://sprites/planets/Planet_0" + str(rng.randi_range(1,4)) + ".png"
	$asteroidImage.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	scale = Vector2(0.1, 0.1)
	
	speed = rng.randi_range(min_speed, max_speed)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(min_rotation_speed, max_rotation_speed)
	
func _process(delta):
	position += Vector2(direction_x,1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
