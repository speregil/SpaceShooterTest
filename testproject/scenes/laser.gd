extends Area2D

@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0.1, 0.1)
	
func _process(delta):
	position.y -= speed * delta
