extends CanvasLayer

static var image = load("res://sprites/other/life.png")
var time_elapsed := 0

func set_health(amount):
	for child in $LifesContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_SCALE
		text_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
		$LifesContainer.add_child(text_rect)


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$SocoreContainer/ScoreLabel.text = str(time_elapsed)
	Global.score = time_elapsed
