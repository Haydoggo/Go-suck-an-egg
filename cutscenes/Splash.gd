extends TextureRect

var stage = 0


func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("tap"):
		match stage:
			0:
				$Intro.hide()
				var tween = create_tween()
				tween.tween_property(self, "self_modulate", Color(0.2, 0.2, 0.25), 0.5)
				yield(tween,"finished")
				$NextDay.show()
			1:
				var tween = create_tween()
				tween.tween_property(self, "rect_position", Vector2(0, 600), 0.5).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
				yield(tween,"finished")
				queue_free()
		stage += 1
