extends Area2D

@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(0.2,0.2)
	$LaserImage.scale = Vector2(0, 0)
	var tween = create_tween()
	tween.tween_property($LaserImage,'scale',Vector2(1,1),0.2)
	
func _process(delta):
	position.y -= speed * delta
